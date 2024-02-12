select book_id, author_name, date_format(published_date, '%Y-%m-%d') as published_date
	from book
    inner join author on book.author_id = author.author_id
    where category = '경제'
    order by published_date
