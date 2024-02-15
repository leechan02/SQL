select f.flavor
	from (
    	select flavor, sum(total_order) as 'order'
        	from july
        	group by flavor
    ) as j
    join first_half as f on j.flavor = f.flavor
    order by (j.order + f.total_order) desc
    limit 3
