CREATE SCHEMA `dtest` DEFAULT CHARACTER SET utf8 ;

drop table if exists user;
create table user (
	id int(8) not null auto_increment primary key,
    username varchar(128) not null default 'Zoe',
    email varchar(128) not null,
    tel varchar(128),
    password varchar(128) not null,
    gender char(1) not null default '0',  -- 0 女	1 男
    create_date datetime not null,
    update_date datetime not null,
    user_type char(1) not null default '0', -- 0 普通用户  1 管理员
    del_flag char(1) not null default '0'   -- 0正常状态 9 删除状态
);

drop table if exists puzzle;
create table puzzle(
	id int(8) not null auto_increment primary key,
    label varchar(128) not null default "default",
    puzzle varchar(4396) not null,
    create_date datetime not null,
    del_flag char(1) not null default '0'
);
    
drop table if exists custom;
create table custom(
	id int(8) not null auto_increment primary key,
    user_id int(8) not null,
	puzzle_id int(8) not null,
    puzzle_type char(1) not null default '0',   -- 0 错题   1 标记
    create_date datetime not null
);
    
drop table if exists record;
create table record(
	id int(8) not null auto_increment primary key,
	user_id int(8) not null,
	score int(8) not null,
    create_date datetime not null
);
    
    
    
    
    
    
    
    
    
    

