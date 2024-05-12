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
    pol_id = i + 1
    first_name = names.get_first_name()
    middle_name = names.get_last_name()
    last_name = names.get_last_name()


    Add_street_number = random.randint(100, 999)
    Add_street_name = random_string(15)
    contact_number = random_number()
    email = random_email()

    
    gen = (pol_id,first_name,middle_name,last_name,contact_number,email,str(Add_street_number) + " - " + Add_street_name,pol_id)
    
    print(str(gen) +",")