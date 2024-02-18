select i.item_id, i.item_name
	from (
    	select *
        	from item_tree
        	where parent_item_id is null
    ) as t
    join item_info as i
    	on t.item_id = i.item_id
    order by i.item_id
