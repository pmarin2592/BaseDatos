use master
go

create database JOBHUNTINGDW
go

use JOBHUNTINGDW
go 

CREATE TABLE Companies_Dim (
    CompanyID INT PRIMARY KEY,
    NameCompany NVARCHAR(100) NOT NULL,
    AddressCompany NVARCHAR(4000),
    DescriptionCompany NVARCHAR(4000),
    Active BIT NOT NULL
);

CREATE TABLE JobPositions_Dim (
    JobPositionID INT PRIMARY KEY,
    PositionName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(4000)
);

CREATE TABLE Applicants_Dim (
    ApplicantID INT PRIMARY KEY,
    NameApplicant NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15),
    Address NVARCHAR(4000)
);

CREATE TABLE Date_Dim (
    DateID INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL
);

CREATE TABLE Status_Dim (
    StatusID INT PRIMARY KEY,
    StatusDescription NVARCHAR(100) NOT NULL
);

CREATE TABLE HiringProcess_FT (
    HiringProcessID INT PRIMARY KEY,
    CompanyID INT FOREIGN KEY REFERENCES Companies_Dim(CompanyID),
    JobPositionID INT FOREIGN KEY REFERENCES JobPositions_Dim(JobPositionID),
    ApplicantID INT FOREIGN KEY REFERENCES Applicants_Dim(ApplicantID),
    DateID INT FOREIGN KEY REFERENCES Date_Dim(DateID),
    StatusID INT FOREIGN KEY REFERENCES Status_Dim(StatusID),
    CompletionDate DATE,
    ApplicationDate DATE
);
