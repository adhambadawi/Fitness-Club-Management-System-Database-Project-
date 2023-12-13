--Insert a new member into the Members table:
INSERT INTO Members (MemberID, FName, LName, DoB, Address, FitnessGoal, ClassSubscription, LoyaltyPoints)
VALUES (1, 'Adham', 'Badawi', '2002-12-06', '123 Carleton St', 'Lose Weight', 1, 100);


--Update the address of a member in the Members table:
UPDATE Members
SET Address = '456 Bank St'
WHERE MemberID = 1;


--Delete a member from the Members table:
DELETE FROM Members
WHERE MemberID = 1;
Select all members from the Members table:
SELECT * FROM Members;


--Insert a new class into the Classes table:
INSERT INTO Classes (ClassID, Name, Description)
VALUES (1, 'Yoga Beginners', 'A class for beginners to learn yoga basics.');


--Enroll a member in a class:
INSERT INTO Members_Classes (MemberID, ClassID)
VALUES (1, 1);


--Find all classes a member is enrolled in:
SELECT c.ClassID, c.Name, c.Description
FROM Classes c
JOIN Members_Classes mc ON c.ClassID = mc.ClassID
WHERE mc.MemberID = 1;


--List all equipment in a given room:
SELECT e.EquipmentID, e.EquipmentType, e.Description
FROM Equipment e
JOIN Rooms_Equipment re ON e.EquipmentID = re.EquipmentID
WHERE re.RoomID = 1;


--Record a new personal training session:
INSERT INTO PersonalTrainingSessions (SessionID, SessionSchedule, Time, Duration, MemberID)
VALUES (1, '2023-12-10', '10:00', 60, 1);


--Update the duration of a personal training session:
UPDATE PersonalTrainingSessions
SET Duration = 90
WHERE SessionID = 1;


--List all members with a particular fitness goal:
SELECT MemberID, FName, LName
FROM Members
WHERE FitnessGoal = 'Lose Weight';


--Calculate the total amount billed to a member:
SELECT SUM(Amount) as TotalBilled
FROM Billing
WHERE MemberID = 1;


--Find the availability of all rooms:
SELECT RoomID, Name, Availability
FROM Rooms
WHERE Availability = TRUE;


--List the schedule of classes for a specific room:
SELECT cl.Name, cl.Description
FROM Classes cl
JOIN Classes_Rooms cr ON cl.ClassID = cr.ClassID
WHERE cr.RoomID = 1;
