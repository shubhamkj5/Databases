#1
#Select count(*) as No_of_patients from patients

#2
#Select * from patients where town = 'Athlone'

#3
#Select drug_name from drugs where cost=2.95

#4
#Select drug_name,cost from drugs where cost>3.50

#5
#Select firstname,dateOfBirth from patients where dateOfBirth = (select max(dateOfBirth) from patients)

#6
#Select firstname,dateOfBirth from patients where dateOfBirth = (select min(dateOfBirth) from patients)

#7
#SELECT count(*) as Total_Doctors FROM doctors;

#8
#SELECT firstName,lastName FROM doctors order by lastname desc;

#9
#SELECT * FROM thedocs.doctors where firstName like '%a';

#10
#SELECT count(*) as Male_Doctors,speciality FROM thedocs.doctors where gender='M' group by speciality;
#SELECT count(*) as Male_Doctors,speciality FROM thedocs.doctors where gender='F' group by speciality;

#11
#SELECT * FROM thedocs.prescriptions where date_perscribed> '2012-07-31';

#12
#SELECT patients.firstName,patients.lastName,prescriptions.prescription_id FROM thedocs.patients INNER JOIN prescriptions on patients.pat_id=prescriptions.pat_id  

#13
#Select count(*) as No_of_Prescriptions,speciality from prescriptions Inner Join doctors on prescriptions.doc_id=doctors.doc_id and doctors.speciality='Audiologist'

#14
#Select drugs.drug_name,drugs.cost from drugs Inner Join prescriptions on drugs.drug_id=prescriptions.drug_id 

#15
#Select drugs.drug_name,drugs.cost from drugs where drug_id not in (Select drug_id from prescriptions)
Select drugs.drug_name,drugs.cost from drugs  left Join prescriptions on drugs.drug_id = prescriptions.drug_id where prescriptions.drug_id is null