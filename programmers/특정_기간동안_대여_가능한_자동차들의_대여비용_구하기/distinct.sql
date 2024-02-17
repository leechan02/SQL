with c as (
    select c.car_id, c.car_type, c.daily_fee
        from (
            select distinct car_id
                 from car_rental_company_rental_history
                 where start_date <= '2022-11-30' and end_date >= '2022-11-01'
        ) as h
        right join car_rental_company_car as c
            on h.car_id = c.car_id
        where h.car_id is null
)
    
select c.car_id, c.car_type, round((c.daily_fee * (100 - p.discount_rate) / 100) * 30) as fee
	from c
   	join (
    	select car_type, discount_rate
        	from car_rental_company_discount_plan
        	where duration_type = '30일 이상'
    ) as p
    	on c.car_type = p.car_type
    where c.car_type in ('세단', 'SUV')
        and round((c.daily_fee * (100 - p.discount_rate) / 100) * 30) between 500000 and 2000000
	order by fee desc, c.car_type, c.car_id desc
    
