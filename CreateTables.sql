CREATE TABLE Branch(
  BranchID INT PRIMARY KEY AUTO_INCREMENT,
  BranchName VARCHAR(100),
  Address VARCHAR(200),
  Phone VARCHAR(15)
  );

CREATE TABLE VehicleType(
  TypeID INT PRIMARY KEY AUTO_INCREMENT,
  TypeName VARCHAR(50) 
  );

CREATE TABLE Vehicle(
  VehicleID INT PRIMARY KEY AUTO_INCREMENT,
  LicensePlate VARCHAR(10) UNIQUE,
  Make VARCHAR(50),
  Model VARCHAR(50),
  Year INT,
  Color VARCHAR(20),
  DailyRentalRate DECIMAL(10,2),
  CurrentMileage INT,
  VehicleTypeID INT,
  RentalBranchID INT,
  FOREIGN KEY (VehicleTypeID) REFERENCES VehicleType(TypeID),
  FOREIGN KEY (RentalBranchID) REFERENCES Branch(BranchID)
  );

CREATE TABLE MaintenanceStaff(
  StaffID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(50),
  OfficeNumber VARCHAR(10),
  PhoneNumber VARCHAR(15),
  Email VARCHAR(100),
  BranchContactInfo INT,
  FOREIGN KEY (BranchContactInfo) REFERENCES Branch(BranchID)
  );

CREATE TABLE Customers(
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(15),
  Email VARCHAR(100),
  DriverLicenseNum VARCHAR(20) UNIQUE,
  LicenseExpDate DATE
  );

CREATE TABLE RentalAgreement(
  RentalAgreementID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT,
  VehicleID INT,
  ScheduledPickup DATETIME,
  ScheduledReturn DATETIME,
  ActualPickup DATETIME,
  ActualReturn DATETIME,
  EstimatedCost DECIMAL(10,2),
  ActualCost DECIMAL(10,2),
  Status VARCHAR(20),
  PickupBranchID INT,
  ReturnBranchID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
  FOREIGN KEY (PickupBranchID) REFERENCES Branch(BranchID),
  FOREIGN KEY (ReturnBranchID) REFERENCES Branch(BranchID)
  );

CREATE TABLE MaintenanceRecords (
  RecordID INT PRIMARY KEY AUTO_INCREMENT,
  VehicleID INT,
  ReportingCustomerID INT,
  StaffID INT,
  IssueType VARCHAR(100),
  Description TEXT,
  Status VARCHAR(20),
  DateReported DATETIME,
  DateResolved DATETIME,
  Notes TEXT,
  FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
  FOREIGN KEY (ReportingCustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (StaffID) REFERENCES MaintenanceStaff(StaffID)
  );


  
  
  
  
