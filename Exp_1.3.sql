CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_id, student_name)
VALUES (1, 'KARAN'), (2, 'GAURI');

INSERT INTO Courses (course_id, course_title)
VALUES (101, 'Mathematics'), (102, 'Physics');

START TRANSACTION;

INSERT INTO Enrollments (student_id, course_id, grade)
VALUES (1, 101, 'A'); 

SAVEPOINT after_first_enrollment;

INSERT INTO Enrollments (student_id, course_id, grade)
VALUES (99, 102, 'B'); 

ROLLBACK TO SAVEPOINT after_first_enrollment;

COMMIT;

SELECT 
    s.student_name,
    c.course_title,
    e.grade
FROM 
    Enrollments e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id;
