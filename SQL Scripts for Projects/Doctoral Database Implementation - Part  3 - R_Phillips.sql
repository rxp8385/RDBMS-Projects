/***********************************************************/
/*Author: Rolando Phillips */

/*Purpose: Implementation of Doctoral Database Implementation - Part 3 - Rolando Phillips*/
/*I/O: none*/
/***********************************************************/
CREATE DATABASE IveySchoolPt3_DB;
USE IveySchoolPt3_DB;

/*Drop the following tables, if they already exist:*/
/*DROP TABLE Faculty_T;
DROP TABLE Student_T;
DROP TABLE Spouse_T;
DROP TABLE AdvisorRelationship_T;
DROP TABLE Course_T;
DROP TABLE Class_T;
DROP TABLE Enrolled_T;*/


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


CREATE TABLE Spouse_T 
					(SpouseID		VARCHAR(25)		NOT NULL,
                     Spouse_FName	VARCHAR(25)		NOT NULL,
					 Spouse_LName	VARCHAR(25)		NOT NULL,
                     StudentID		VARCHAR(25)		NOT NULL,

CONSTRAINT Spouse_PK PRIMARY KEY (SpouseID),
CONSTRAINT Spouse_FK FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID));

INSERT INTO Spouse_T
   (SpouseID, Spouse_FName, Spouse_LName, StudentID )
VALUES 
   ('001','Kevin','Durant', '002'),
   ('002', 'James', 'Harden', '004');

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

CREATE TABLE Course_T
				(CourseID			VARCHAR(25)		NOT NULL,
                 CourseNumber		VARCHAR(25)		NOT NULL,
				 CourseName 		VARCHAR(100)		NOT NULL,
                 Prerequisite		VARCHAR(100)				,
                 
CONSTRAINT Course_PK 	PRIMARY KEY (CourseID));

INSERT INTO Course_T
  (CourseID, CourseNumber, CourseName, Prerequisite)
VALUES
  ('001', '700a/b', 'Foundations I', ''), ('002', '701a/b', 'Economics I', ''),
  ('003', '702a/b', 'Statistics I', ''), ('004', '712a/b', 'Statistics II', 'Statistics I'),
  ('005', '703a/b', 'International Business', ''), ('006', '704', 'Research Methodology', ''),
  ('007', '720a', 'Summer Practicum', ''), ('008', '690', 'Thesis', ''),
  ('009', '721a/b', 'Research Apprenticeship I', ''), ('010', '722a/b', 'Research Apprenticeship II', 'Research Apprenticeship I'),
  ('011', '740a/b', 'Casewriting Workshop ', ''), ('012', '741a/b', 'Case Teaching Workshop', ''),
  ('013', '800a/b', 'Teaching Materials Development', ''), ('014', '810a/b', 'Individual Teaching Training Program', ''),
  ('015', '900a', 'Thesis Advisory Committee', ''), ('016', '900a/b', 'Research Colloquia', '');
  
CREATE TABLE Class_T 
				(ClassID			VARCHAR(25)		NOT NULL,
				 FacultyID			VARCHAR(25)		NOT NULL,
				 CourseID			VARCHAR(25)		NOT NULL,

CONSTRAINT Class_PK 	PRIMARY KEY (ClassID, FacultyID, CourseID),
CONSTRAINT Faculty_FK2 FOREIGN KEY (FacultyID) REFERENCES Faculty_T(FacultyID),
CONSTRAINT Course_FK  FOREIGN KEY (CourseID)  REFERENCES Course_T(CourseID));

INSERT INTO Class_T
  (ClassID, FacultyID, CourseID)

VALUES  
  ('001', '002', '013'),
  ('002', '004', '003'),
  ('003', '001', '005'),
  ('004', '001', '012'),
  ('005', '003', '011'),
  ('006', '004', '008'),
  ('007', '004', '005'),
  ('008', '002', '004'),
  ('009', '001', '015'),	
  ('010', '002', '016');
  
CREATE TABLE Enrolled_T
				(EnrollmentID		VARCHAR(25)		NOT NULL,
                 FacultyID			VARCHAR(25)		NOT NULL,
                 CourseID			VARCHAR(25)		NOT NULL,
				 StudentID			VARCHAR(25)		NOT NULL,
                 ClassID			VARCHAR(25)		NOT NULL,
                 EnrollmentStatus	VARCHAR(25)		NOT NULL,
                 
CONSTRAINT Enrolled_PK 	PRIMARY KEY (EnrollmentID, FacultyID, CourseID, StudentID, ClassID),
CONSTRAINT Faculty_FK3	FOREIGN KEY (FacultyID) REFERENCES Faculty_T(FacultyID),
CONSTRAINT Course_FK2  	FOREIGN KEY (CourseID)  REFERENCES Course_T(CourseID),
CONSTRAINT Student_FK2  	FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID),
CONSTRAINT Class_FK  	FOREIGN KEY (ClassID)   REFERENCES Class_T(ClassID));

INSERT INTO Enrolled_T
  (EnrollmentID, FacultyID, CourseID, StudentID, ClassID, EnrollmentStatus)
VALUES
  ('001', '002', '013', '001' , '001' , 'Enrolled'),  ('002', '004', '003', '002' , '002' , 'Enrolled'),
  ('003', '001', '015', '001' , '009' , 'Enrolled'),  ('004', '002', '016', '001' , '010' , 'Enrolled'),
  ('005', '001', '015', '002' , '009' , 'Enrolled'),  ('006', '002', '016', '002' , '010' , 'Enrolled'),
  ('007', '001', '015', '003' , '009' , 'Enrolled'),  ('008', '002', '016', '003' , '010' , 'Enrolled'),
  ('009', '001', '015', '004' , '009' , 'Enrolled'),  ('010', '002', '016', '004' , '010' , 'Enrolled'),
  ('011', '003', '011', '002' , '005' , 'Enrolled'),  ('012', '003', '011', '003' , '005' , 'Enrolled'),
  ('013', '004', '005', '001' , '007' , 'Enrolled'),  ('014', '004', '008', '004' , '006' , 'Enrolled'),
  ('015', '001', '012', '002' , '004' , 'Enrolled'),  ('016', '004', '005', '003' , '007' , 'Enrolled');
  
 /*Returns all the first names of the records in
  the Faculty_T Table sorted by last name */
  
 /*SELECT Faculty_FName FROM  Faculty_T
 
 ORDER BY Faculty_LName;
  
 SELECT s.Student_FName, s.Student_LName, f.Faculty_FName AS AdvisorFName, f.Faculty_LName AS AdvisorLName 
 FROM  Student_T s
 JOIN AdvisorRelationship_T a
 ON s.StudentID=a.StudentID
 JOIN Faculty_T f ON a.FacultyID=f.FacultyID
 ORDER BY s.Student_LName;
 
 /*Sample Tables for JOIN...*/
 
 /*SELECT s.Student_FName, s.Student_LName
 FROM Student_T s;*/
 
 
 
 
 
  