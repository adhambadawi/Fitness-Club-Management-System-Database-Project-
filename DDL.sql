-- Table for Members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    DoB DATE,
    Address TEXT,
    HealthMetrics TEXT,
    FitnessGoal TEXT,
    ClassSubscription INT,
    LoyaltyPoints INT
);

-- Table for Trainers
CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    DoB DATE,
    PrivateTrainingMembers INT -- Assuming this is a count; adjust if it's a foreign key or other type of field
);

-- Table for Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT
);

-- Table for Rooms
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    Name VARCHAR(255),
    RoomType VARCHAR(255),
    Availability BOOLEAN
);

-- Table for Equipment
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentType VARCHAR(255),
    Description TEXT
);

-- Table for Personalized Dashboard
CREATE TABLE PersonalizedDashboards (
    DashboardID INT PRIMARY KEY,
    ExerciseRoutine TEXT,
    FitnessAchievement TEXT,
    HealthStatistics TEXT,
    ProgressNotes TEXT,
    MemberID INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table for Personal Training Sessions
CREATE TABLE PersonalTrainingSessions (
    SessionID INT PRIMARY KEY,
    SessionSchedule DATE,
    Time TIME,
    Duration INT, -- Assuming duration is in minutes; adjust as necessary
    MemberID INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table for Billing
CREATE TABLE Billing (
    TransactionID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Date DATE,
    PaymentMethod VARCHAR(255),
    Service VARCHAR(255),
    MemberID INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table for Administrative Staff
CREATE TABLE AdministrativeStaff (
    StaffID INT PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    DoB DATE,
    Role VARCHAR(255)
);

-- Associative table for the many-to-many relationship between Members and Classes
CREATE TABLE Members_Classes (
    MemberID INT,
    ClassID INT,
    PRIMARY KEY (MemberID, ClassID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- Associative table for the relationship between Classes and Rooms
CREATE TABLE Classes_Rooms (
    ClassID INT,
    RoomID INT,
    PRIMARY KEY (ClassID, RoomID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Associative table for the relationship between Rooms and Equipment
CREATE TABLE Rooms_Equipment (
    RoomID INT,
    EquipmentID INT,
    PRIMARY KEY (RoomID, EquipmentID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Multivalued attribute table for the relationship between Members and their Phone numbers
CREATE TABLE PersonalizedDashboards (
    Phone NVARCHAR(100) PRIMARY KEY,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
