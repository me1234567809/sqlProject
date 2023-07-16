create database schoolManagement;
use schoolManagement;

/*Students table inorder to store the basic information of all the students*/
CREATE TABLE students (student_id INT PRIMARY KEY,
name VARCHAR(50), date_of_birth DATE,
address VARCHAR(100),contact_number VARCHAR(15)
);

/*courses table inorder to store the basic information of all courses provided*/
CREATE TABLE courses (course_id INT PRIMARY KEY,
name VARCHAR(50),
description VARCHAR(200),credits INT);

/*grades table inorder to store the grades of students in different courses enrolled*/
CREATE TABLE grades (
student_id INT, course_id INT,
grade FLOAT,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

/*enrollments table inorder to manage the student enrollments in course*/
CREATE TABLE enrollments (
student_id INT,
course_id INT,
enrollment_date DATE,
PRIMARY KEY (student_id, course_id),
 FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (Course_id) REFERENCES courses (course_id));

INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (1, 'John Doe', '1995-07-15',' 123 Main Street', '555-1234');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (2, 'John Doe2', '1995-07-14',' 1234 Main Street', '5565-1234');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (3, 'John Doe3', '1995-07-17',' 12345 Main Street', '755-1234');

select * from students;
/*selecting students based on some student_id*/
SELECT * FROM students WHERE student_id = 1;

INSERT INTO courses (course_id, name, description, credits)
VALUES (101, 'Mathematics', 'Introduction to Calculus', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES (102, 'Mathematics1', 'Introduction to Calculus1', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES (103, 'Science', 'Introduction to Science', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES (104, 'Social', 'History', 3);


SELECT * FROM courses WHERE course_id=101;

INSERT INTO grades (student_id, course_id, grade)
VALUES (1, 101, 85.5);
INSERT INTO grades (student_id, course_id, grade)
VALUES (1, 102, 95.5);
INSERT INTO grades (student_id, course_id, grade)
VALUES (2, 103, 75.5);
INSERT INTO grades (student_id, course_id, grade)
VALUES (3, 104, 68.5);

UPDATE grades SET grade=90.0 WHERE student_id = 1 AND course_id=101;


INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 101, '2023-01-01');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 102, '2023-02-01');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (2, 103, '2023-03-01');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (3, 104, '2023-04-01');

/*enrolled courses by student whoes id is 1*/
SELECT courses.* FROM courses
JOIN enrollments ON courses.course_id = enrollments.course_id WHERE enrollments.student_id = 1;

/*average grade of student whoes id is 1*/
SELECT AVG(grade) FROM grades WHERE student_id = 1;

/*information of top 2 students */
SELECT students.* , AVG(grades.grade) AS average_grade from students JOIN grades ON students.student_id = grades. student_id
GROUP BY students.student_id ORDER BY average_grade DESC
LIMIT 2;