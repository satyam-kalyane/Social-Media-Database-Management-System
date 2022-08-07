-- Function 1: Function for finding in how many groups a particular member is present


delimiter //
create function Total_Groups( abc int)
RETURNS INT
NOT DETERMINISTIC
begin
 declare total int;
 set total = (select count(*) 
  from members where mem_id = abc);
 return total;
 end//
 
delimiter ;



-- Function 2:  Function to check whether the user has posted something or not.

delimiter //
create function User_Status(abc int)
RETURNS VARCHAR(40)
NOT DETERMINISTIC
begin
 declare store int default 0;
 set store = (select count(*) 
  from post where postedBy_id = abc);
 if store > 0 then
  return 'User is Active. User posted some posts';
 else
  return 'Inactive User !!! No Posts';
 end if;
 end//
 
delimiter ;



