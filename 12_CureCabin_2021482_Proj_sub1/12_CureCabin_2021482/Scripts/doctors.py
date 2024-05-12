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
    username = generate_random_string(10)
    domain = random.choice(providers)
    return f"{username}@{domain}"

def generate_random_doctor():
    for i in range(100):
        doctor_id = i+1
        doctor_fname = names.get_first_name()
        doctor_mname = generate_random_string(3)
        doctor_lname = names.get_last_name()
        specialisation_desc = generate_random_string(50)
        contact_type = "home" if random.random() > 0.5 else "work"
        contact_number = int(generate_random_number(9))
        email_type = "personal" if random.random() > 0.5 else "work"
        email_address = generate_random_email()

        doctor = (doctor_id, doctor_fname, doctor_mname, doctor_lname, specialisation_desc,
                contact_type, contact_number, email_type, email_address)
        print(doctor, ",\n")        

generate_random_doctor()
