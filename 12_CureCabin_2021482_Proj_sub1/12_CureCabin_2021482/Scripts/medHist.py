import random
import datetime

medicalIssues = ["Chronic asthma", "Type 2 diabetes", "History of heart disease", "Allergic rhinitis", "Depression and anxiety","Abdominal Pain","Diabetes","Hypertension","Heart Disease","Asthma","Arthritis","Cancer","Depression","Stroke","Anemia","Tuberculosis","Malaria","Dengue","Chikungunya","Hepatitis B","Chronic Kidney Disease","Thyroid Disorders","Gastrointestinal Disorders","Obesity"]

for i in range(1, 101):
  
  medIss = random.choice(medicalIssues)
  gen = (i,i,medIss)
  
  print(str(gen) + ",")