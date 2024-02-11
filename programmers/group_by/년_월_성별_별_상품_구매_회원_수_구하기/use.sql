select year(sales_date) as year, month(sales_date) as month, gender, count(distinct user_info.user_id) as users
	from user_info
    inner join online_sale on user_info.user_id = online_sale.user_id
    where gender is not null
    group by year(sales_date), month(sales_date), gender
    order by year(sales_date), month(sales_date), gender
