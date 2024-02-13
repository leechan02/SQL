select animal_id, name
	from (select datediff(animal_outs.datetime, animal_ins.datetime) as date, animal_ins.animal_id as animal_id, animal_ins.name as name
		from animal_ins
    	inner join animal_outs on animal_ins.animal_id = animal_outs.animal_id
    	order by date desc) as animal
    limit 2
