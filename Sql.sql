



		--  CREATING OF STUDENTS TABLE
			
		create table students(
		     id int PRIMARY KEY AUTO_INCREMENT,
		     student_id varchar(50),
		     student_name varchar(50),
		     dob date,
		     email varchar(50),
		     phone int(20)
		);


		--  ADDING A COLUMN TO AN EXISTING TABLE
		
		alter table students add (created_at timestamp);

		
		alter table students add (date_of_birth varchar(50));

		alter table students add (marks int(10));



		--  DROPPING A COLUMN

		alter table students drop column dob;




		--  INSERTING RECORDS OR VALUES INTO STUDENTS TABLE
		
		insert into students(student_id, student_name, date_of_birth, email, phone ) 
                values ('CSD4.2M001', 'Robert Bazuku', 1978-02-26, 'robert@gamil.com', 0541547251);

		insert into students(student_id, student_name, date_of_birth, email, phone ) 
                values ('CSD4.2M002', 'Jonas Adogbongo', 1990-12-17, 'jonas@hotmail.com', 0206873453);

		insert into students(student_id, student_name, date_of_birth, email, phone ) 
                values ('CSD4.2M003', 'Ishaw Yidana', 1999-04-11, 'yidana@yahoo.com', 0593678923);




		--  UPDATE A SINGLE COLUMN

		update students set date_of_birth = '2000-01-01' where id = 3;



		--  CREATING OF COURSES TABLE

		create table course (
		id int primary key auto_increment,
		course_id varchar(20),
		course_name varchar(50),
		course_fee decimal(10,3).
		student_id varchar(50),
		created_at timestamp,
		updated_at timestamp
		);



		--  SELECTING ALL RECORDS FROM COURSES TABLE

		select * from courses;


		--  INSERTING VALUES INTO COURSES TABLE
  insert into courses(course_id,course_name,course_fee,student_id) values('CSD4.2','CERTIFICATE IN SOFTWARE DEVELOPMENT',1500.460,'CSD4.2M001')
  insert into courses(course_id,course_name,course_fee,student_id) values('CSD4.2','CERTIFICATE IN SOFTWARE DEVELOPMENT',1500.460,'CSD4.2M002')
  insert into courses(course_id,course_name,course_fee,student_id) values('CSD4.2','CERTIFICATE IN SOFTWARE DEVELOPMENT',1500.460,'CSD4.2M003')





	--  ADDING A FORIEGN KEY TO THE COURSES TABLE
		ALTER TABLE COURSE add CONSTRAINT fk_id foreign





		 -- SELECTING A STUDENT WITH THE MARKS GREATER THAN 80%
   
   select * from students where marks >= 80;
   
   
   
   --  SELECTING ALL COLUMNS FROM THE STUDENTS TABLE
   SELECT * FROM students;
   
   
   
    -- SELECTING A SPECIFIC COLUMNS FROM THE STUDENTS TABLE
    SELECT student_name, email, phone, marks from students;








 -- HOW TO JOIN OR SELECT FROM TWO TABLES
 
 SELECT * from students, course WHERE students.id = course.id and students.id = 1;







 --  AN SQL STATEMENT WHICH RETURNS THE RECORDS OF STUDENT NAMES THAT CONTAINS OR HAS LETTER "O"
 SELECT student_name from students WHERE student_name LIKE '%O%';




 --  AN SQL STATEMENT WHICH RETURNS THE RECORDS OF STUDENT NAMES THAT BEGINS WITH THE LETTER "Y"
  SELECT student_name from students WHERE student_name LIKE 'Y%';
  
  
  
   --  AN SQL STATEMENT WHICH RETURNS THE RECORDS OF STUDENT NAMES THAT ENDS WITH THE LETTER "a"
  SELECT student_name from students WHERE student_name LIKE '%a';









