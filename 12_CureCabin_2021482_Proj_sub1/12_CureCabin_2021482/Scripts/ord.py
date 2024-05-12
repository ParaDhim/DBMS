import random
import names
import string
import datetime

delivery_statuses = ["Pending", "Shipped", "In Transit", "Delivered", "Cancelled"]

def random_string(string_length=10):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(string_length))
    
def random_number():
    return random.randint(1,20)


def generate_random_date(start_date, end_date):
    return start_date + datetime.timedelta(
        seconds=random.randint(0, int((end_date - start_date).total_seconds())))
start_date = datetime.datetime(2000, 1, 1)
end_date = datetime.datetime(2023, 1, 1)


for i in range(100):
    ord_id = i + 1
    random_date = generate_random_date(start_date, end_date)
    deli = random.choice(delivery_statuses)
    gen = (ord_id,ord_id,ord_id,ord_id,random_number(),random_date.strftime('%Y-%m-%d'),deli)
    
    print(str(gen) +",")