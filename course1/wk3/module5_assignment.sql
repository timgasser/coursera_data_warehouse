-— Module 5 assignment (Inter-Collegiate Database)

— *** SELECT SECTION ***

-- Q1: For event requests, list the event number, event date 
-- (eventrequest.dateheld), and count of the event plans.  Only include event 
-- requests in the result if the event request has more than one related event 
-- plan with a work date in December 2013.

-- Oracle SQL
SELECT EventRequest.EventNo, DateHeld, COUNT(EventPlan.PlanNo) AS NUM_EVENT_PLANS
FROM EventRequest, EventPlan
WHERE (EventRequest.EventNo = EventPlan.EventNo)
    AND (DateHeld BETWEEN '1-Dec-2013' AND '31-Dec-2013')
GROUP BY EventRequest.EventNo, DateHeld
HAVING COUNT(EventPlan.PlanNo) > 1;


-- Q2: List the plan number, event number, work date, and activity of event 
-- plans meeting the following two conditions: (1) the work date is in 
-- December 2013 and (2) the event is held in the “Basketball arena”.  
-- Your query must not use the facility number (“F101”) of the basketball arena 
-- in the WHERE clause. Instead, you should use a condition on the FacName 
-- column for the value of “Basketball arena”.

-- Oracle SQL
SELECT PlanNo, EventPlan.EventNo, WorkDate, Activity
FROM EventPlan, EventRequest, Facility
WHERE (EventPlan.EventNo = EventRequest.EventNo)
    AND (EventRequest.FacNo = Facility.FacNo)
    AND (WorkDate BETWEEN '1-Dec-2013' AND '31-Dec-2013')
    AND (FacName = 'Basketball arena');


-- Q3: List the event number, event date, status, and estimated cost of events 
-- where there is an event plan managed by Mary Manager and the event is held 
-- in the basketball arena in the period October 1 to December 31, 2013.  
-- Your query must not use the facility number (“F101”) of the basketball arena 
-- or the employee number (“E101”) of “Mary Manager” in the WHERE clause. 
-- Thus, the WHERE clause should not have conditions involving the facility 
-- number or employee number compared to constant values.

-- Oracle SQL
SELECT EventPlan.EventNo, DateHeld, Status, EstCost
FROM EventRequest, EventPlan, Employee, Facility
WHERE (EventPlan.EventNo = EventRequest.EventNo)
    AND (EventPlan.EmpNo = Employee.EmpNo)
    AND (EventRequest.FacNo = Facility.FacNo)
    AND (DateHeld BETWEEN '1-Oct-2013' AND '31-Dec-2013')
    AND (FacName = 'Basketball arena')
    AND (EmpName = 'Mary Manager');


-- Q4: List the plan number, line number, resource name, number of resources 
-- (eventplanline.number), location name, time start, and time end where the 
-- event is held at the basketball arena, the event plan has activity of 
-- activity of “Operation”, and the event plan has a work date in the period 
-- October 1 to December 31, 2013.  Your query must not use the facility number 
-- (“F101”) of the basketball arena in the WHERE clause. Instead, you should 
-- use a condition on the FacName column for the value of “Basketball arena”.

-- Oracle SQL
SELECT EventPlanLine.PlanNo, LineNo, ResName, NumberFld, LocName, TimeStart, TimeEnd
FROM EventPlanLine, ResourceTbl, Location, Facility, EventPlan
WHERE (EventPlanLine.ResNo = ResourceTbl.ResNo)
    AND (EventPlanLine.LocNo = Location.LocNo)
    AND (EventPlanLine.PlanNo = EventPlan.PlanNo)
    AND (Location.FacNo = Facility.FacNo)
    AND (FacName = 'Basketball arena')
    AND (Activity = 'Operation')
    AND (WorkDate BETWEEN '1-Oct-2013' AND '31-Dec-2013');


— *** DATABASE MODIFICATION SECTION ***

-- Q1: Insert a new row into the Facility table with facility name “Swimming Pool”.

SELECT *
FROM Facility;

INSERT INTO Facility
    (FacNo, FacName)
VALUES ('F104', 'Swimming Pool');

SELECT *
FROM Facility;


-- Q2: Insert a new row in the Location table related to the Facility row in 
-- modification problem 1. The new row should have “Door” for the location name.

SELECT *
FROM Location;

INSERT INTO Location
    (LocNo, FacNo, LocName)
VALUES ('L107', 'F104', 'Door');

SELECT *
FROM Location;



-- Q3: Insert a new row in the Location table related to the Facility row in 
-- modification problem 1. The new row should have “Locker Room” for the location name.

SELECT *
FROM Location;

INSERT INTO Location
    (LocNo, FacNo, LocName)
VALUES ('L108', 'F104', 'Locker Room');

SELECT *
FROM Location;

-- Q4: Change the location name of “Door” to “Gate” for the row inserted in 
-- modification problem 2.

SELECT *
FROM Location;

UPDATE Location
SET LocName = 'Gate'
WHERE LocNo = 'L107'
    AND FacNo = 'F104';

SELECT *
FROM Location;









