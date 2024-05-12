import random
import names
import string
import datetime

# Function to generate random data
def random_string(string_length=10):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(string_length))

def random_number(n):
    return random.randint(10**(n-1), (10**n)-1)

def random_gender():
    return random.choice(['M', 'F'])

def random_email():
    return random_string() + "@email.com"

# def random_date():
#     year = random.randint(1900, 2022)
#     month = random.randint(1, 12)
#     day = random.randint(1, 28)
#     return datetime.datetime(year, month, day).date()

def generate_random_date(start_date, end_date):
    return start_date + datetime.timedelta(
        seconds=random.randint(0, int((end_date - start_date).total_seconds())))

start_date = datetime.datetime(2000, 1, 1)
end_date = datetime.datetime(2023, 1, 1)

def random_contact_type():
    return random.choice(['Home', 'Work'])




# Function to insert 100 random rows into the table
def insert_random_data():
    for i in range(100):
        patient_id = i + 1
        first_name = names.get_first_name()
        m_name = names.get_last_name()
        last_name = names.get_last_name()
        address_street_number = random.randint(100, 999)
        address_street_name = random_string(15)
        address_apt_number = str(random.randint(1, 100)) + random.choice(string.ascii_uppercase)
        address_city = random_string(12)
        address_zipCode = random.randint(10000, 99999)
        address_state = random_string(2).upper()
        address_country = "India"
        dob = generate_random_date(start_date,end_date)
        contact_type = random_contact_type()
        contact_number = random_number(9)
        gender = random_gender()
        email_type = random_contact_type()
        email = random_email()
        age = random.randint(1, 100)
        
        patient = (patient_id,first_name,m_name,last_name,address_street_number,address_street_name,address_apt_number,address_city,address_zipCode,address_state,address_country,dob.strftime("%Y-%m-%d"),contact_type,contact_number,gender,email_type,email,age)
        
        print(patient ,",\n")

insert_random_data()