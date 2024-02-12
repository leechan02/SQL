select product_code, sum((price * sales_amount)) as sales
	from product
    inner join offline_sale on product.product_id = offline_sale.product_id
    group by product_code
    order by sales desc, product_code
