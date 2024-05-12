import random
import names
import string
import datetime

reasons =  ["Regular check-up", "Sickness", "Injury", "Chronic condition management", "Annual physical", "Specialist consultation", "Vaccination", "Screening tests", "Surgery consultation", "Follow-up appointment"]


def generate_random_date(start_date, end_date):
    return start_date + datetime.timedelta(
        seconds=random.randint(0, int((end_date - start_date).total_seconds())))

start_date = datetime.datetime(2000, 1, 1)
end_date = datetime.datetime(2023, 1, 1)

def random_time():
  hour = str(random.randint(0, 23)).zfill(2)
  minute = str(random.randint(0, 59)).zfill(2)
  second = str(random.randint(0, 59)).zfill(2)
  
  time = "{}:{}:{}".format(hour, minute, second)
  
  return time


for i in range(100):
    app_id = i + 1
    
    random_date = generate_random_date(start_date, end_date)
    res = random.choice(reasons)
    gen = (app_id,app_id,app_id,random_date.strftime('%Y-%m-%d'),random_time(),res)
    
    print(str(gen) +",")