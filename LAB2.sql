#1
#SELECT * FROM lab2.details where age not between 40 and 50;

#2
#SELECT * FROM lab2.details where hours between 10 and 15;

#3
#SELECT * FROM lab2.details where firstName like '%e%';

#4
#SELECT * FROM lab2.details where firstName like '_u%';

#5
#a
#SELECT * FROM lab2.details where  firstName like '%n' and length(firstName) =  4;
#b
#SELECT * FROM lab2.details where  firstName like 'J%' and length(firstName) =  4;
#c
#SELECT * FROM lab2.details where length(firstName) =  3;
#d
#SELECT * FROM lab2.details where  length(firstName) >  4;

#6
#SELECT * FROM lab2.details where gender ='F' and age like '%3%';

#7
#SELECT count(*) as Total_Females FROM lab2.details where gender ='F';

#8
#SELECT count(*) as Total_Females FROM lab2.details where gender ='M';

#9
#SELECT avg(age) as AvgAge_Females FROM lab2.details where gender ='F';

#10
#SELECT avg(age) as AvgAge_Males FROM lab2.details where gender ='M';

#11
#SELECT * FROM lab2.details where age = (Select max(age) from lab2.details);


#12
#SELECT * FROM lab2.details where age = (Select min(age) from lab2.details);

#13
#SELECT avg(hours) as Average_hours FROM lab2.details;


#14
#Select  sum(rate*hours) as wage from  lab2.details where gender ='F' ;


#15
#Select  sum(rate*hours) as wage from  lab2.details where gender ='M' ;

#16
#SELECT avg(age) as Avg_Age ,department FROM lab2.details group by department;

#17
#SELECT avg(age) as Avg_Age ,position FROM lab2.details group by position;

