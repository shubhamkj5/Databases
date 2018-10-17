#Q1. 
Select datediff('2018-10-17','1997-02-24') as `Alive Days`;
Select datediff(curdate(),'1997-02-24') as `Alive Days`;

#Q2
Update `doctors` set `lastName`='Jain' where `firstName`='Lily' and `lastName`='Burke';

#Q3
SELECT `drug_name`,`cost` from `drugs` where `cost`=(select max(cost)from `drugs`);

#Q4
SELECT `drug_name`,`cost` from `drugs` where `cost`=(select min(cost)from `drugs`);

#Q5
Select * from `patients` where `address2` is null;

#Q6
UPDATE `patients` SET `address2`='Sample Address2', `town`='Sample Town' WHERE `pat_id`='5';

#Q7
Select avg(cost) as `Average Cost` from `drugs`; 

#Q8
Select count(*) as `Count` ,`speciality` from `doctors` group by `speciality`;

#Q9
Select distinct upper(`speciality`) as `Specialities` from `doctors`;

#Q10
Select count(*) as `Number of Prescriptions`,`Speciality` from `prescriptions` inner join `doctors` on prescriptions.doc_id=doctors.doc_id and doctors.speciality='paediatrician';

#11
Select `firstName`,`lastName` from `doctors` inner join `prescriptions` on `prescriptions.doc_id`=`doctors.doc_id` and `prescriptions.pat_id`=6;

#12
Select `firstName`,`lastName` from `patients`  left Join `prescriptions` on `patients.pat_id` = `prescriptions.pat_id` where `prescriptions.pat_id` is null;

#13
INSERT INTO `thedocs`.`drugs` (`drug_id`, `drug_name`, `cost`) VALUES ('7', 'Sample Drug', '5.49');
SELECT * FROM `thedocs.drugs`;

#14
Select distinct `drugs.drug_name` from `drugs` Inner Join `prescriptions` on `drugs.drug_id`=`prescriptions.drug_id`;

#15
ALTER TABLE `thedocs`.`drugs` 
ADD COLUMN `manufacturer` VARCHAR(45) NOT NULL AFTER `cost`;

#16
UPDATE `drugs` SET `manufacturer`='GlaxoSmithKline' where `drug_name`='Panadol' or `drug_name`='Calpol';
