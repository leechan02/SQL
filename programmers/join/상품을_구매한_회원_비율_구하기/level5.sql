with users_list as (
	select *
		from user_info
 	   	where year(joined) = 2021
)

select s.y as year, s.m as month, count(*) as puchased_users, round((count(*) / (
	select count(*)
    	from user_info
    	where year(joined) = 2021
)), 1) as puchased_ratio
	from users_list as l
    join (
    	select distinct user_id, year(sales_date) as y, month(sales_date) as m
        	from online_sale
    ) as s on l.user_id = s.user_id
    group by s.y, s.m
    order by year, month
