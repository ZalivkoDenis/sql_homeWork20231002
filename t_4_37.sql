/*
 4.37. Проверить, принадлежит ли число, введенное с клавиатуры, интервалу (–5, 3).
 */

use hw_temp_mysql;

drop function if exists t_4_37;

delimiter $$
create function t_4_37(n int)
    returns varchar(64)
    deterministic
begin
    if n >= -5 and n <= 3 then
        return concat('Число ', n, ' входит в интервал [-5;3]');
    else
        return concat('Число ', n, ' НЕ входит в интервал [-5;3]');
    end if;
end $$


delimiter ;


/*
Проверим все int от -10 до 10 ))))
*/

select t_4_37(enumN.value) as result
from (
     with recursive nums as (
         select -10 as value
         union all
         select value + 1 as value
         from nums
         where nums.value < 10
     ) select value from nums
) as enumN;

