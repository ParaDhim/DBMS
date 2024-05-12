import random
import datetime

payment_methods = ['Credit Card', 'Debit Card', 'Net Banking', 'PayPal', 'Cash']


def random_date(start, end):
    return start + datetime.timedelta(
        seconds=random.randint(0, int((end - start).total_seconds())))

# start = datetime.datetime(2016, 1, 1)
# end = datetime.datetime(2022, 12, 31)


def generate_random_date(start_date, end_date):
    return start_date + datetime.timedelta(
        seconds=random.randint(0, int((end_date - start_date).total_seconds())))

start_date = datetime.datetime(2000, 1, 1)
end_date = datetime.datetime(2023, 1, 1)


for i in range(1, 101):
  payment_id = i
  order_id = random.randint(1, 1000)
  amount = round(random.uniform(1, 10000), 2)
  payment_method = random.choice(payment_methods)
  random_date = generate_random_date(start_date, end_date)
  payment_date = str(datetime.date.today())
  
  payment = (payment_id, order_id, amount, payment_method, random_date.strftime('%Y-%m-%d'))
  
  print(str(payment) + ",")

  