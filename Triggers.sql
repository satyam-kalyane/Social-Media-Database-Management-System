-- Trigger 1: creating trigger when a group is created then to make admin as member at that time only) 

delimiter //
create trigger Admin_Adding
after insert 
on teams for each row
begin 
 insert into members values(new.GAdmin,new.Gid);
end// 

delimiter ;


-- Trigger 2: creating trigger to delete a post whose report type is updated to violence

delimiter //
create trigger Deleting_Post
after update
on report for each row
begin
 if new.report_type = 'violence' then
  delete from post where new.post_id = post.post_id;
 end if;
end//

delimiter ;



-- Trigger 3: creating a trigger to delete user if user’s profile is deleted

delimiter //
create trigger Remove_User
after delete
on PROFILE for each row
begin
 delete from users where old.profile_id = user_id;
end//

delimiter ;
