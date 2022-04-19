-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-15 15:01:46.428

-- tables
-- Table: CustomerDetails
CREATE TABLE CustomerDetails (
    customerName varchar(255) NOT NULL,
    ModeOfDining varchar(255) NOT NULL,
    orderType varchar(255) NOT NULL,
    BillNumber varchar(255) NOT NULL,
    TableNumber int NOT NULL,
    CONSTRAINT CustomerDetails_pk PRIMARY KEY (BillNumber)
);

-- Table: EmploymentInformation
CREATE TABLE EmploymentInformation (
    EmployeeName varchar(255) NOT NULL,
    EmployeeId int NOT NULL,
    Age int NOT NULL,
    placeOfWork varchar(255) NOT NULL,
    KitchenBackend_TableNo int NOT NULL,
    CONSTRAINT EmploymentInformation_pk PRIMARY KEY (EmployeeId)
);

-- Table: KitchenBackend
CREATE TABLE KitchenBackend (
    stock int NOT NULL,
    Unit int NOT NULL,
    totalOders int NOT NULL,
    TableNo int NOT NULL,
    CustomerLoyalty bool NOT NULL,
    VegORNonVeg int NOT NULL,
    EmployeeID int NOT NULL,
    CONSTRAINT KitchenBackend_pk PRIMARY KEY (TableNo)
);

-- Table: Menu
CREATE TABLE Menu (
    Appetizers int NOT NULL,
    Entree int NOT NULL,
    Sides int NOT NULL,
    Desserts int NOT NULL,
    Beverages int NOT NULL,
    KidsMenu int NOT NULL,
    BillNumber varchar(255) NOT NULL,
    CONSTRAINT Menu_pk PRIMARY KEY (Beverages)
);

-- Table: RestaurantFrontend
CREATE TABLE RestaurantFrontend (
    TableNumber int NOT NULL,
    NoOfGuests int NOT NULL,
    EmployeID int NOT NULL,
    ChoiceofCuisine int NOT NULL,
    EmployeeID int NOT NULL,
    BillNumber varchar(255) NOT NULL,
    KitchenBackend_TableNo int NOT NULL,
    CONSTRAINT RestaurantFrontend_pk PRIMARY KEY (TableNumber,EmployeID)
);

-- foreign keys
-- Reference: EmploymentInformation_KitchenBackend (table: EmploymentInformation)
ALTER TABLE EmploymentInformation ADD CONSTRAINT EmploymentInformation_KitchenBackend FOREIGN KEY EmploymentInformation_KitchenBackend (KitchenBackend_TableNo)
    REFERENCES KitchenBackend (TableNo);

-- Reference: Menu_CustomerDetails (table: Menu)
ALTER TABLE Menu ADD CONSTRAINT Menu_CustomerDetails FOREIGN KEY Menu_CustomerDetails (BillNumber)
    REFERENCES CustomerDetails (BillNumber);

-- Reference: RestaurantFrontend_CustomerDetails (table: RestaurantFrontend)
ALTER TABLE RestaurantFrontend ADD CONSTRAINT RestaurantFrontend_CustomerDetails FOREIGN KEY RestaurantFrontend_CustomerDetails (BillNumber)
    REFERENCES CustomerDetails (BillNumber);

-- Reference: RestaurantFrontend_EmploymentInformation (table: RestaurantFrontend)
ALTER TABLE RestaurantFrontend ADD CONSTRAINT RestaurantFrontend_EmploymentInformation FOREIGN KEY RestaurantFrontend_EmploymentInformation (EmployeeID)
    REFERENCES EmploymentInformation (EmployeeId);

-- Reference: RestaurantFrontend_KitchenBackend (table: RestaurantFrontend)
ALTER TABLE RestaurantFrontend ADD CONSTRAINT RestaurantFrontend_KitchenBackend FOREIGN KEY RestaurantFrontend_KitchenBackend (KitchenBackend_TableNo)
    REFERENCES KitchenBackend (TableNo);

-- End of file.

