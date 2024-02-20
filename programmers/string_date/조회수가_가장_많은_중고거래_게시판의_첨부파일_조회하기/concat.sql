select concat('/home/grep/src/', file.board_id, '/', file_id, file_name, file_ext) as file_path
	from (
        select board_id
			from used_goods_board as board
        	where views = (select max(views) from used_goods_board)
    ) as board
    inner join used_goods_file as file
    	on board.board_id = file.board_id
    order by file_id desc
