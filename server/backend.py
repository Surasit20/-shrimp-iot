from datetime import datetime
import firebase_admin
from firebase_admin import credentials, messaging
from pyfcm import FCMNotification
import pyrebase
import schedule
import time
# push_service = FCMNotification(api_key="AAAAan2iGkY:APA91bEyBbuW6BOHDeuEVOFXa_kFldD-jrowHP6T1B-ZM3PwJsu1d6qClE4tAoGt0hya89VbBBqaq-2H-ErYOK6Bhsdy2f6Zj_DNLUKwWuVZIXxSqzffGJY4iDMYjSiyvMTeaF1u9oup")


config = {
    "apiKey": "AIzaSyCDtDxikQM7pLNFR5HBOTWvPbgh0chhURw",
    "authDomain": "mylogin-cb3ce.firebaseapp.com",
    "databaseURL": "https://mylogin-cb3ce-default-rtdb.asia-southeast1.firebasedatabase.app",
    "projectId": "mylogin-cb3ce",
    "storageBucket": "mylogin-cb3ce.appspot.com",
    "messagingSenderId": "40734554078",
    "appId": "1:40734554078:web:4115f8fd44d52dc8c44f4f",
    "measurementId": "G-1LCLSPV3WB"
}

# initiallize firebase
firebase = pyrebase.initialize_app(config)
cred = credentials.Certificate(
    "mylogin-cb3ce-firebase-adminsdk-ps0n6-c2296370cb.json")
firebase_admin.initialize_app(cred)
db = firebase.database()

# set time
set_time_notification = "00:00"
global isNotification

# registration_id = "cjjemRYUJS4:APA91bGndNwlslIof_EnlGVpuYvq2qY_lnnMMuJCXu8SwlfhixFJ0Cl5nLZ7wDhq3txUO8iygpqjHkIQKBO6mx6dUGxum9a4o4xpgv7C0tbZ35m295-d7Qs9YinQO1m0ddCGuNfJk_mF"
message_title = "Fire Alert"
message_body = db.child("address").get().val()
message_body = "Fire Breakeage at:" + str(message_body)
registration_id = db.child("message").get().val()


# function for updata notification
def stream_handler_notification(post):
    data = post["data"]  # data of notification
    result = time.localtime()
    d1 = datetime(result.tm_year, result.tm_mon, result.tm_mday)

    idNotification = ""
    for i in data:
        d = data[i]["date"]
        d2 = datetime.strptime(d, "%d/%m/%Y")
        delta = d1 - d2
        if(delta.days > 30):
            idNotification = i
        print(delta.days)
    if(idNotification != ""):
        # ส่งแจ้งเตือน
        db.child("notification").child(idNotification).remove()


# function for updata notification
def stream_handler(post):
    data = post["data"]  # data of read sensor
    print(data)
    result = time.localtime()  # time now

    # data now
    _date = str(result.tm_mday) + "/" + \
        str(result.tm_mon) + "/" + str(result.tm_year)

    # time now
    _time = str("{:02d}".format(result.tm_hour)) + \
        ":" + str("{:02d}".format(result.tm_min))

    upDateData = {"date": _date, "nut": data["nut"], "ph": data["ph"],
                  "temprature": data["temperature"], "time": _time}
    # push data in to notification database

    db.child("notification").push(upDateData)

    # send notification to smartphone


# fucntion for scheduling


# เมื่อถึงเวลาแจ้งเตือน
def jobNotification():
    print("Start Job!!!")
    set_notification = db.child("set_notification").get()
    isNotification = False
    for data in set_notification.each():
        print(data.val())
        # ตรวจสอบการเปิดแจ้งเตือน
        if data.key() == "isNotification":
            isNotification = data.val()
    print(isNotification)
    if isNotification:
        db.child("read_sensor").stream(stream_handler, None)


# ลบข้อมูลเมื่อเกิน1เดือน


def jobCheckDataOneMonth():
    db.child("notification").stream(stream_handler_notification, None)


# my_stream = db.child("read_sensor").stream(stream_handler, None)


# time at seting
def stream_handler_time_notification(post):
    print(post)
    try:

        print("เปิดแจ้งเตือน")
        schedule.every().day.at(
            post["data"]["time_notification"]).do(jobNotification)
        # schedule.every(5).seconds.do(jobNotification)
    except:
        print()


stream_time_notification = db.child("set_notification").stream(
    stream_handler_time_notification, None)


def sendPush(title, subtitle, dataObject=None):
    # See documentation on defining a message payload.
    print("กำลังส่งแจ้งเตือน")
    messages = [

        # ...
        messaging.Message(
            notification=messaging.Notification(
                title, subtitle),
            topic='readers-club',
        ),
    ]

    # Send a message to the device corresponding to the provided
    # registration token.
    response = messaging.send_all(messages)
    # Response is a message ID string.
    print('Successfully sent message:', response)


# function for updata notification
def stream_handler_report_notification(post):
    data = post["data"]  # data of read sensor
    print(data)
    path = post["path"]
    print(data)
    print(path)
    print(post)
    time = 0
    timeTemp = 0
    # time now

    try:
        if data > 30 and data < 20 and path == "/temperature":
            sendPush("อุณหภูมิผิดปกติ", str(
                data) + " องศา", dataObject=None)
    except Exception as e:
        print(e)

    try:
        if data > 3 and data < 20 and path == "/ph":
            sendPush("Phของน้ำผิดปกติ", str(
                data) + " Ph", dataObject=None)
    except Exception as e:
        print(e)

    try:
        if data > 10 and path == "/nut":
            sendPush("ความขุ่นของน้ำผิดปกติ", str(
                data) + " NUT", dataObject=None)
    except Exception as e:
        print(e)
    try:
        if path == "/":
            print(data["time_feeder"])
            time = data["time_feeder"] - 5
            print(time)

        timeFeeder = str("{:02d}".format(time // 60)) + ":" + \
            str("{:02d}".format(time % ((time // 60)*60)))

        schedule.every().day.at(
            timeFeeder).do(sendNotification)
        print(timeFeeder)

    except Exception as e:
        print(e)


def sendNotification():
    sendPush("อีก 5 นาที จะให้อาหารกุ้ง", str(
        "") + " NUT", dataObject=None)


def stream_handler_report_pump_water_notification(post):
    data = post["path"]
    # data of read sensor
    print(data)
    try:
        if(data == "/water_pump_in"):

            if post["data"] == True:
                sendPush("กำลังถ่ายน้ำเข้า", "", dataObject=None)

        if(data == "/water_pump_out"):
            if post["data"] == True:
                sendPush("กำลังถ่ายน้ำออก", "", dataObject=None)
    except:
        print()


db.child("read_sensor").stream(stream_handler_report_notification, None)
db.child("set_sensor").stream(
    stream_handler_report_pump_water_notification, None)


schedule.every().day.do(jobCheckDataOneMonth)
while True:

    schedule.run_pending()
    time.sleep(1)
