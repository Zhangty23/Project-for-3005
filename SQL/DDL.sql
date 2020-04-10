create database bookstore

use bookstore
go


create table users
(
	uid int identity primary key not null,
	username varchar(40) not null,
	phone varchar(20),
	address varchar(100),
	email varchar(40),
	password varchar(20) not null
)

create table publisher
(
	pid int identity primary key not null,
	name varchar(150) not null,
	address varchar(100),
	email varchar(40),
	phone varchar(20),
	banking_account varchar(40)
)

create table book
(
	id int identity primary key not null,
	book_name varchar(100) not null,
	author_name varchar(40) not null,
	ISBN varchar(20) not null,
	genre varchar(20),
	pid int,
	price float,
	cover varchar(50),
	page_number int,
	number int,
	warehouse varchar(100),
	percentage float
)


create table shoppingcar
(
	id int identity primary key not null,
	uid int,
	bid int,
	number int,
	datetime datetime
)

create table orders
(
	oid varchar(13) primary key not null,
	uid int,
	status varchar(20),
	total_price float,
	datetime datetime
)

create table item
(
	id int identity primary key not null,
	oid varchar(13),
	bid int,
	sale_price float,
	number int
)

create table ship
(
	id int identity primary key not null,
	oid varchar(13),
	place varchar(100),
	datetime datetime
)

create view view_salebook
as
select item.id iid,bid,sale_price,item.number number,book_name,author_name,genre,pid from item join book on(book.id=item.bid)