import random
import names
import string
import datetime

def random_string(string_length=10):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(string_length))
    
def random_number():
    return random.randint(100000000,999999999)

def random_email():
    return random_string() + "@email.com"

for i in range(100):
    branch_id = i + 1
    street_number = random.randint(100, 999)
    street_name = random_string(15)
    apt_number = str(random.randint(1, 100)) + random.choice(string.ascii_uppercase)
    city = random_string(12)
    zipCode = random.randint(10000, 99999)
    state = random_string(2).upper()
    country = "India"
    contact_number = random_number()
    email = random_email()

    
    gen = (branch_id,street_number,street_name,apt_number,city,zipCode,state,country,contact_number,email)
    
    print(str(gen) +",")