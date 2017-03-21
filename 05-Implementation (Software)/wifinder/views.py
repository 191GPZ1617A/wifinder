from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
import MySQLdb

def index(request):
    db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder192")
    c = db.cursor()
    lng = c.execute("""
        SELECT name,locID
        FROM locations
        ;"""
    )
    locations = {int(i[1]):i[0] for i in c.fetchall()}
    print locations
    return render(request,"wifinder/home.html",{"locations":locations})

def results(request):
#    try:
        print request.POST.viewitems()
        db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder192")
        c = db.cursor()
        res = c.execute("""
            SELECT lat, lng
            FROM locations
            WHERE locID = %s
            ;""" % request.POST["loc"]
        )
        res = c.execute("""
            SELECT name, wifiid, AVG(rating), dist.distance AS distance
            FROM
                (
                    SELECT *
                    FROM ratings UNION (
                        SELECT 0, id, 0, ""
                        FROM wifinames
                        WHERE id NOT IN (
                            SELECT wifiid
                            FROM ratings
                        )
                    )
                ) rates
                JOIN wifinames ON (
                    rates.wifiid = wifinames.id
                )
                JOIN (
                    SELECT locID, (
                        6371 * acos(
                            cos(radians({0})) *
                            cos(radians(lat)) *
                            cos(radians(lng) - radians({1})) +
                            sin(radians({0})) *
                            sin(radians(lat))
                        )
                    ) AS distance
                    FROM locations
                    ORDER BY distance
                    LIMIT 0 , 5
                ) dist ON (dist.locID = wifinames.location)
            GROUP BY wifiid
            ORDER BY dist.distance
            ;""".format(*(c.fetchall()[0]))
        )
        data = [[row[0],int(round(row[1])),int(round(row[2])),round(row[3]*1000,1)] for row in c.fetchall()]
        c.close()
        
        return render(request,"wifinder/results.html",{
            "results": data,
            "src": request.POST["loc"]
        })
#    except Exception:
#        return index(request)

def wifi(request,src,dst):
    print request.POST.viewitems()
    db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder192")
    c = db.cursor()
    res = c.execute("""
        SELECT lat, lng
        FROM locations
        WHERE locID in (
            SELECT location
            FROM wifinames
            WHERE id = %s
        )
        ;""" % (int(src))
    )
    res = c.execute("""
        SELECT name, wifiid, AVG(rating), dist.distance AS distance, locID
        FROM
            (
                SELECT *
                FROM ratings UNION (
                    SELECT 0, id, 0, ""
                    FROM wifinames
                    WHERE id NOT IN (
                        SELECT wifiid
                        FROM ratings
                    )
                )
            ) rates
            JOIN wifinames ON (
                rates.wifiid = wifinames.id
            )
            JOIN (
                SELECT locID, (
                    6371 * acos(
                        cos(radians({1})) *
                        cos(radians(lat)) *
                        cos(radians(lng) - radians({2})) +
                        sin(radians({1})) *
                        sin(radians(lat))
                    )
                ) AS distance
                FROM locations
            ) dist ON (
                dist.locID = wifinames.location
            )
        WHERE wifiid = {0}
        ;""".format(dst,*(c.fetchall()[0]))
    )
    data = [[row[0],int(round(row[1])),int(round(row[2])),round(row[3]*1000,1),int(row[4])] for row in c.fetchall()][0]
    res = c.execute("""
        SELECT rating, comment
        FROM ratings
        WHERE wifiid = {}
        """.format(dst)
    )
    revs = [{"rate":int(row[0]),"comment":row[1]} for row in c.fetchall()]
    print "revs",revs;
    c.close()
    
    return render(request,"wifinder/wifi.html",{"wifi":data,"reviews":revs})

def thanks(request):
    if "rate" in request.POST.keys():        db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder192")
        c = db.cursor()
        c.execute("""
            INSERT INTO ratings(wifiid,rating,comment)
            VALUES({},{},"{}")
            ;COMMIT;""".format(*(request.POST[key] for key in ("wifiid","rate","comment")))
        )
        c.close()
    return render(request,"wifinder/thanks.html",{"request":request.POST})