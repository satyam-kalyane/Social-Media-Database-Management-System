-- View 1 : displaying group members sequentially.

create view Group_Members as
 select t.Gid as Group_No , m.mem_id as User_Id
 from teams as t, members as m
 where t.Gid = m.Gid
 group by User_Id,Group_No
 order by Group_No;
 
-- View 2 : displaying those members whose age is less than 18.

create view Age_Check as
 select user_name as Name , YEAR(CURDATE()) - YEAR(DOB) AS age
  FROM PROFILE
  where (YEAR(CURDATE()) - YEAR(DOB)) < 18;
