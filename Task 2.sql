---- for checking constraints in the table----
SELECT * FROM all_constraints WHERE table_name = 'CATEGORIES';
--------------------------------------------------------------------------------
-- TCL Commands -- 
----savepoint----
----it is used to can roll the transaction back to a certain point----
savepoint a;
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 2);
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (2, 3);
savepoint b;
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (3, 1);
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (4, 2);
--------------------------------------------------------------------------------
select * from bookauthors;
----rollback----
----it is used to undo all the changes on the current transaction----
rollback to a;
rollback to b;
--------------------------------------------------------------------------------
----commit----
----it is used to save the changes on the transactions is permanent----
commit;
--------------------------------------------------------------------------------
-- DML Commands --
-- ===== CATEGORIES =====
INSERT INTO Categories (CategoryID,CategoryName) VALUES (seq_categories.NEXTVAL,'Fiction');
INSERT INTO Categories (CategoryID,CategoryName) VALUES (seq_categories.NEXTVAL,'Science');
INSERT INTO Categories (CategoryID,CategoryName) VALUES (seq_categories.NEXTVAL,'Technology');
INSERT INTO Categories (CategoryID,CategoryName) VALUES (seq_categories.NEXTVAL,'History');
INSERT INTO Categories (CategoryID,CategoryName) VALUES (seq_categories.NEXTVAL,'Mystery');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (seq_categories.NEXTVAL, 'Biography');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (seq_categories.NEXTVAL, 'Fantasy');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (seq_categories.NEXTVAL, 'Health');

-- ===== AUTHORS =====
INSERT INTO Authors (AuthorID,Name) VALUES (seq_authors.nextval,'George Orwell');
INSERT INTO Authors (AuthorID,Name) VALUES (seq_authors.nextval,'Isaac Newton');
INSERT INTO Authors (AuthorID,Name) VALUES (seq_authors.nextval,'Stephen King');
INSERT INTO Authors (AuthorID,Name) VALUES (seq_authors.nextval,'Dan Brown');
INSERT INTO Authors (AuthorID,Name) VALUES (seq_authors.nextval,'Yuval Noah Harari');
INSERT INTO Authors (AuthorID, Name) VALUES (seq_authors.nextval, 'Paulo Coelho');
INSERT INTO Authors (AuthorID, Name) VALUES (seq_authors.nextval, 'J.K. Rowling');
INSERT INTO Authors (AuthorID, Name) VALUES (seq_authors.nextval, 'Yuval Noah Harari');
INSERT INTO Authors (AuthorID, Name) VALUES (seq_authors.nextval, 'Malcolm Gladwell');

-- ===== BOOKS =====
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval,'1984', 1, 1949);
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval, 'Principia Mathematica', 2, 1687);
INSERT INTO Books (BookID, Title, CategoryID) VALUES (seq_books.nextval,'The Unknown Book', NULL);  -- NULL category, NULL year
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval,'Inferno', 5, 2013);
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval,'Sapiens', 4, 2011);
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval, 'Sapiens', 6, 2011);
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval, 'Outliers', 8, 2008);
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval, 'Harry Potter and the Goblet of Fire', 7, 2000);
INSERT INTO Books (BookID, Title, CategoryID, YearPublished) VALUES (seq_books.nextval, 'The Pilgrimage', 6, 1987);

-- ===== MEMBERS =====
INSERT INTO Members (MemberID, FullName, Email) VALUES (seq_members.NEXTVAL, 'Tarun Kumar', 'tarun@example.com');
INSERT INTO Members (MemberID, FullName, Email) VALUES (seq_members.NEXTVAL, 'Anita Rao', NULL);
INSERT INTO Members (MemberID, FullName, Email) VALUES (seq_members.NEXTVAL, 'Ravi Teja', 'ravi@example.com');
INSERT INTO Members (MemberID, FullName, Email) VALUES (seq_members.NEXTVAL, 'Sneha Joshi', 'sneha.j@example.com');
INSERT INTO Members (MemberID, FullName, Email) VALUES (seq_members.NEXTVAL, 'Priya Sharma', 'priya.s@example.com');
INSERT INTO Members (MemberID, FullName, Email, JoinDate) VALUES (seq_members.NEXTVAL, 'Aarav Mehta', 'aarav.m@example.com', DATE '2024-07-15');
INSERT INTO Members (MemberID, FullName, Email, JoinDate) VALUES (seq_members.NEXTVAL, 'Divya Kapoor', 'divya.k@example.com', DATE '2024-09-30');
INSERT INTO Members (MemberID, FullName, Email, JoinDate) VALUES (seq_members.NEXTVAL, 'Manoj Bhatia', 'manoj.b@example.com', DATE '2025-01-10');


-- ===== BOOKAUTHORS (Many-to-Many) =====
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 1);  -- 1984 - Orwell
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (2, 2);  -- Newton
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (3, 3);  -- Unknown Book - King
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (4, 4);  -- Inferno - Dan Brown
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (5, 5);  -- Sapiens - Harari
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (5, 4);  -- Sapiens - Co-authored by Dan Brown
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (7, 8); -- Sapiens by Yuval
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (8, 9); -- Outliers by Gladwell
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (9, 7); -- Harry Potter by Rowling
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (10, 6); -- Pilgrimage by Coelho


-- ===== LOANS =====
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate) VALUES (seq_loans.NEXTVAL, 1, 1, SYSDATE - 5);
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate) VALUES (seq_loans.NEXTVAL, 4, 3, SYSDATE - 3);
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES (seq_loans.NEXTVAL, 2, 1, SYSDATE - 15, SYSDATE - 5);
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate) VALUES (seq_loans.NEXTVAL, 5, 2, SYSDATE - 1);
INSERT INTO Loans (LoanID, MemberID, BookID, LoanDate, ReturnDate) VALUES (seq_loans.NEXTVAL, 6, 7, DATE '2025-08-01', NULL);
INSERT INTO Loans (LoanID, MemberID, BookID, LoanDate, ReturnDate) VALUES (seq_loans.NEXTVAL, 7, 8, DATE '2025-08-02', DATE '2025-08-07');
INSERT INTO Loans (LoanID, MemberID, BookID, LoanDate, ReturnDate) VALUES (seq_loans.NEXTVAL, 8, 9, DATE '2025-08-05', NULL); 


-- Tables --
select * from categories;
select * from authors;
select* from Books;
select * from Members;
select * from BookAuthors;
select * from Loans;

select * from loans1; -- duplicate table for manipulation of data.
desc loans1; -- Description of table

-- Updating data --
update Books set categoryid = 3, yearpublished = 1997 where bookid = 3; 
update books set title = 'Harry potter' where bookid = 3;
update books set categoryid = 1 where bookid = 3;
update members set email = 'anita@example.com' where memberid = 2;


-- Deleting Data --
create table loans1 as select * from loans; -- we can create table by referencing the existing table

delete from loans1 where loanid = 4;
delete from loans1;

-- Alter Table data --
alter table loans1 drop column returndate;
alter table loans1 rename column loandate to Borrowdate;
alter table loans1 add returndate date;
alter table loans1 rename column Borrowdate to loandate;
alter table loans1 modify bookid int; -- column to be modified must be empty to decrease precision or scale

-- Truncate --
truncate table loans1; -- once we truncate table it cannot be rollbacked
-- Drop --
drop table loans1; -- once we drop table it cannot be rollbacked
-- DDL Commands are auto commit statements. --
--DML Commands are saved when only it is commited. --