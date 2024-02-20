select f.item_id, f.item_name, f.rarity
	from (
    	select *
        	from item_info
        	where rarity = 'RARE'
    ) as i
    join item_tree as t
    	on t.parent_item_id = i.item_id
    join item_info as f
    	on f.item_id = t.item_id
    order by f.item_id desc
