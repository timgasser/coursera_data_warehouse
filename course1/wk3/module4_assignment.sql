-— Module 4 assignment

-- Q1: List the city, state, and zip codes in the customer table.  Your result should 
not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)
SELECT DISTINCT City, State, Zip
FROM Customer

-- Q2: List the name, department, phone number, and email address of employees 
-- with a phone number beginning with “3-”.
SELECT EmpName, Department, Phone, Email
FROM Employee
WHERE Phone LIKE '3-%'
ORDER BY Rate

-- Q3: List all columns of the resource table with a rate between $10 and $20. 
-- Sort the result by rate..
-- I'm assuming he means $10 and $20 inclusive
SELECT *
FROM ResourceTbl
WHERE Rate >= 10 AND Rate <= 20 
ORDER BY Rate

-- Q4: List the event requests with a status of “Approved” or “Denied” and an 
-- authorized date in July 2013. Include the event number, authorization date, 
-- and status in the output. (Hint: see the examples in Module 4 for date 
-- constants in Oracle and MySQL.)
SELECT EventNo, DateAuth, Status
FROM EventRequest
WHERE ((Status = 'Approved') OR (Status = 'Denied'))
    AND (DateAuth BETWEEN '1-Jul-2013' AND '31-Jul-2013')


-- Q5: List the location number and name of locations that are part of the 
-- “Basketball arena”.  Your WHERE clause should not have a condition involving 
-- the facility number compared to a constant (“F101”). Instead, you should use 
-- a condition on the FacName column for the value of “Basketball arena”.
SELECT LocNo, LocName
FROM Location INNER JOIN Facility
    ON Location.FacNo = Facility.FacNo
WHERE Facility.FacName = 'Basketball arena'


-- Q6: For each event plan, list the plan number, count of the event plan lines, 
-- and sum of the number of resources assigned.  For example, plan number “P100” 
-- has 4 lines and 7 resources assigned.  You only need to consider event plans 
-- that have at least one line.

SELECT EventPlan.PlanNo, COUNT(EventPlanLine.LineNo) AS EventPlanLines, COUNT(ResourceTbl.ResNo)
FROM EventPlan INNER JOIN EventPlanLine
    ON EventPlan.PlanNo = EventPlanLine.PlanNo
    INNER JOIN ResourceTbl 
    ON EventPlanLine.ResNo = ResourceTbl.ResNo 
GROUP BY EventPlanLine.PlanNo

