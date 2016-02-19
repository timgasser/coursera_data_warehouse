-— Module 5 problems (Inter-Collegiate Database)

-- Q1: List the event number, date held, customer number, customer name, 
-- facility number, and facility name of 2013 events placed by Boulder customers.

SELECT EventNo, DateHeld, EventRequest.CustNo, CustName, EventRequest.FacNo, FacName
FROM Facility, EventRequest, Customer
WHERE (EventRequest.CustNo = Customer.CustNo)
    AND (EventRequest.FacNo = Facility.FacNo)
    AND EXTRACT(YEAR from DateReq) = '2013';

-- Q2: List the customer number, customer name, event number, date held, 
-- facility number, facility name, and estimated audience cost per person 
-- (EstCost / EstAudience) for events held on 2013, in which the estimated 
-- cost per person is less than $0.2
SELECT EventRequest.CustNo, CustName, EventNo, DateHeld, EventRequest.FacNo, 
        FacName, (EstCost/ EstAudience) AS EstCostPerPerson
FROM Facility, EventRequest, Customer
WHERE (EventRequest.CustNo = Customer.CustNo)
    AND (EventRequest.FacNo = Facility.FacNo)
    AND EXTRACT(YEAR from DateHeld) = '2013';

-- Q3: List the customer number, customer name, and total estimated costs for 
-- Approved events. The total amount of events is the sum of the estimated cost 
-- for each event. Group the results by customer number and customer name.
SELECT EventRequest.CustNo, CustName, SUM(EstCost) AS SUM_COSTS
FROM EventRequest, Customer
WHERE (EventRequest.CustNo = Customer.CustNo)
    AND Status = 'Approved'
GROUP BY EventRequest.CustNo, CustName;

-- Q4: Insert yourself as a new row in the Customer table. 
-- Next custNo is C106
INSERT INTO Customer
(CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ('C106', 'Tim Gasser', '2345 Chuff Avenue', 'N', 'Bill Baseball', 
'8476543939', 'Austin', 'TX', '12345');

— Quick check to make sure I added in correctly
SELECT *
FROM Customer;


-- Q5: Increase the rate by 10 percent of nurse resource in the resource table.
SELECT *
FROM ResourceTbl;

UPDATE ResourceTbl
SET Rate = 22
WHERE (ResNo = 'R103')
    AND (ResName = 'nurse');

SELECT *
FROM ResourceTbl;


-- Q6: Delete the new row added to the Customer table.

DELETE FROM Customer
WHERE CustNo = 'C106' AND CustName = 'Tim Gasser';

-- Quick check to make sure the row was removed
SELECT *
FROM Customer;



