drop database if exists hw_temp_mysql;

create database hw_temp_mysql;

use hw_temp_mysql;


-- DEBUG --

drop table if exists debug;

create table debug(
    id int primary key auto_increment,
    name varchar(32) default null,
    log varchar(128),
    dt_log datetime default CURRENT_TIMESTAMP()
);

drop procedure if exists debug_prc;

delimiter $$
create procedure debug_prc(in name varchar(32), in log varchar(128))
begin
    insert into debug(name, log) values (name, log);
end $$
delimiter ;

-- END DEBUG --

