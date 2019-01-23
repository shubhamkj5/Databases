####1
Drop View if exists names_department;
CREATE VIEW  names_department AS
SELECT concat(firstName, ' ',LastName) as Name, department
FROM details;

select * from names_department;



#####2
Drop procedure if exists update_department;
DELIMITER //
CREATE PROCEDURE update_department
(
  id_param      INT,
  department_param    VARCHAR(25) 
)
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
   START TRANSACTION;  

  UPDATE details
  SET department = department_param
  WHERE id = id_param;
IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

CALL update_department(1, "Swimming");


#####3
Drop procedure if exists update_rate_position;
DELIMITER //

CREATE PROCEDURE update_rate_position
(
  IN  position_param  VARCHAR(25), 
  IN  rate_param    INT,
  OUT update_count        INT
)
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
  START TRANSACTION;
 UPDATE details
  SET rate = rate+rate*(rate_param/100)
  WHERE position = position_param;
  
  IF sql_error = FALSE THEN
    SET update_count = 1;
    COMMIT;
  ELSE
    SET update_count = 0;
    ROLLBACK;
  END IF;
END//

call update_rate_position("Lecturer",10,@update_count)
#Select @update_count;