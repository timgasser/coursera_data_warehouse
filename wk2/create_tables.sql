CREATE TABLE Customer
( CustNo        CHAR(4)      CONSTRAINT CustNoNotNull       NOT NULL,
  CustName      VARCHAR(20)  CONSTRAINT CustNameNotNull     NOT NULL,
  CustAddress   VARCHAR(50)  CONSTRAINT CustAddressNotNull  NOT NULL,
  CustInternal  BOOLEAN      CONSTRAINT CustContactNotNull  NOT NULL,
  CustContact   VARCHAR(30)  CONSTRAINT CustContactNotNull  NOT NULL,
  CustPhone     CHAR(10)     CONSTRAINT CustPhoneNotNull    NOT NULL,
  CustCity      CHAR(20)     CONSTRAINT CustCityNotNul      NOT NULL,
  CustState     CHAR(2)      CONSTRAINT CustStateNotNull    NOT NULL,
  CustZip       CHAR(5)      CONSTRAINT CustZipNotNull      NOT NULL,

  CONSTRAINT PKCustomer PRIMARY KEY (CustNo)

 )
 

CREATE TABLE Facility
( FacNo       CHAR(5)      CONSTRAINT FacNoNotNull    NOT NULL,
  FacName     VARCHAR(20)  CONSTRAINT FacNameNotNull  NOT NULL,

  CONSTRAINT PKFacility PRIMARY KEY (FacNo)
 )


CREATE TABLE Location
( LocNo      CHAR(5),
  FacNo      CHAR(5),
  LocName    VARCHAR(20)   CONSTRAINT LocNameNotNull NOT NULL,

  CONSTRAINT PKLocation PRIMARY KEY (LocNo)
  CONSTRAINT FKFacNo FOREIGN KEY (FacNo) REFERENCES Facility

 )

