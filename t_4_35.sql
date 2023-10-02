/*
4.35.*Имеется стол прямоугольной формы с размерами a b (a и b — целые числа,
a > b). В каком случае на столе можно разместить большее количество кар-
тонных прямоугольников с размерами c d (c и d — целые числа, c > d): при
размещении их длинной стороной вдоль длинной стороны стола или вдоль
короткой. Прямоугольники не должны лежать один на другом и не должны
свисать со стола.
 */

use hw_temp_mysql;

drop function if exists t_4_35;

delimiter $$
create function t_4_35(a int, b int, c int, d int)
    returns enum('by_long', 'by_short')
    deterministic
begin

    -- DEBUG --
    call debug_prc(null, concat('Values (a, b, c, d): ', a, ', ', b, ', ', c, ', ', d));
    call debug_prc(null, concat('a div c = ', a div c, '   a div d = ', a div d));
    -- END DEBUG --

    if a div c >= a div d then
        -- DEBUG --
        call debug_prc(null, 'result: ''by_long''');
        -- END DEBUG --

        return 'by_long';
    else
        -- DEBUG --
        call debug_prc(null, 'result: ''by_short''');
        -- END DEBUG --

        return 'by_short';
    end if;
end $$


delimiter ;


delete from debug;
select t_4_35(20, 10, 5, 5) as result;
select * from debug