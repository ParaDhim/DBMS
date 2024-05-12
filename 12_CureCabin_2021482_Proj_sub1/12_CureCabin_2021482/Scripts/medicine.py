import random
import names

def generate_random_medicine():
    for i in range(100):
        medicine_id = i + 1
        name = names.get_full_name()
        composition = " ".join(name.split(" ")[:2]) + " Compound"
        ingredient = names.get_first_name() + " Extract"
        types = ["Capsule", "Tablet", "Syrup", "Injection", "Drops"]
        type = random.choice(types)
        price = round(random.uniform(1, 100), 2)
        cost = round(price * 0.7, 2)
        currencies = ["USD", "EUR", "GBP", "INR", "CAD"]
        currency = random.choice(currencies)
        supplier_id = i + 1
        
        supplier =  (medicine_id, name, composition, ingredient, type, price, cost, currency, supplier_id)

        print(supplier, ",\n")

generate_random_medicine()