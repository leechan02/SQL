select user.user_id, user.nickname, concat_ws(" ", user.city, user.street_address1, user.street_address2) as '전체주소', concat_ws("-", left(user.tlno, 3), mid(user.tlno, 4, 4), right(user.tlno, 4)) as '전화번호'
	from (
    	select writer_id
        	from used_goods_board
        	group by writer_id
        	having count(*) > 2
    ) as board
    inner join used_goods_user as user
    	on board.writer_id = user.user_id
	order by user.user_id desc
