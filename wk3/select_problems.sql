-— Module 4 problems

-- Q1: List the customer number, the name, the phone number, and the city of 
--     customers.
-- SELECT CustNo, CustName, Phone, City
-- FROM Customer;

-- Q2: List the customer number, the name, the phone number, and the city of 
--     customers who reside in Colorado (State is CO).
-- SELECT CustNo, CustName, Phone, City
-- FROM Customer
-- WHERE State = 'CO';

-- Q3: List all columns of the EventRequest table for events costing more than 
--     $4000. Order the result by the event date (DateHeld).
-- SELECT *
-- FROM EventRequest
-- WHERE EstCost > 4000
-- ORDER BY DateHeld;

-- Q4: List the event number, the event date (DateHeld), and the estimated 
-- audience number with approved status and audience greater than 9000 or with 
-- pending status and audience greater than 7000.
-- SELECT EventNo, DateHeld, EstAudience, Status
-- FROM EventRequest
-- WHERE (Status = 'Approved' AND EstAudience > 9000)
--     OR (Status = 'Pending' AND EstAudience > 7000);

-- Q5: List the event number, event date (DateHeld), customer number and 
-- customer name of events placed in January 2013 by customers from Boulder.
-- SELECT EventNo, DateHeld, EventRequest.CustNo, CustName
-- FROM EventRequest INNER JOIN Customer
--     ON EventRequest.CustNo = Customer.CustNo
-- WHERE (DateHeld BETWEEN '1-Jan-2013' AND '31-Jan-2013') 
--     AND (Customer.City = 'Boulder')

-- Q6: List the average number of resources used (NumberFld) by plan number. 
-- Include only location number L100.
-- SELECT PlanNo, AVG(NumberFld) as AverageNumberFld   --, AVG(NumberFld) as AverageNumberFld
-- FROM EventPlanLine
-- WHERE LocNo = 'L100'
-- GROUP BY PlanNo

-- Q7: List the average number of resources used (NumberFld) by plan number. 
-- Only include location number L100. Eliminate plans with less than two event 
-- lines containing location number L100.
-- SELECT PlanNo, AVG(NumberFld) as AverageNumberFld, COUNT(*) AS NumEventLines
-- FROM EventPlanLine
-- WHERE LocNo = 'L100'
-- GROUP BY PlanNo
-- HAVING COUNT(*) > 1;








