use master
go 
create database [ASMjava4]
go
 use ASMjava4
go

create table [user]
(
id			int			 primary key identity,
username	varchar(10)	 unique not null,
[password]	varchar(20)	 not null,
email		varchar(50)  unique not null,
isAdmin		bit			 not null default 0, 
isActive	bit			 not null default 1
)

go 

create table video 
(
id				int				primary key identity,
title			nvarchar(255)	not null,
href			varchar(50)		unique not null, 
poster			varchar(255)	null,
[views]			int				not null default 0,
shares			int				not null default 0,
[description]	nvarchar(255)	not null,
isActive		bit				not	null default 1
)

go

create table history
(
id				int				primary key identity,
userId			int				foreign key references [user](id),
videoId			int				foreign key references video(id),
viewedDate		datetime		not null default getDate(),
isLiked			bit				not null default 0,
likedDate		datetime		null
)
go


insert into [user] (username, [password], email, isAdmin) 
values 
('tzinh', '123', 'vinh512003@gmail.com',  1),
('minh', '222', 'doquangvinh512003@gmail.com',  0)
 go

 insert into video(title, href, [description]) 
 values
 (N'热门旋律 - 支先生', 'VzKkfGz47Us', 'TikTok Music'),
 (N'A day in the life of a software engineer in FINLAND', 'hVPmW0cxLkM', 'WOMEN IN TECH'),
 (N'Tự ti khiến bạn lạc mất ý nghĩa cuộc đời | Sách Cuộc sống có ý nghĩa gì với bạn? ', 'cB7MEeeV4q0', 'Tác giả Adler'),
 (N'Ba thứ cần phải nhìn thấy trong một đời này | Sách Siddhartha', 'bfMfr57OUn8', 'Better Version'),
 (N'Rainy Jazz Cafe - Slow Jazz Music in Coffee Shop Ambience for Work', 'NJuSStkIZBg', 'Study and Relaxation')

 go

 insert into history(userId, videoId, isLiked, likedDate)
 values
 (2, 1, 1, GETDATE()),
 (2, 3, 0, null),
 (1, 2, 1, GETDATE())
 go