select i.item_id, i.item_name, i.rarity
	from item_info as i
    where i.item_id not in (
        select distinct parent_item_id
        	from item_tree
        	where item_tree.parent_item_id is not null
    )
    order by i.item_id desc
