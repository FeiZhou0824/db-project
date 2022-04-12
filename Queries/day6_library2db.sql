
-- USR LOWERCASE FOR TABLE NAME
-- THIS PARTICULAR DATABASE CONFIGURED TO ONLY USE LOWERCASE FOR TABLE

SELECT COUNT(*) FROM books;

SELECT COUNT(*) FROM users;

-- display the book name and book category name
-- books, book_categories tables are related by book_category_id
SELECT books.name, book_categories.name
FROM books
         INNER JOIN book_categories ON books.book_category_id = book_categories.id;

SELECT b.name,bc.name
FROM books b
         INNER JOIN book_categories bc ON b.book_category_id = bc.id;