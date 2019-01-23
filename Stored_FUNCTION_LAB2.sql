
#######1(lab1)
Drop Function if exists average_age_per_position;

DELIMITER //

Create function average_age_per_position
(
position_param varchar(25)
)
RETURNS DECIMAL(9,2)

BEGIN
  DECLARE avg_age DECIMAL(9,2); 
	select round(avg(age))
	into avg_age
	from employees
	where position = position_param;
 RETURN avg_age;
END//
select average_age_per_position("Lecturer");


#######################################( OM )##########################################
####1
Select * from orders where datediff(shipped_date,order_date)>10


####2
Select concat(customer_first_name, ' ', customer_last_name) as customers 
from orders 
inner join customers 
on orders.customer_id=customers.customer_id 
where order_id=70


####3
Select title from order_details 
inner join items 
on order_details.item_id=items.item_id 
where order_details.order_id=264


####4
Drop Function if exists order_days;

DELIMITER //

Create function order_days
(
orderid_param INT
)
RETURNS INT

BEGIN
  DECLARE no_of_days  INT; 
	select datediff(shipped_date,order_date)
	into no_of_days
	from orders
	where order_id = orderid_param;
 RETURN no_of_days;
END//
select order_days(19);