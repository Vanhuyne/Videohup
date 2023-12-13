create database [asm2]
use [asm2]

CREATE TABLE [user] (
    id int primary key identity,
	username varchar(50) unique not null,
    [password] varchar(50) not null,
    email varchar(89),
	isAdmin bit not null default 0, 
	isActive bit not null default 1
);
go

CREATE TABLE video (
    id int primary key identity,
    title nvarchar(255) not null ,
	href varchar(50) unique not null,
    poster varchar(255),
	[views] int not null default 0,
	shares int not null default 0,
	[description] nvarchar(100) not null,
	isActive bit not null default 1 
);
go

CREATE TABLE history (
    id int identity primary key,
    userId int foreign key references [user](id),
	videoId int foreign key references video(id) ,
    viewDate datetime not null default getDate(),
    isLiked bit not null default 0,
    likeDate datetime null
);
go


INSERT INTO [user] (username, [password], email, isAdmin)
VALUES 
    ('user1', 'pass123', 'user1@example.com', 0),
    ('user2', 'pass456', 'user2@example.com', 0),
    ('admin', 'adminpass', 'admin@example.com', 1);


INSERT INTO video (title, href, poster, [description], isActive)
VALUES 
    (N'Video 1', '1WVFt-3FZEg', 'poster1.jpg', N'Mô tả cho Video 1', 1),
    (N'Video 2', 'Htq2EUgcrKE', 'poster2.jpg', N'Mô tả cho Video 2', 1),
    (N'Video 3', 'uBeWrm_I4Bw', 'poster3.jpg', N'Mô tả cho Video 3', 1);


INSERT INTO history (userId, videoId, isLiked, likeDate)
VALUES 
    (2, 1, 1, GETDATE()), -- User 1 xem và thích Video 1
   (2, 1, 1, GETDATE()), -- User 1 xem Video 2
    (2, 3, 0, null) -- User 2 xem và thích Video 1
  
