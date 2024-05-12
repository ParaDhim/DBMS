import random
import datetime

# Define the number of records to insert
num_records = 100

# Define the maximum and minimum values for the payment amount
min_amount = 10.0
max_amount = 1000.0

# Define a list of payment methods
payment_methods = ['Visa', 'Mastercard', 'American Express', 'PayPal', 'Cash']

# Create a list to hold the random data
data = []

# Generate 100 random values
for i in range(num_records):
    PaymentID = i + 1
    OrderID = random.randint(1, 1000)
    Amount = round(random.uniform(min_amount, max_amount), 2)
    PaymentMethod = random.choice(payment_methods)
    PaymentDate = datetime.date.today() - datetime.timedelta(days=random.randint(0, 365))
    
    data.append((PaymentID, OrderID, Amount, PaymentMethod, PaymentDate))

# Insert the data into the database
import mysql.connector

cnx = mysql.connector.connect(user='root', password='root', host='127.0.0.1', database='testdb')
cursor = cnx.cursor()

for record in data:
    insert_query = "INSERT INTO Payment (PaymentID, OrderID, Amount, PaymentMethod, PaymentDate) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(insert_query, record)

cnx.commit()
cursor.close()
cnx.close()