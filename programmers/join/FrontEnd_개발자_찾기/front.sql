with front as (
	select *
    	from skillcodes
    	where category = 'Front End'
)

select distinct d.id, d.email, d.first_name, d.last_name
	from developers as d
    join front as f
    	on d.skill_code & f.code
    order by id
