INSERT INTO authors (firstname, lastname, country, date_of_birth, date_of_death) 
VALUES 
    ('Victor', 'Hugo', 'France', '1802-02-26', '1885-05-22'),
    ('Camember', 'Jules', 'France', '1828-02-08', '1905-03-24'),
    ('Tyler', 'Creator', 'UK', '1903-06-25', '1950-01-21');

INSERT INTO editors (name) 
VALUES 
    ('Poppins'), 
    ('Calamardo'), 
    ('Mickey Mouse');

INSERT INTO books (title, year, author_id) 
VALUES 
    ('Los Miserables', 1862, 1),
    ('Trinta', 1949, 3),
    ('50 sombras sobre gref', 1870, 2);

INSERT INTO book_editions (isbn, book_id, editor_id, publication_date) 
VALUES 
    ('123456789', 1, 1, '2000-06-15'),
    ('987654321', 2, 2, '2010-09-20'),
    ('567891234', 3, 3, '2015-04-10');

INSERT INTO members (firstname, lastname, email, date_of_birth, registered) 
VALUES 
    ('Alice', 'Dupont', 'alice@example.com', '1990-05-15', TRUE),
    ('Bob', 'Martin', 'bob@example.com', '1985-07-30', TRUE);

INSERT INTO loans (book_edition_isbn, member_id, loan_date, return_date, is_returned) 
VALUES 
    ('123456789', 1, '2024-01-01', '2024-01-10', FALSE),
    ('987654321', 2, '2024-01-05', '2024-01-15', TRUE),
    ('567891234', 1, '2024-01-07', '2024-01-12', FALSE);
    





SELECT firstname, lastname FROM authors;
SELECT name FROM editors WHERE name LIKE '%,%';
SELECT loans.id, members.firstname, members.lastname, loans.loan_date, loans.return_date 
FROM loans
JOIN members ON loans.member_id = members.id
WHERE loans.return_date < CURDATE() AND loans.is_returned = FALSE;
SELECT title FROM books WHERE LENGTH(title) < 50;
