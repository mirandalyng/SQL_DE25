/* 
==========================
0.Making a course DATABASE
==========================
*/

-- CREATE TABLE 
CREATE TABLE IF NOT EXISTS course_structure (
    content VARCHAR, 
    week INTEGER, 
    content_type VARCHAR 
); 

--ingest data 
INSERT INTO
     course_structure (content, week, content_type)
VALUES
('00_intro', 46, 'lecture'),
    ('01_course_structure', 46, 'lecture'),
    ('02_setup_duckdb', 46, 'lecture'),
    ('exercise_0', 46, 'exercise'),
    ('tenta', 51, 'exam'); 

--select all lecutres 
SELECT
    *
FROM
    course_structure
WHERE
    content_type = 'lecture';