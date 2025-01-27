-- Step 1: Create the Database
CREATE DATABASE StudentManagementSystem;

-- Step 2: Use the Database
USE StudentManagementSystem;

-- Step 3: Create the `Student` Table
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL
);

select * from Student;

-- Step 4: Create the `Course` Table
CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseTitle VARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);

select * from Course;

-- Step 5: Create the `Instructor` Table
CREATE TABLE Instructor (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

select * from Instructor;


-- Step 6: Create the `Enrollment` Table
CREATE TABLE Enrollment (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentDate DATE NOT NULL,
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);
select * from Enrollment;

-- Step 7: Create the `Score` Table
CREATE TABLE Score (
    ScoreID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    StudentID INT,
    DateOfExam DATE NOT NULL,
    CreditObtained FLOAT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
select * from Score;

-- Step 8: Create the `Feedback` Table
CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    Date DATE NOT NULL,
    InstructorName VARCHAR(100) NOT NULL,
    Feedback TEXT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
select * from Feedback;


-- Step 1: Create the Database
CREATE DATABASE EmployeeEmergencyContacts;

-- Step 2: Use the Database
USE EmployeeEmergencyContacts;

-- Step 3: Create the `Employee` Table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(100),
    Department VARCHAR(100),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(10)
);
select * from Employee;


-- Step 4: Create the `EmergencyContact` Table
CREATE TABLE EmergencyContact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ContactName VARCHAR(50) NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    Phone VARCHAR(10) NOT NULL,
    Email VARCHAR(100),
    Address TEXT,
    PrivacyLevel ENUM('Low', 'Medium', 'High') DEFAULT 'High',
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
select * from EmergencyContact;
