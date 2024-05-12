import random
import names

def generate_random_pharmacist():
    for i in range(100):
        pharmacist_id = i +1
        first_name = names.get_first_name()
        middle_name = names.get_first_name()
        last_name = names.get_last_name()
        contact_types = ["Mobile", "Home", "Work"]
        contact_type = random.choice(contact_types)
        contact_number = str(random.randint(100_000_000, 999_999_999))
        email_address = first_name + "." + last_name + "@example.com"
        email_types = ["Personal", "Work"]
        email_type = random.choice(email_types)
        year_of_graduation = random.randint(1980, 2020)
        fields_of_study = ["Pharmacy", "Pharmacology", "Pharmaceutical Science"]
        field_of_study = random.choice(fields_of_study)
        
        pharma =  (pharmacist_id, first_name, middle_name, last_name, contact_type, contact_number, email_address, email_type, year_of_graduation, field_of_study)

        print(pharma, ",\n")

generate_random_pharmacist()