select board_id, writer_id, title, price,
	case
    	when status = 'sale' then '판매중'
        when status = 'reserved' then '예약중'
        else '거래완료'
    end status
	from used_goods_board
    where created_date like '2022-10-05%'
    order by board_id desc
