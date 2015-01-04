/***********************************************************/
/*Author: Rolando Phillips */

/*Purpose: Implementation of Doctoral Database - Part 1 - Rolando Phillips*/
/*I/O: none*/
/***********************************************************/
CREATE DATABASE IveySchoolPt1_DB;
USE IveySchoolPt1_DB;


CREATE TABLE Faculty_T 
				(FacultyID			VARCHAR(25)		NOT NULL,
                 Faculty_FName		VARCHAR(25)		NOT NULL,
                 Faculty_LName		VARCHAR(25)		NOT NULL,
                 Office_Telephone	VARCHAR(25)		NOT NULL,
                 Office_Number		VARCHAR(25)		NOT NULL,
CONSTRAINT Faculty_PK PRIMARY KEY (FacultyID));

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
                 FacultyID			VARCHAR(25)		NOT NULL,
                 
CONSTRAINT Student_PK PRIMARY KEY (StudentID),
CONSTRAINT Student_FK FOREIGN KEY (FacultyID) REFERENCES Faculty_T(FacultyID));

INSERT INTO Faculty_T VALUES
					('00001','Frema','Ageyeman','5851234567','101');

INSERT INTO Faculty_T VALUES
					('00002','Nia','Long','585234567','102');
                    
INSERT INTO Student_T VALUES
					('10000','Tracy','Chapman','2023234567','100 Anywhere Avenue',
                    'Apt. 1','Washington','DC','20001','00002');

INSERT INTO Student_T VALUES
					('10001','Gugu','Mbatha-Raw','2023244567','200 Someplace Street',
                    '','Washington','DC','20020','00001');
                    
SELECT 		Student_T.Student_LName, Faculty_T.Faculty_LName 
FROM 		Student_T, Faculty_T
WHERE		Student_T.FacultyID = Faculty_T.FacultyID
ORDER BY 	Student_T.Student_LName
	
