with recursive hours as (
	select 0 as value
	union all
	select value + 1
	from hours
	where value < 23
)

select hours.value as hour, count(animal_outs.animal_id) as count
	from hours
    left join animal_outs on hours.value = hour(animal_outs.datetime)
    group by hour
    order by hour
