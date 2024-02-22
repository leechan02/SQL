select id, email, first_name, last_name
	from developers as d
    where (d.skill_code & (select code from skillcodes where name = 'Python')) <> 0 
    	or (d.skill_code & (select code from skillcodes where name = 'C#')) <> 0
    order by id;
