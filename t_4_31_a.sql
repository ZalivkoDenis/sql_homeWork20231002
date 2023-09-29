/*
 4.31. Дано трехзначное число. /Реализовано для числа с любым количеством знаков ))) /
    а) Верно ли, что все его цифры одинаковые?
 */

use hw_temp_mysql;

drop function if exists t_4_31_a;

delimiter $$

create function t_4_31_a(n int)
returns varchar(64)
deterministic
begin
    declare cifer, prev_cifer int;
    declare result bool default true;
    declare res_str varchar(64) default concat('В числе ', n);

    -- DEBUG --
    declare dbg_n varchar(64) default cast(n as nchar);
    -- END DEBUG --

    set cifer = n mod 10;

    cycle: while n > 0 do
        -- DEBUG --
        insert into debug (name, log)
        values (dbg_n,  concat('Number before processing: ', n));
        -- END DEBUG --

        set prev_cifer = cifer;
        set cifer = n mod 10;
        set n = n div 10;
        set result = result and (cifer = prev_cifer);

        -- DEBUG --
        insert into debug (name, log)
        values (dbg_n, concat('After processing: '
                'prev_cifer:', prev_cifer,
                ' cifer:', cifer,
                ' n: ', n,
                ' result:', if(result, 'TRUE', 'FALSE')
            ));
        -- END DEBUG --

        if not result then
            leave cycle;
        end if;
    end while;
    if result then
        return concat(res_str, ' все цифры одинаковые.');
    else
        return concat(res_str, ' некоторые цифры различаются.');
    end if;
end $$

delimiter ;

delete from debug;
select t_4_31_a(1111) as result;
select * from debug