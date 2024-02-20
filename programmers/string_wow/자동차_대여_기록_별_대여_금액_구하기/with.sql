with pay as (
	select history.history_id, datediff(history.end_date, history.start_date) + 1 as duration, car.daily_fee,
    case
    	when datediff(history.end_date, history.start_date) + 1 >= 90 then '90일 이상'
    	when datediff(history.end_date, history.start_date) + 1 >= 30 then '30일 이상'
    	when datediff(history.end_date, history.start_date) + 1 >= 7 then '7일 이상'
    end as type
    from car_rental_company_rental_history as history
    inner join car_rental_company_car as car
    	on history.car_id = car.car_id
    where car.car_type = '트럭'
)

select pay.history_id as history, round(pay.duration * pay.daily_fee * ((100 - ifnull(plan.discount_rate, 0)) / 100)) as fee
	from pay
    left join car_rental_company_discount_plan as plan
    	on pay.type = plan.duration_type
        	and plan.car_type = '트럭'
	order by fee desc, history_id desc
