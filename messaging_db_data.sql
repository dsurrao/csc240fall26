use messaging_app;

-- add users 'user_a' and 'user_b'

set @user_a_id = 1;
set @user_a_name = 'user_a';
set @user_a_phone = '6171111111';
set @user_a_country_code = '001';

set @user_b_id = 2;
set @user_b_name = 'user_b';
set @user_b_phone = '6171112222';
set @user_b_country_code = '002';

/*
-- using select with a table
select @user_a_id, @user_a_name, 'hello', 100;
*/

-- insert users
insert into `user` (`user_id`, `name`, `phone_number`, `country_code`)
values (@user_a_id, @user_a_name, @user_a_phone, @user_a_country_code);

insert into `user` (`user_id`, `name`, `phone_number`, `country_code`)
values (@user_b_id, @user_b_name, @user_b_phone, @user_b_country_code);

select * from `user`;

/*
This will be generated if you try to insert with the same PK
Error Code: 1062. Duplicate entry '1' for key 'user.PRIMARY'
*/

-- create a chat
set @chat_id = 100;
insert into chat (chat_id) values (@chat_id);

select * from `user`;
select * from chat;

-- add user_a and user_b to chat
insert into user_chat (user_id, chat_id) 
values (@user_a_id, @chat_id), (@user_b_id, @chat_id);

select * from user_chat;

-- add a message to chat 100
set @hello_message_id = 1000;
set @msg = 'hello everyone!!'; 
insert into message (
	message_id, sender_user_id, chat_id, msg, date_sent)
values (@hello_message_id, @user_a_id, @chat_id, @msg, now());

select * from message;


