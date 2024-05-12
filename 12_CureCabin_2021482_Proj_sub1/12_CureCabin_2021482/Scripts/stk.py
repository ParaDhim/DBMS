import random
import names
import string
import datetime

def random_string(string_length=10):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(string_length))
    
def random_number():
    return random.randint(10,150)


def random_number1():
    return random.randint(10,99)


def random_email():
    return random_string() + "@email.com"

for i in range(100):
    stk_id = i + 1
    qty = random_number()
    thresh = random_number1()

    
    gen = (stk_id,stk_id,stk_id,qty,thresh,stk_id)   
    print(str(gen) +",")