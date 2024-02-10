SELECT USER_ID, NICKNAME, SUM(PRICE) AS TOTAL_SALES
	FROM USED_GOODS_BOARD AS BOARD
    INNER JOIN USED_GOODS_USER AS USER
    ON BOARD.WRITER_ID = USER.USER_ID
    WHERE STATUS = 'DONE'
    GROUP BY USER_ID
    HAVING TOTAL_SALES >= 700000
    ORDER BY TOTAL_SALES
