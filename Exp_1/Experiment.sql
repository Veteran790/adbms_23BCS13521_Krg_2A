--------------------------- EASY---------------------------
--Author-Book Relationship Using Joins and Basic SQL Operations

CREATE DATABASE AUTHBOOK;
USE AUTHBOOK;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(100)
);
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_id, author_name, country) 
VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George R.R. Martin', 'United States'),
(3, 'Haruki Murakami', 'Japan');

INSERT INTO Books (book_id, title, author_id) 
VALUES
(101, 'Harry Potter and the Philosopher\'s Stone', 1),
(102, 'A Game of Thrones', 2),
(103, 'Norwegian Wood', 3);

SELECT 
    Books.title AS book_title,
    Authors.author_name,
    Authors.country
FROM 
    Books
INNER JOIN 
    Authors ON Books.author_id = Authors.author_id;



------------------------- MEDIUM ----------------------
--Department-Course Subquery and Access Control

CREATE DATABASE DEPTCOURSES;
USE DEPTCOURSES;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Biotechnology'),
(5, 'Economics');

INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Algorithms', 1),
(104, 'Calculus', 2),
(105, 'Linear Algebra', 2),
(106, 'Quantum Mechanics', 3),
(107, 'Classical Mechanics', 3),
(108, 'Genetics', 4),
(109, 'Microbiology', 4),
(110, 'Econometrics', 5);

SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Courses
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);
