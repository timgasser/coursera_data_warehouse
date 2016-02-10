CREATE TABLE Customer
( CustNo          CHAR(8)      CONSTRAINT CustNoNotNull         NOT NULL,
  CustFirstName   VARCHAR(20)  CONSTRAINT CustFirstNameNotNull  NOT NULL,
  CustLastName    VARCHAR(20)  CONSTRAINT CustLastNameNotNull   NOT NULL,
  CustCity        VARCHAR(20)  ,
  CustState       CHAR(2)      ,
  CustZip         CHAR(5)      ,
  CustBal         DECIMAL(5,2) ,

  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo)

 );
 

CREATE TABLE Employee
( EmpNo           CHAR(8)     CONSTRAINT EmpNoNotNull         NOT NULL,
  EmpFirstName    VARCHAR(20) CONSTRAINT EmpFirstNameNotNull  NOT NULL,
  EmpLastName     VARCHAR(20) CONSTRAINT EmpLastNameNotNull   NOT NULL,
  EmpPhone        CHAR(15)    ,
  EmpEmail        VARCHAR(40) CONSTRAINT EmpEmailNotNull      NOT NULL,

  CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EmpNo)

);


CREATE TABLE OrderTbl
( OrdNo          CHAR(8)      CONSTRAINT OrdNoNotNull    NOT NULL,
  OrdDate        DATE         CONSTRAINT OrdDateNotNull  NOT NULL,
  CustNo         CHAR(8)      ,
  EmpNo          CHAR(8)      ,

  CONSTRAINT PK_ORDER_TBL PRIMARY KEY (OrdNo)

);


