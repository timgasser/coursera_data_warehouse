-- Tim Gasser submission for Module 3 Assignment
-- All statements below are in Oracle format

CREATE TABLE Customer
( CustNo          VARCHAR2(8)  CONSTRAINT CustCustNoRequired   NOT NULL ,
  CustName        VARCHAR2(30) CONSTRAINT CustCustNameRequired NOT NULL ,
  Address         VARCHAR2(30) CONSTRAINT CustAddressRequired  NOT NULL ,
  Internal        CHAR(1)      CONSTRAINT CustInternalRequired NOT NULL ,
  Contact         VARCHAR2(30) CONSTRAINT CustContactRequired  NOT NULL ,
  Phone           CHAR(15)     CONSTRAINT CustPhoneRequired    NOT NULL , -- (123) 456-7890
  City            VARCHAR2(20) CONSTRAINT CustCityRequired     NOT NULL , 
  State           CHAR(2)      CONSTRAINT CustStateRequired    NOT NULL ,
  Zip             CHAR(10)     CONSTRAINT CustZipRequired      NOT NULL , -- Could be long format ZIP (12345-6789)

  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo)

 );
 
CREATE TABLE Employee
( EmpNo          VARCHAR2(8)  CONSTRAINT EmpEmpNoRequired        NOT NULL,
  EmpName        VARCHAR2(30) CONSTRAINT EmpEmpNameRequired      NOT NULL,
  Department     VARCHAR2(30) CONSTRAINT EmpDepartmentRequired   NOT NULL,
  Email          VARCHAR2(30) CONSTRAINT EmpEmailRequired        NOT NULL,
  Phone          CHAR(15)     CONSTRAINT EmpPhoneRequired        NOT NULL, -- Internal only? Allow enough for cellphone

  CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EmpNo)

 );
 
CREATE TABLE Facility
( FacNo           VARCHAR2(8)  ,
  FacName         VARCHAR2(30) ,

  CONSTRAINT PK_FACILITY PRIMARY KEY (FacNo)

 );
 
CREATE TABLE Location
( LocNo           VARCHAR2(8)  CONSTRAINT LocLocNoRequired        NOT NULL,
  FacNo           VARCHAR2(8)  CONSTRAINT LocFacNoRequired        NOT NULL,
  LocName         VARCHAR2(30) CONSTRAINT LocLocNameRequired      NOT NULL,

  CONSTRAINT PK_LOCATION PRIMARY KEY (LocNo),

  CONSTRAINT FK_LOCATION_FACILITY FOREIGN KEY (FacNo) REFERENCES Facility (FacNo)
 );
 
CREATE TABLE ResourceTbl
( ResNo           VARCHAR2(8)  CONSTRAINT ResResNoRequired        NOT NULL,
  ResName         VARCHAR2(30) CONSTRAINT ResResNameRequired      NOT NULL,
  Rate            DECIMAL(5,2) CONSTRAINT ResRateRequired         NOT NULL,

  CONSTRAINT PK_RESOURCE_TBL PRIMARY KEY (ResNo),

  CONSTRAINT RESOURCE_RATE_POS CHECK (Rate > 0)
 );

CREATE TABLE EventRequest
( EventNo         VARCHAR2(8)  CONSTRAINT ErqEventNoRequired        NOT NULL,
  DateHeld        DATE         CONSTRAINT ErqDateHeldRequired       NOT NULL,
  DateReq         DATE         CONSTRAINT ErqDateReqRequired        NOT NULL,
  FacNo           VARCHAR(8)   CONSTRAINT ErqFacNoRequired          NOT NULL,
  CustNo          VARCHAR(8)   CONSTRAINT ErqCustNoRequired         NOT NULL,
  DateAuth        DATE        ,
  Status          CHAR(10)     CONSTRAINT ErqStatusRequired         NOT NULL, -- {Approved, Pending, Denied}
  EstCost         DECIMAL(10,2) CONSTRAINT ErqEstCostRequired        NOT NULL, -- Max $99999.99
  EstAudience     DECIMAL(10)   CONSTRAINT ErqEstAudienceRequired    NOT NULL, -- Max 99999 people
  BudNo           VARCHAR2(8) ,

  CONSTRAINT PK_EVENT_REQUEST  PRIMARY KEY (EventNo),

  CONSTRAINT FK_EVENT_REQUEST_CUSTOMER       FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
  CONSTRAINT FK_EVENT_REQUEST_FACILITY       FOREIGN KEY (FacNo) REFERENCES Facility (FacNo),

  CONSTRAINT EVENT_REQUEST_STATUS CHECK (Status IN ('Approved', 'Pending', 'Denied')),
  CONSTRAINT EVENT_REQUEST_AUDIENCE_POS CHECK (EstAudience > 0)

 );

CREATE TABLE EventPlan
( PlanNo          VARCHAR2(8)  CONSTRAINT EpPlanNoRequired      NOT NULL,
  EventNo         VARCHAR2(8)  CONSTRAINT EpEventNoRequired     NOT NULL,
  WorkDate        DATE         CONSTRAINT EpWorkDateRequired    NOT NULL,
  Notes           VARCHAR2(40) , -- {Operation, Cleanup, Setup}
  Activity        CHAR(10)     CONSTRAINT EpActivityRequired    NOT NULL, 
  EmpNo           VARCHAR2(8)  ,

  CONSTRAINT PK_EVENT_PLAN     PRIMARY KEY (PlanNo),

  CONSTRAINT FK_EVENT_PLAN_EVENT_REQUEST  FOREIGN KEY (EventNo) REFERENCES EventRequest (EventNo),
  CONSTRAINT FK_EVENT_PLAN_EMPLOYEE       FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)

 );

CREATE TABLE EventPlanLine
( PlanNo          VARCHAR2(8)  CONSTRAINT EplPlanNoRequired      NOT NULL,
  LineNo          DECIMAL(5)   CONSTRAINT EplLineNoRequired      NOT NULL, -- Max 99 lines
  TimeStart       DATE         CONSTRAINT EplTimeStartRequired   NOT NULL,
  TimeEnd         DATE         CONSTRAINT EplTimeEndRequired     NOT NULL,
  NumberFld       DECIMAL(5)   CONSTRAINT EplNumberFldRequired   NOT NULL, -- Max 99 fields
  LocNo           VARCHAR2(8)  CONSTRAINT EplLocNoRequired       NOT NULL,
  ResNo           VARCHAR2(8)  CONSTRAINT EplResNoRequired       NOT NULL,

-- Had to abbreviate the EVENT_PLAN_LINE to EPL or the contraints were too long below 

  CONSTRAINT PK_EVENT_PLAN_LINE PRIMARY KEY (PlanNo, LineNo),

  CONSTRAINT FK_EPL_EVENT_PLAN      FOREIGN KEY (PlanNo) REFERENCES EventPlan (PlanNo),
  CONSTRAINT FK_EPL_LOCATION        FOREIGN KEY (LocNo)  REFERENCES Location (LocNo),
  CONSTRAINT FK_EPL_RESOURCE_TBL    FOREIGN KEY (ResNo)  REFERENCES ResourceTbl (ResNo),

  CONSTRAINT EPL_START_LT_END CHECK (TimeStart < TimeEnd)


 );


