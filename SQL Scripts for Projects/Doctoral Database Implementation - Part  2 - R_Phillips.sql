/***********************************************************/
/*Author: Rolando Phillips */

/*Purpose: Implementation of Doctoral Database - Part 2 - Rolando Phillips*/
/*I/O: none*/
/***********************************************************/
CREATE DATABASE IveySchoolPt2_DB;
USE IveySchoolPt2_DB;


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
                 StudentEnrollmentDate		DATE	NOT NULL,
                 Thesis_Title		VARCHAR(25)		NOT NULL,
                 ConvocationDate	DATE			NOT NULL,
                 PostGraduateJobTitle	VARCHAR(25)	NOT NULL,
                 
CONSTRAINT Student_PK PRIMARY KEY (StudentID));

CREATE TABLE Spouse_T 
					(SpouseID		VARCHAR(25)		NOT NULL,
                     Spouse_FName	VARCHAR(25)		NOT NULL,
					 Spouse_LName	VARCHAR(25)		NOT NULL,
                     StudentID		VARCHAR(25)		NOT NULL,

CONSTRAINT Spouse_PK PRIMARY KEY (SpouseID),
CONSTRAINT Spouse_FK FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID));

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

CREATE TABLE Course_T
				(CourseID			VARCHAR(25)		NOT NULL,
                 CourseNumber		VARCHAR(25)		NOT NULL,
                 Prerequisite		VARCHAR(25)				,
                 
CONSTRAINT Course_PK 	PRIMARY KEY (CourseID));

CREATE TABLE Class_T 
				(ClassID			VARCHAR(25)		NOT NULL,
				 FacultyID			VARCHAR(25)		NOT NULL,
				 CourseID			VARCHAR(25)		NOT NULL,

CONSTRAINT Class_PK 	PRIMARY KEY (ClassID, FacultyID, CourseID),
CONSTRAINT Faculty_FK2 FOREIGN KEY (FacultyID) REFERENCES Faculty_T(FacultyID),
CONSTRAINT Course_FK  FOREIGN KEY (CourseID)  REFERENCES Course_T(CourseID));
	
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
