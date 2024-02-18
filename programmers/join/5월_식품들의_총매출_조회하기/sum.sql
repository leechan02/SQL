select p.product_id, p.product_name, p.price * o.amount as total_sales
	from food_product as p
    join (
    	select product_id, sum(amount) as amount
        	from food_order
            where year(produce_date) = 2022 and month(produce_date) = 5
        	group by product_id
    ) as o
    	on p.product_id = o.product_id
    order by total_sales desc, p.product_id
