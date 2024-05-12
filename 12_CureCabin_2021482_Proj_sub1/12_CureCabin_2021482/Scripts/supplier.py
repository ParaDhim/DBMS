import random
import string
import names

def generate_random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for i in range(length))

def generate_random_number(length):
    numbers = string.digits
    return ''.join(random.choice(numbers) for i in range(length))

def generate_random_email():
    providers = ['gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com']
    username = generate_random_string(7)
    domain = random.choice(providers)
    return f"{username}@{domain}"

def generate_random_address():
    address_types = ['home', 'work']
    address_line1 = generate_random_string(10)
    address_line2 = generate_random_string(3)
    city = generate_random_string(5)
    state = generate_random_string(2)
    zip_code = generate_random_number(5)
    address_type = random.choice(address_types)
    return (f"{address_line1}, {address_line2}, {city}, {state} {zip_code}", address_type)

def generate_random_supplier():
    for i in range(100):
        supplier_id = i+1
        supplier_fname = names.get_first_name()
        supplier_mname = generate_random_string(3)
        supplier_lname =  names.get_last_name()
        contact_type = "home" if random.random() > 0.5 else "work"
        contact_number = generate_random_number(10)
        email_address = generate_random_email()
        email_type = "personal" if random.random() > 0.5 else "work"
        address, address_type = generate_random_address()
        supplier = (supplier_id, supplier_fname, supplier_mname, supplier_lname, contact_type,
                contact_number, email_address, email_type, address, address_type)
        print(supplier, ",\n")

generate_random_supplier()