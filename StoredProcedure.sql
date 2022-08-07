-- Stored Procedure 1: creating procedure to find who reported most(Note : Output can be multiple entries as many can have same number of reports)

delimiter //
create procedure Spammer()
Begin
 select reportedBy as spammer , count(*) as spams
 from report
 group by reportedBy
 having count(*) = (select max(spams) from 
  (select reportedBy as spammer , count(*) as spams
   from report
   group by reportedBy)
   report);
end//

delimiter ;



-- Stored Procedure 2: Creating procedure to find highly active members that is who posted max posts

delimiter //
create procedure User_with_greater_post(IN amount int)
Begin
 select postedBy_id as User, count(*) as posts
 from post
 group by postedBy_id
 having count(*) >= amount;  
 end//
 
delimiter ;
