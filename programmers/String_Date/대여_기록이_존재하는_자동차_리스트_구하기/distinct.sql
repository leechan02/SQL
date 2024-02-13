select distinct car.car_id
	from (
    	select *
        	from car_rental_company_car as car
        	where car_type = '세단'
    ) as car
    inner join car_rental_company_rental_history as history
    	on car.car_id = history.car_id
    where month(history.start_date) = 10
    order by car.car_id desc
