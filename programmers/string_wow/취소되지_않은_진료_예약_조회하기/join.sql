select a.apnt_no, p.pt_name, p.pt_no, d.mcdp_cd, d.dr_name, a.apnt_ymd
	from patient p
   	join appointment a on p.pt_no = a.pt_no
    join doctor d on a.mddr_id = d.dr_id
    where apnt_ymd like '2022-04-13%'
    	and apnt_cncl_yn = 'N'
        and d.mcdp_cd = 'CS'
    order by apnt_ymd
