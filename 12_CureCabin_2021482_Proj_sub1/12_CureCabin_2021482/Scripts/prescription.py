import random
from datetime import date, timedelta

# Random date generator function
def random_date(start, end):
    return start + timedelta(
        days=random.randint(0, (end - start).days)
    )

# List of possible medicine IDs
# medicine_ids = 1:100

# # List of possible doctor IDs
# doctor_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# # List of possible patient IDs
# patient_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# List of possible dosages
dosages = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

# List of possible duration days
duration_days = [1, 2, 3, 4, 5, 6, 7, 14, 21, 30]

# Starting date
start = date(2020, 1, 1)

# Ending date
end = date(2021, 12, 31)

# List to hold the generated data


# Loop to generate random data
for i in range(1, 101):
    # Generate a random medicine ID
    medicine_id = random.randint(1, 100)

    # Generate a random doctor ID
    doctor_id = random.randint(1, 100)

    # Generate a random patient ID
    patient_id = random.randint(1, 100)

    # Generate a random dosage
    dosage = random.choice(dosages)

    # Generate a random duration in days
    duration = random.choice(duration_days)

    # Calculate the start and end date of the prescription
    start_date = random_date(start, end)
    end_date = start_date + timedelta(days=duration)

    # Add the generated data to the list
    doctor = (i, doctor_id, patient_id, medicine_id, dosage, duration, start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d"), start_date.strftime("%Y-%m-%d"), start_date.strftime("%Y-%m-%d"))

# Print the generated data
    print(doctor ,",\n")





