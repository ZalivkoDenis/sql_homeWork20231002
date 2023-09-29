/*
 4.37. Проверить, принадлежит ли число, введенное с клавиатуры, интервалу (–5, 3).
 */

use hw_temp_mysql;

drop function if exists t_4_37;

delimiter $$
create function t_4_37()
    returns BOOL
    deterministic
begin

    return TRUE;
end $$


delimiter ;

select t_4_37() as result;