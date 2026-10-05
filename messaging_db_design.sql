/*
Entities for a chat application

messages
time sent, time received 

calls
- audio, video

users
- name, phone number, country, birthday

contacts

groups

*/

create database messaging_app;

use messaging_app;

create table `user` (
	`user_id` int primary key, -- guid e.g. 6dd4f856-d272-4e25-8be1-09dca2ee69d6
	`name` varchar(200),
    `phone_number` varchar(200) unique, -- includes country code
	`country_code` varchar(10)
);

create table chat (
	`chat_id` int primary key
);

/* 
	user id 1, chat id 10
    user id 2, chat id 10
    user id 3, chat id 10
    user id 4, chat id 11
    user id 5, chat id 11
    
    garçon
*/
create table user_chat (
	`user_id` int,
    `chat_id` int,
    primary key (`user_id`, `chat_id`),
    foreign key (user_id) references user(user_id),
    foreign key (chat_id) references chat(chat_id)
);

/*
	user 1 chat 10 'hello'
*/
create table message (
	message_id int auto_increment primary key,
    sender_user_id int,
    chat_id int,
	msg text, -- 'hello!'
    date_sent timestamp,
    foreign key (sender_user_id) references user(user_id),
    foreign key (chat_id) references chat(chat_id)
);

