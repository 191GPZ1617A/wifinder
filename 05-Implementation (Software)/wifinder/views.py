from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from sklearn import tree
import MySQLdb

def index(request):
    db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder192")
    c = db.cursor()
    lng = c.execute("""
        SELECT name
        FROM locations
        ;"""
    )
    locations = [i[0] for i in c.fetchall()]
    print locations
    return render(request,"wifinder/home.html",{"locations":locations})

def results(request):
#    try:
        print request.POST.viewitems()
        return index(request)
        labels = ("day","time")
        day,time = [request.POST[name] for name in labels]
        day = "M" if day=="M" else "TTH" if "T" in day else "WF"
        HR, MN = int(time[:2]),int(time[3:])+7
        hr,mn = HR+(1 if MN>60 else 0),1 if MN>=30 else 0
        if hr<=8 and not mn:
            time = "7:00-8:30"
        elif hr<10:
            time = "8:30-10:00"
        elif hr<=11 and not mn:
            time = "10:00-11:30"
        elif hr<13:
            time = "11:30-1:00"
        elif hr<=14 and not mn:
            time = "1:00-2:30"
        elif hr<16:
            time = "2:30-4:00"
        else:
            time = "4:00-5:30"
        try:
            tm=int(time[:2])
        except Exception:
            tm=int(time[0])
        x=(
            ("M","TTH","WF").index(day)+1,    # day of week
            (7,8,10,11,1,2,4).index(tm)+1)
        db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder")
        c = db.cursor()
        lng = c.execute("""
            SELECT wifiid,  AVG(capability), AVG(quality), AVG(rating), CEILING(AVG(proxy))
            FROM ratings
            WHERE day=%s AND time=%s
            GROUP BY wifiid
            ;"""%(x[0],x[1])
        )
        data = [[int(i) for i in j] for j in c.fetchall()]
        
        clf = tree.DecisionTreeClassifier().fit([data[i][1:] for i in xrange(lng)],[data[i][0] for i in xrange(lng)])
        
        
        test=[[
            4,      # capability
            5,      # quality
            5,      # rating
            0,      # proxy
        ]]
        
        wifi = clf.predict(test)
        
        c.execute("""
            SELECT name,wifiid,capability,quality,proxy,rating
            FROM ratings join wifinames on (wifiid=wifinames.id)
            WHERE wifinames.id=%d AND day=%s AND time=%s
            ;"""%((wifi,)+x)
        )
        results =c.fetchall()[0]
        
        c.close()
        
        return render(request,"wifinder/results.html",{"x":x,"res":[(x+results[1:])[i-1] for i in (3,1,2,4,5,7,6)],"wifi":results[0],"data":data})
#    except Exception:
#        return index(request)

def thanks(request):
    db = MySQLdb.connect(user="clientlogin",passwd="clientw3w",db="wifinder")
    c = db.cursor()
    c.execute("""
        INSERT INTO ratings(wifiid,day,time,capability,quality,proxy,rating)
        VALUES(%s,%s)
        ;commit;"""%(",".join([request.POST["a%d"%i] for i in xrange(1,7)]),request.POST["rate"])
    )
    c.close()
    return render(request,"wifinder/thanks.html",{"request":request.POST})