CREATE TABLE Customer
( CustNo        CHAR(4)      CONSTRAINT CustNoNotNull       NOT NULL,
  CustName      VARCHAR(20)  CONSTRAINT CustNameNotNull     NOT NULL,
  CustAddress   VARCHAR(50)  CONSTRAINT CustAddressNotNull  NOT NULL,
  CustInternal  INTEGER      CONSTRAINT CustInternalNotNull NOT NULL,
  CustContact   VARCHAR(30)  CONSTRAINT CustContactNotNull  NOT NULL,
  CustPhone     CHAR(10)     CONSTRAINT CustPhoneNotNull    NOT NULL,
  CustCity      CHAR(20)     CONSTRAINT CustCityNotNul      NOT NULL,
  CustState     CHAR(2)      CONSTRAINT CustStateNotNull    NOT NULL,
  CustZip       CHAR(5)      CONSTRAINT CustZipNotNull      NOT NULL,

  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo)

 );
 

CREATE TABLE Facility
( FacNo       CHAR(5)      CONSTRAINT FacNoNotNull    NOT NULL,
  FacName     VARCHAR(20)  CONSTRAINT FacNameNotNull  NOT NULL,

  CONSTRAINT PK_FACILITY PRIMARY KEY (FacNo),
  CONSTRAINT UNIQUE_FACNAME UNIQUE (FacName)

 );


CREATE TABLE Location
( LocNo      CHAR(5)       CONSTRAINT LocNoNotNull NOT NULL,
  FacNo      CHAR(5)       CONSTRAINT FacNoFkNotNull NOT NULL,
  LocName    VARCHAR(20)   CONSTRAINT LocNameNotNull NOT NULL,

  CONSTRAINT PK_LOCATION PRIMARY KEY (LocNo),
  CONSTRAINT FK_FACNO FOREIGN KEY (FacNo) REFERENCES Facility (FacNo)

 );

