CREATE DATABASE library;
USE library;

/*
article {article_id int (PK), article_keyword: varchar, article_author: varchar (FK),
article_subjectarea: varchar. article_title: varchar}
*/

CREATE TABLE article(
    article_id INT,
    article_keyword VARCHAR (30),
    article_author VARCHAR (30),
    article_subjectarea VARCHAR (30),
    article_title VARCHAR (30),
    PRIMARY KEY (article_id),
    FOREIGN KEY (article_author) REFERENCES author(author_id),
    FOREIGN KEY (article_subjectarea) REFERENCES subjectarea(subjectarea_id)
);

CREATE TABLE article_has_keyword(
    article_id INT,
    keyword_id INT,
    PRIMARY KEY (article_id, keyword_id),
    FOREIGN KEY (article_id) REFERENCES article(article_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);

/*
author {author_id: int (PK), author_firstname: varchar,  author_lastname: varchar}
crosstable: author - book {author_id: int (PK FK), book_id: int (PK FK)}
*/
CREATE TABLE author (
    author_id INT,
    author_firstname VARCHAR (30),
    author_lastname VARCHAR (30),
    PRIMARY KEY (author_id)
);

CREATE TABLE author_has_book (
    author_id INT,
    book_id INT,
    PRIMARY KEY (author_id, book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

/*
book {book_id: int (PK), book_isbn: int, book_name: varchar, publishinghouse_id: int (FK),
subjectarea_id: int (FK) }
crosstable: book - keywords {book_id: int (PK FK), keywords_id: int (PK FK)}
*/

CREATE TABLE book (
    book_id INT,
    book_isbn INT,
    book_name VARCHAR (30),
    publishinghouse_id INT,
    subjectarea_id INT,
    PRIMARY KEY (book_id),
    FOREIGN KEY (publishinghouse_id) REFERENCES publishinghouse(publishinghouse_id),
    FOREIGN KEY (subjectarea_id) REFERENCES subjectarea(subjectarea_id)
);

CREATE TABLE book_has_keywords (
    book_id INT,
    keywords_id INT,
    PRIMARY KEY (book_id, keywords_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (keywords_id) REFERENCES keyword(keyword_id)
);

/*
book copy {bookcopy_id: int (PK),  book_id (FK), shelf_id: int (FK)}
*/

CREATE TABLE  book_copy(
    book_copy_id INT,
    book_id INT,
    shelf_id INT,
    PRIMARY KEY (book_copy_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (shelf_id) REFERENCES shelf(shelf_id)
);

/*
customer {customer_id: int (PK), customer_firstname_ varchar, customer_lastname: varchar}
*/

CREATE TABLE customer(
    customer_id INT,
    customer_firstname VARCHAR (30),
    customer_lastname VARCHAR (30),
    PRIMARY KEY (customer_id)
);

/*
employee {employee_id: int (PK), employee_firstname: varchar, employee_lastname: varchar}
*/

CREATE TABLE employee(
    employee_id INT,
    employee_firstname VARCHAR (30),
    employee_lastname VARCHAR (30),
    PRIMARY KEY (employee_id)
);

/*
journal {journal_id: int (PK), shelf_id: int (FK), journal_name: varchar, publishinghouse_id: int (FK),
subjectarea_id: int (FK) }
*/

CREATE TABLE journal(
    journal_id INT,
    shelf_id INT,
    journal_name VARCHAR (30),
    publishing_house_id INT,
    subject_area_id INT,
    PRIMARY KEY (journal_id),
    FOREIGN KEY (publishing_house_id) REFERENCES publishinghouse(publishinghouse_id),
    FOREIGN KEY (subject_area_id) REFERENCES subjectarea(subjectarea_id)
);

/*
keyword {keyword_id: int (PK), keyword_name: varchar}
*/

CREATE TABLE keyword(
    keyword_id INT,
    keyword_name VARCHAR (30),
    PRIMARY KEY (keyword_id)
);

/*
loan {loan_id: int (PK), loan_customer_id: int (FK), loan_employee_id_input: int (FK),
loan_employee_id_output: int (FK), loan_reservation_id: int (FK), loan_returndate: date,
loan_ createdate: date} crosstable: loan - bookcopy {loan_id (PK FK), bookcopy_id (PK FK)}
*/

CREATE TABLE loan(
    loan_id INT,
    loan_customer_id INT,
    loan_employee_id_input INT,
    loan_employee_id_output INT,
    loan_reservation_id INT,
    loan_returndate DATE,
    loan_createdate DATE,
    PRIMARY KEY (loan_id),
    FOREIGN KEY (loan_customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (loan_employee_id_input) REFERENCES employee(employee_id),
    FOREIGN KEY (loan_employee_id_output) REFERENCES employee(employee_id),
    FOREIGN KEY (loan_reservation_id) REFERENCES reservation(reservation_id)
);

CREATE TABLE loan_has_bookcopy(
    loan_id INT,
    book_copy_id INT,
    PRIMARY KEY (loan_id, book_copy_id),
    FOREIGN KEY (loan_id) REFERENCES loan(loan_id),
    FOREIGN KEY  (book_copy_id) REFERENCES book_copy(book_copy_id)
);

/*
publishing house {publishing_house_id: int (PK), publishing_house_name: varchar}
*/

CREATE TABLE publishinghouse(
    publishinghouse_id INT,
    publishinghouse_name VARCHAR (30),
    PRIMARY KEY (publishinghouse_id)
);

/*
reservation {reservation_id: int (PK), reservation_customer_id: int (FK), reservation_date: date }
crosstable: reservation - bookcopy {reservation_id (PK FK), bookcopy_id (PK FK)}
*/

CREATE TABLE reservation(
    reservation_id INT,
    reservation_customer_id INT,
    reservation_date DATE,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (reservation_customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE reservation_has_bookcopy(
    reservation_id INT,
    bookcopy_id INT,
    PRIMARY KEY (reservation_id, bookcopy_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (bookcopy_id) REFERENCES book_copy(book_copy_id)
);

/*
shelf {shelf_id: int (PK), subjectarea_id: int (FK)}
*/

CREATE TABLE shelf(
    shelf_id INT,
    subjectarea_id INT,
    Primary Key (shelf_id),
    FOREIGN KEY (subjectarea_id) REFERENCES subjectarea(subjectarea_id)
);

/*
subject area {subjectarea_id: int (PK), subjectarea_name: varchar}
*/

CREATE TABLE subjectarea(
    subjectarea_id INT,
    subjectarea_name VARCHAR (30),
    PRIMARY KEY (subjectarea_id)
);

/*
synonym crosstable: synonym - keyword {synonym_keyword ( PK FK),keyword_id (PK FK)}
*/

CREATE TABLE synonym(
    synonym_id INT,
    synonym_name VARCHAR (30),
    PRIMARY KEY (synonym_id)
);

CREATE TABLE synonym_has_keyword(
    synonym_id INT,
    keyword_id INT,
    PRIMARY KEY (synonym_id, keyword_id),
    FOREIGN KEY (synonym_id) REFERENCES synonym(synonym_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);

INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('101', 'Franz','Kafka');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('102', 'Hermann','Hesse');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('145', 'Fjodor','Dostojewski');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('205', 'Thomas','Bernhard');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('305', 'William','Golding');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('258', 'George','Orwell');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('359', 'Aldous','Huxley');
INSERT INTO author (author_id, author_firstname, author_lastname) VALUES ('456', 'Leo','Tolstoy');

INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('203', '1234', 'Die Verwandlung','1', '3');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('456', '2345', 'Unterm Rad','2', '1');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('147', '2565', 'Narziß und Goldmund','2', '1');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('234', '4567', 'Der Steppenwolf','2', '1');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('423', '7895', 'Schuld und Sühne','3', '2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('785', '7415', 'Der Idiot','3','2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('965', '74582', 'Die Brüder Karamasov', '3', '2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('565', '7415', 'Die Dämonen','3','2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('789', '7963', 'Der Untergeher','1','2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('146', '7536', 'Frost','1','2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('987', '9875', 'Lord of the flies','2','3');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('876', '8765', '1985','2','3');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('765', '2365', 'Animal Farm','2','4');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('654', '7654', 'Brave new world','2','3');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('543', '2364', 'Krieg und Frieden','3','2');
INSERT INTO book (book_id, book_isbn, book_name, publishinghouse_id, subjectarea_id)
VALUES ('384', '6532', 'Anna Karenina','3','2');

INSERT INTO customer (customer_id, customer_firstname, customer_lastname) VALUES ('005', 'Hans', 'Rauscher');
INSERT INTO customer (customer_id, customer_firstname, customer_lastname) VALUES ('025', 'Ottfried', 'Fischer');
INSERT INTO customer (customer_id, customer_firstname, customer_lastname) VALUES ('253', 'Barbara', 'Stöckl');
INSERT INTO customer (customer_id, customer_firstname, customer_lastname) VALUES ('452', 'Pamela', 'Rendi-Wagner');
INSERT INTO customer (customer_id, customer_firstname, customer_lastname) VALUES ('185', 'Armin', 'Wolf');

INSERT INTO employee (employee_id, employee_firstname, employee_lastname) VALUES ('01', 'Dieter', 'Bohlen');
INSERT INTO employee (employee_id, employee_firstname, employee_lastname) VALUES ('02', 'Verona', 'Feldbusch');
INSERT INTO employee (employee_id, employee_firstname, employee_lastname) VALUES ('03', 'Thomas', 'Anders');

INSERT INTO journal (journal_id, shelf_id, journal_name, publishing_house_id, subject_area_id)
VALUES ('1', '1', 'Die gute Küche', '2', '5');
INSERT INTO journal (journal_id, shelf_id, journal_name, publishing_house_id, subject_area_id)
VALUES ('2', '1', 'Die durchschnittliche Küche', '2', '5');
INSERT INTO journal (journal_id, shelf_id, journal_name, publishing_house_id, subject_area_id)
VALUES ('3', '1', 'Die schlechte Küche', '2', '5');

INSERT INTO keyword (keyword_id, keyword_name) VALUES ('1', 'Bildung');
INSERT INTO keyword (keyword_id, keyword_name) VALUES ('2', 'Dystopie');
INSERT INTO keyword (keyword_id, keyword_name) VALUES ('3', 'Gesellschaft');

INSERT INTO loan (loan_id, loan_customer_id, loan_employee_id_input, loan_employee_id_output, loan_reservation_id,
                  loan_returndate, loan_createdate)
VALUES ('1','005', '00', '00', '25', '2022-12-24', '2022-08-12');

INSERT INTO publishinghouse (publishinghouse_id, publishinghouse_name) VALUES ('1', 'CH. Beck');
INSERT INTO publishinghouse (publishinghouse_id, publishinghouse_name) VALUES ('2', 'Random House');
INSERT INTO publishinghouse (publishinghouse_id, publishinghouse_name) VALUES ('3', 'Fischer');

INSERT INTO reservation (reservation_id, reservation_customer_id, reservation_date)
VALUES ('12', '005', '2022-05-23');
INSERT INTO reservation (reservation_id, reservation_customer_id, reservation_date)
VALUES ('36', '253', '2023-01-05');

INSERT INTO shelf (shelf_id, subjectarea_id) VALUES ('1', '5');
INSERT INTO shelf (shelf_id, subjectarea_id) VALUES ('2', '4');
INSERT INTO shelf (shelf_id, subjectarea_id) VALUES ('3', '2');
INSERT INTO shelf (shelf_id, subjectarea_id) VALUES ('4', '3');
INSERT INTO shelf (shelf_id, subjectarea_id) VALUES ('5', '1');

INSERT INTO subjectarea (subjectarea_id, subjectarea_name) VALUES ('1', 'Bildungsroman');
INSERT INTO subjectarea (subjectarea_id, subjectarea_name) VALUES ('2', 'Realismus');
INSERT INTO subjectarea (subjectarea_id, subjectarea_name) VALUES ('3', 'Science Fiction');
INSERT INTO subjectarea (subjectarea_id, subjectarea_name) VALUES ('4', 'Politik');
INSERT INTO subjectarea (subjectarea_id, subjectarea_name) VALUES ('5', 'Kochen');

INSERT INTO synonym (synonym_id, synonym_name) VALUES ('1', 'Zukunft');
INSERT INTO synonym (synonym_id, synonym_name) VALUES ('2', 'Gesellschaft');
INSERT INTO synonym (synonym_id, synonym_name) VALUES ('3', 'Haushalt');






