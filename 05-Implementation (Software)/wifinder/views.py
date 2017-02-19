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
            FROM ratings JOIN wifinames ON (ratings.wifiid = wifinames.id) JOIN (
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
        data = [[row[0],int(row[1]),int(row[2]),round(row[3]*1000,1)] for row in c.fetchall()]
        
        c.close()
        
        return render(request,"wifinder/results.html",{"results":data})
#    except Exception:
#        return index(request)

def thanks(request):
    if 0:
        db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder")
        c = db.cursor()
        c.execute("""
            INSERT INTO ratings(wifiid,day,time,capability,quality,proxy,rating)
            VALUES(%s,%s)
            ;commit;"""%(",".join([request.POST["a%d"%i] for i in xrange(1,7)]),request.POST["rate"])
        )
        c.close()
    return render(request,"wifinder/thanks.html",{"request":request.POST})