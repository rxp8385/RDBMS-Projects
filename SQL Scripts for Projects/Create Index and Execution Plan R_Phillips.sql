/***********************************************************/
/*Author: Rolando Phillips */

/*Purpose: Gain understanding of execution plans and index creation. Learn how to use the
Autotrace statement, create index statement and how to read the autotrace results. Rolando Phillips*/
/*I/O: none*/
/***********************************************************/
/* Create and use the database, if these processes have not be done already
CREATE DATABASE CreateAndUseDatabase_3;
USE CreateAndUseDatabase_3;*/

/*Drop the following tables, if they already exist:*/
/*DROP TABLE Faculty_T;
DROP TABLE Student_T;
DROP TABLE AdvisorRelationship_T;
*/


CREATE TABLE Faculty_T 
				(FacultyID			VARCHAR(25)		NOT NULL,
                 Faculty_FName		VARCHAR(25)		NOT NULL,
                 Faculty_LName		VARCHAR(25)		NOT NULL,
                 Office_Telephone	VARCHAR(25)		NOT NULL,
                 Office_Number		VARCHAR(25)		NOT NULL,
                 
CONSTRAINT Faculty_PK PRIMARY KEY (FacultyID));

INSERT INTO Faculty_T
  (FacultyID, Faculty_FName, Faculty_LName, Office_Telephone, 
   Office_Number)
VALUES
  ('001','Rebecca','Johnson','585-123-4567','100'),
  ('002','Traci','Simmons','585-223-4567','101'),
  ('003','John','Thompson','585-323-4567','102'),
  ('004','David','Robinson','585-423-4567','103');


CREATE TABLE Student_T 
				(StudentID			VARCHAR(25)		NOT NULL,
                 Student_FName		VARCHAR(25)		NOT NULL,
                 Student_LName		VARCHAR(25)		NOT NULL,
                 Home_Telephone		VARCHAR(25)		NOT NULL,
                 Home_Address1		VARCHAR(25)		NOT NULL,
                 Home_Address2		VARCHAR(25)				,
                 Home_City			VARCHAR(25)		NOT NULL,
                 Home_State			VARCHAR(25)		NOT NULL,
                 Home_Zip			VARCHAR(25)		NOT NULL,
                 StudentEnrollmentDate		DATE	NOT NULL,
                 Thesis_Title		VARCHAR(100)	NOT NULL,
                 ConvocationDate	DATE			NOT NULL,
                 PostGraduateJobTitle	VARCHAR(100)	NOT NULL,

CONSTRAINT Student_PK PRIMARY KEY (StudentID));

INSERT INTO Student_T				 
  (StudentID, Student_FName, Student_LName, Home_Telephone,
   Home_Address1, Home_Address2, Home_City,
   Home_State, Home_Zip, StudentEnrollmentDate,
   Thesis_Title, ConvocationDate, PostGraduateJobTitle)

VALUES   
  ('001','Frema','Ageyeman','202-123-4567',
   '1 Pine Street SE', '','Washington','DC', 
   '20020', '2011-08-28', 'The State of The Community', 
   '2015-05-30', 'N/A'),
   ('002','Sali','Richardson','202-223-4567',
   '22 Fig Ave SE', '','Washington','DC', 
   '20020', '2006-08-28', 'Statistical Analysis Strategies', 
   '2013-05-30', 'Economist'),
   ('003','Nia','Long','212-123-4567',
   '1 DuBois Lane', '1560E','New York','NY', 
   '10010', '2005-08-28', 'Market Segmentation Techniques', 
   '2009-05-30', 'Research Analyst'),
   ('004','Drew','Sidora','212-223-4567',
   '1 C.J. Walker Drive', 'B2','New York','NY', 
   '10025', '2013-08-28', 'Psychographic Profiling', 
   '2017-05-30', 'Demographic Analyst');



CREATE TABLE AdvisorRelationship_T 
				(ARID				VARCHAR(25)		NOT NULL,
                 RelationshipType	VARCHAR(25)		NOT NULL,
                 ThesisCommiteeMember VARCHAR(4)			,
                 StudentID			VARCHAR(25)		NOT NULL,
                 FacultyID			VARCHAR(25)		NOT NULL,
                 CommiteeChair	 	VARCHAR(4)				,
                 
CONSTRAINT AR_PK 		PRIMARY KEY (ARID),
CONSTRAINT Student_FK 	FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID),
CONSTRAINT Faculty_FK 	FOREIGN KEY (FacultyID) REFERENCES Faculty_T(FacultyID));

INSERT INTO AdvisorRelationship_T
  (ARID, RelationshipType, ThesisCommiteeMember, StudentID, FacultyID, CommiteeChair)
VALUES
  ('001', 'Advisor', 'Yes', '003', '001', 'No'),
  ('002', 'Advisor', 'Yes', '001', '002', 'Yes'),
  ('003', 'Advisor', 'Yes', '002', '003', 'No'),
  ('004', 'Advisor', 'Yes', '004', '004', 'No');

/*The EXPLAIN statement is used in MySQL to generate execution plans*/

EXPLAIN SELECT s.Student_LName, s.Student_FName, f.Faculty_LName AS 
               "Advisor LName", f.Faculty_FName AS "Advisor FName"
FROM           Student_T s
JOIN           AdvisorRelationship_T a
ON             s.StudentID=a.StudentID
JOIN           Faculty_T f 
ON             a.FacultyID=f.FacultyID
WHERE          f.FacultyID = '002';

/*Create an index on the student table prior to generating the execution plan...*/
CREATE INDEX Student_T_LNameIndex ON Student_T (Student_LName);

EXPLAIN SELECT s.Student_LName, s.Student_FName, f.Faculty_LName AS 
               "Advisor LName", f.Faculty_FName AS "Advisor FName"
FROM           Student_T s
JOIN           AdvisorRelationship_T a
ON             s.StudentID=a.StudentID
JOIN           Faculty_T f 
ON             a.FacultyID=f.FacultyID
WHERE          f.FacultyID = '002';
 
  