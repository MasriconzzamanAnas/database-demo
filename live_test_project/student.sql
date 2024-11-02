-- Active: 1730537862313@@127.0.0.1@3306@school_management

CREATE TABLE classes(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)

CREATE TABLE students(
    student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    class_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`class_id`) REFERENCES classes(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)

CREATE TABLE subjects(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)

CREATE TABLE teachers(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    subject_id BIGINT UNSIGNED NOT NULL,
    Foreign Key (`subject_id`) REFERENCES subjects (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)

CREATE TABLE subject_student(
    student_id INT UNSIGNED NOT NULL,
    Foreign Key (`student_id`) REFERENCES students (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    subject_id BIGINT UNSIGNED NOT NULL,
    Foreign Key (`subject_id`) REFERENCES subjects (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)

CREATE TABLE teacher_subject(
    teacher_id BIGINT UNSIGNED NOT NULL,
    Foreign Key (`teacher_id`) REFERENCES teachers (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    subject_id BIGINT UNSIGNED NOT NULL,
    Foreign Key (`subject_id`) REFERENCES subjects (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)

INSERT INTO classes (class_name) VALUES
('Grade 1'),
('Grade 2'),
('Grade 3');

INSERT INTO students (first_name, last_name, age, class_id) VALUES
('John', 'Doe', 14, 1),
('Emma', 'Stone', 13, 2),
('Liam', 'Brown', 15, 3),
('Olivia', 'Johnson', 14, 1),
('Sophia', 'Wilson', 13, 2);

INSERT INTO subjects (subject_name) VALUES
('Mathematics'),
('Science'),
('English'),
('History');

INSERT INTO teachers (first_name, last_name, subject_id) VALUES
('Michael', 'Smith', 1),
('Emily', 'Davis', 2),
('Daniel', 'Garcia', 3),
('Linda', 'Martinez', 4);

INSERT INTO subject_student (student_id, subject_id) VALUES
(6, 1), (6, 2),
(7, 2), (7, 3),
(8, 1), (8, 3), (8, 4),
(9, 1), (9, 4),
(10, 2), (10, 3);


INSERT INTO teacher_subject (teacher_id, subject_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 2),
(2, 3);

-- 1. List all students with their first and last names.
SELECT first_name, last_name FROM students;

-- 2. Find the name and age of students who are 14 years old.
SELECT first_name, last_name, age FROM students WHERE age = 14;

-- 3. Show the names of all classes available in the school.
SELECT * FROM classes;

-- 4. List all teachers with their first and last names.
SELECT first_name, last_name FROM teachers;

-- 5. Display the names of all subjects taught in the school.
SELECT subject_name FROM subjects ;

-- 6. Retrieve a list of students along with their class names.
SELECT a.first_name, a.last_name, b.class_name FROM students a JOIN classes b ON a.class_id=b.id 

-- 7. Find the subjects assigned to a specific student (e.g., student_id = 1).
SELECT b.subject_name, a.student_id FROM subject_student a INNER JOIN subjects b ON a.subject_id=b.id WHERE student_id = 8

-- 8. List all teachers who teach "Mathematics".
SELECT a.first_name, a.last_name, b.id FROM teachers a JOIN  subjects b ON a.subject_id=b.id  WHERE b.subject_name ="Mathematics"

-- 9. Show the total number of students in each class.
SELECT a.class_name, COUNT(b.student_id) AS Total_student FROM classes a JOIN students b ON b.class_id=a.id GROUP BY class_name

-- 10. Display the names of all students who are enrolled in "Science".
SELECT a.first_name, a.last_name, b.subject_id FROM students a JOIN subject_student b ON a.student_id=b.student_id WHERE b.subject_id= 3


-- Check students
SELECT * FROM students WHERE student_id IN (6,7,8,9,10);

-- Check subjects
SELECT * FROM subjects WHERE id IN (1, 2, 3, 4);

