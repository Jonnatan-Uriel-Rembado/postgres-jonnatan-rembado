-- ==== DATABASE =====
create database blog_db;

-- ======= USERS ======
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);

insert into users ( first_name, last_name, email) values
('Jonnatan', 'Rembado', 'jonnatan@gmail.com'),
('Uriel', 'Espinoza', 'uriel@gmail.com'),
('Darth', 'Vader', 'vader@gmail.com');

-- ====== POSTS =======
create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text text
);

insert into posts ( creator_id, title, text) values
( 1, 'post 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
( 2, 'post 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
( 3, 'post 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
( 1, 'post 4','Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
( 3, 'post 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit.');

--  ====== LIKES =======
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes ( user_id, post_id) values
(1,2),
(2,3),
(3,1),
(3,5),
(1,5),
(2,1);

-- ==== Traer todos los posts y la informacion del campo creator_id =====
select * from posts inner join users 
on creator_id = users.id;

-- ===== Traer todos los post con la informacion de los que le dieron like =====
select * from posts inner join likes
on posts.id = likes.post_id inner join users 
on users.id = likes.user_id;