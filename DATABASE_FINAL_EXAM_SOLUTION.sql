--  PROJECT STUDENT TABLE
create table ProjectStudent(
StudentID VARCHAR2(5),
Lastname VARCHAR2(50),
OtherNames VARCHAR2(50),
DOB VARCHAR2(20),
GroupLeader VARCHAR2(100)
);

ALTER TABLE ProjectStudent ADD CONSTRAINT pk_StudentID PRIMARY KEY (StudentID) NOVALIDATE;

CREATE INDEX ProjectStudent_StudentID_idx ON ProjectStudent(StudentID);

select * from ProjectStudent;

--  INSERTING VALUES INTO PROJECT STUDENT TABLE
insert into ProjectStudent(StudentID,Lastname,OtherNames,DOB,GroupLeader)VALUES('S001', 'Ama', 'KOFI', '12/01/1990', '');
insert into ProjectStudent(StudentID,Lastname,OtherNames,DOB,GroupLeader)VALUES('S002', 'ABI', 'Kwaku', '12/04/1990', 'P001');
insert into ProjectStudent(StudentID,Lastname,OtherNames,DOB,GroupLeader)VALUES('S003', 'MENSAH', 'Kofi', '12/04/1990', '');
insert into ProjectStudent(StudentID,Lastname,OtherNames,DOB,GroupLeader)VALUES('S003', 'MENSAH', 'Kofi', '12/04/1990', '');



--  PROJECT SUPERVISOR TABLE
create table ProjectSupervisor(
SupervisorID VARCHAR2(5),
Lastname VARCHAR2(50),
Othernames VARCHAR2(50)
);

CREATE INDEX ProjectSupervisor_SupervisorID_idx ON ProjectSupervisor(SupervisorID);

ALTER TABLE ProjectSupervisor ADD CONSTRAINT pk_SupervisorID PRIMARY KEY (SupervisorID) NOVALIDATE;

select * from ProjectSupervisor;

--  INSERTING VALUES INTO PROJECT SUPERVISOR TABLE
insert into ProjectSupervisor(SupervisorID,Lastname,Othernames)VALUES('L001', 'WINK', 'King');
insert into ProjectSupervisor(SupervisorID,Lastname,Othernames)VALUES('L001', 'WINK', 'King');
insert into ProjectSupervisor(SupervisorID,Lastname,Othernames)VALUES('L002', 'SEEWAN', 'Abena');
insert into ProjectSupervisor(SupervisorID,Lastname,Othernames)VALUES('L002', 'SEEWAN', 'Abena');



--   PROJECT TEAM TABLE
create table ProjectTeam(
ProjectID VARCHAR2(5),
StudentID VARCHAR2(5),
CONSTRAINT FK_ProjectDescription FOREIGN KEY (ProjectID) REFERENCES ProjectDescription(ProjectID),
CONSTRAINT FK_ProjectStudent FOREIGN KEY (StudentID) REFERENCES ProjectStudent(StudentID)
);

CREATE INDEX ProjectTeam_ProjectID_idx ON ProjectTeam(ProjectID);

ALTER TABLE ProjectTeam ADD CONSTRAINT pk1_ProjectID PRIMARY KEY (ProjectID) NOVALIDATE;

CREATE INDEX ProjectTeam_StudentID_idx ON ProjectTeam(StudentID);

ALTER TABLE ProjectTeam ADD CONSTRAINT pk_StudentID PRIMARY KEY (StudentID) NOVALIDATE;

select * from ProjectTeam;

--  INSERTING VALUES INTO PROJECT SUPERVISOR TABLE
insert into ProjectTeam(ProjectID,StudentID)VALUES('P001', 'S001');
insert into ProjectTeam(ProjectID,StudentID)VALUES('P001', 'S002');
insert into ProjectTeam(ProjectID,StudentID)VALUES('P002', 'S003');
insert into ProjectTeam(ProjectID,StudentID)VALUES('P002', 'S003');



--    PROJECT DESCRIPTION TABLE
create table ProjectDescription(
ProjectID VARCHAR2(5),
ProjectTiltle VARCHAR2(50),
ProjectSummary VARCHAR2(100),
SupervisorID VARCHAR2(5),
constraint ProjectDescription_fk foreign key (SupervisorID) REFERENCES ProjectSupervisor (SupervisorID)
);

CREATE INDEX ProjectDescription_ProjectID_idx ON ProjectDescription(ProjectID);

ALTER TABLE ProjectDescription ADD CONSTRAINT pk_ProjectID PRIMARY KEY (ProjectID) NOVALIDATE;

select * from ProjectDescription;

--  INSERTING VALUES INTO PROJECT SUPERVISOR TABLE
insert into ProjectDescription(ProjectID,ProjectTiltle,ProjectSummary,SupervisorID)VALUES('P001', 'Student Registration', 'Manage Students Registration', 'L001');
insert into ProjectDescription(ProjectID,ProjectTiltle,ProjectSummary,SupervisorID)VALUES('P001', 'Student Registration', 'Manage Students Registration', 'L001');
insert into ProjectDescription(ProjectID,ProjectTiltle,ProjectSummary,SupervisorID)VALUES('P002', 'TAX Monitor', 'System to generate Tax liability of individual and organization', 'L002');
insert into ProjectDescription(ProjectID,ProjectTiltle,ProjectSummary,SupervisorID)VALUES('P002', 'TAX Monitor', 'System to generate Tax liability of individual and organization', 'L002');



--   PROJECT SUBMISSION TABLE
create table ProjectSubmissions(
ProjectID VARCHAR2(5),
ComponentSubmitted VARCHAR2(50),
DateSubmitted VARCHAR2(20),
constraint ProjectSubmission_fk foreign key (ProjectID) REFERENCES ProjectDescription (ProjectID)
);





select * from ProjectSubmissions;



--  INSERTING VALUES INTO PROJECT SUPERVISOR TABLE
insert into ProjectSubmissions(ProjectID,ComponentSubmitted,DateSubmitted) VALUES('P001', 'Project Proposal', '3/3/2012');
insert into ProjectSubmissions(ProjectID,ComponentSubmitted,DateSubmitted) VALUES('P001', 'Project Proposal', '3/3/2012');
insert into ProjectSubmissions(ProjectID,ComponentSubmitted,DateSubmitted) VALUES('P002', 'Project Proposal', '3/3/2012');
insert into ProjectSubmissions(ProjectID,ComponentSubmitted,DateSubmitted) VALUES('P002', 'Literature Review', '5/4/2012');


--2.3  THE REVIEW BOARD WANTS TO ADD REMARK TO PROJECT SUBMISSIONS. A REVIEW MAY BE CLASSIFIED 
-- AS PENDING,ACCEPT,REJECTED OR ACCEPTED WITH CORRECTION WITH THE DEFAULT AS PENDING.  IMPLEMENT THIS REQUEST 

ALTER TABLE ProjectSubmissions
ADD( REVIEW VARCHAR2(50));

UPDATE ProjectSubmissions
SET REVIEW = 'Pending';

UPDATE ProjectSubmissions
SET REVIEW = 'Accepted'
where ProjectID = 'P002';



--3  MODIFY THE DATE SUBMITTED ATTRIBUTE OF THE PROJECT SUBMISSION TO ACCEPT THE CURRENT SYSTEM DATE AS THE DEFAULT SUBMISSION DATE

UPDATE ProjectSubmissions
SET DateSubmitted = SYSDATE;
