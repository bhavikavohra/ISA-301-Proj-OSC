 Create table Member(
 AUS_ID VARCHAR(9) Primary Key,
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE,
 TEAM VARCHAR(15) NOT NULL
 );

  Create table Activities_Team(
 AUS_ID VARCHAR(9) Primary Key,
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE,
 TEAM VARCHAR(15) NOT NULL,
 Activities_Team_Position VARCHAR(30) NOT NULL,
 Tech_skill_Level INT NOT NULL CHECK (Tech_skill_Level>=1 and Tech_skill_Level<=10),
 Reports_To VARCHAR(25) --position of their superior
 );
 
   Create table Media_Team(
 AUS_ID VARCHAR(9) Primary Key,
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE,
 TEAM VARCHAR(15) NOT NULL,
 Media_Team_Position VARCHAR(25) NOT NULL,
 Media_skill_Level INT NOT Null CHECK (Media_skill_Level>=1 and Media_skill_Level<=10),
 Reports_To Varchar(25) --position of their superior
 );
 
   Create table Executive_Team(
 AUS_ID VARCHAR(9) Primary Key,
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE,
 TEAM VARCHAR(15) NOT NULL,
 Executive_Team_Position VARCHAR(25) NOT NULL,
 Bank_Account_Number VARCHAR(50),
 Reports_To Varchar(25) --position of their superior
 );
 

    Create table Event(
 Event_ID VARCHAR(10) Primary Key, --xxxTTT, where xxx - 3 letter acronym for the event, TTT - term, for eg, CTFS23
 Event_Name VARCHAR(50) NOT NULL,
 Event_Semester VARCHAR(15) NOT NULL,
 EventDate DATE,
 Event_Location VARCHAR(20),
 Event_StartTime VARCHAR(10),
 Event_EndTime VARCHAR(10),
 Event_Description VARCHAR(50),
 Event_Category VARCHAR(50),
 Collaborated_Event CHAR(1) CHECK (Collaborated_Event='Y' or Collaborated_Event='N'),
 Event_Manager VARCHAR(9),
 Attendance INT CHECK (Attendance>0 or Attendance is NULL)
 );
 

 
     Create table Collaborated_Events(
 Event_ID VARCHAR(10) Primary Key, --xxxTTT, where xxx - 3 letter acronym for the event, TTT - term, for eg, CTFS23
 Event_Name VARCHAR(50) NOT NULL,
 Event_Semester VARCHAR(15) NOT NULL,
 EventDate DATE,
 Event_Location VARCHAR(20),
 Event_StartTime VARCHAR(10),
 Event_EndTime VARCHAR(10),
 Event_Description VARCHAR(50),
 Event_Category VARCHAR(50),
 Collaborated_Event CHAR(1) CHECK (Collaborated_Event='Y'),
 Event_Manager VARCHAR(9),
 Attendance INT CHECK (Attendance>0 or Attendance is NULL)
 );
 

 Create table Event_Collaborated(
 Event_ID Varchar(10),
 Emirates_ID Varchar(20),
 Primary key(Event_ID, Emirates_ID));
 

 
 Create table Collaborators(
 Emirates_ID Varchar(20) PRIMARY KEY,
 Name_of_Collaborator Varchar(50) Not Null,
 Organization Varchar(50) Not Null,
 Email Varchar(20) Not Null UNIQUE,
 Phone_No Varchar(20) not Null UNIQUE,
 Collaborator_Type Varchar(10) not Null CHECK (Collaborator_Type='Internal' or Collaborator_Type='External')
 );
 
 Create table Internal(
 Emirates_ID Varchar(20) PRIMARY KEY,
 Name_of_Collaborator Varchar(50) Not Null,
 Organization Varchar(50) Not Null,
 Email Varchar(20) Not Null UNIQUE,
 Phone_No Varchar(20) not Null UNIQUE,
 Collaborator_Type Varchar(10) not Null CHECK (Collaborator_Type='Internal'),
 Department Varchar(50),
 college Varchar(50)
 );
 
 
 
 Create table External(
 Emirates_ID Varchar(20) PRIMARY KEY,
 Name_of_Collaborator Varchar(50) Not Null,
 Organization Varchar(50) Not Null,
 Email Varchar(20) Not Null UNIQUE,
 Phone_No Varchar(20) not Null UNIQUE,
 Collaborator_Type Varchar(10) not Null CHECK (Collaborator_Type='External'),
 Education_Level Varchar(25) not Null,
 Place_of_Residence Varchar(50) not null,
 Nationality Varchar(50) not null
 );
 
 Create table Media_Content(
 Content_ID Varchar(15) Primary Key, -- xxx-TTT-yy - xxx - acronym for the media post, TTT - term, yy - number, for eg: TT-S23-01
 Creator_AUS_ID varchar(9),
 Event_ID Varchar(10),
 Format Varchar(15) Not Null,
 DatePublished Date Not Null,
 Platform Varchar(15) Not Null,
 No_Of_Likes INT Not Null CHECK (No_Of_Likes>=0),
 No_Of_Views INT Not Null CHECK (No_Of_Views>=0)
 );
 

create table Budget(
Budget_ID Varchar(10) Primary Key, --6 digit number (c.f. Engage)
Event_ID Varchar(10) Not Null,
Amount_Of_Budget NUMBER(6,2) Not Null CHECK (Amount_Of_Budget>=0.0),
Budget_Status Varchar(10) CHECK (Budget_Status='Approved' or Budget_Status='Rejected' or Budget_Status='Pending'), -- Approved, Pending or Rejected
Budget_Used NUMBER(6,2) DEFAULT 0.00 NOT NULL,
Budget_Left NUMBER(6,2) Not Null,
Academic_Term Varchar(15) NOT NULL
);


create table Bills(
Bill_No varchar(20) Primary key, -- xxx-yyy-zzz-NUM, where xxx: Event, yyy: last 3 digits of budgetNo, zzz: last 3 digits of ID of purchaser, NUM: serial number of the bill. for eg: CTF-351-833-001
Amount_of_Bill NUMBER(6,2) Not Null CHECK (Amount_of_Bill>=0.0),
Purchased_By varchar(9) Not Null,
Merchant_Name Varchar(25) Not Null,
Payment_Method Varchar(15) Not Null, --cash or card or bank transfer
Reimbursed CHAR(1) Not Null CHECK (Reimbursed='Y' or Reimbursed='N'),
Payment_Date Date Not Null,
Budget_No Varchar(10) NOT NULL,
Handled_By Varchar(9) NOT NULL
);

Alter table bills
Add Foreign Key (Purchased_By) References Member (AUS_ID);

Alter table bills
Add Foreign Key (Budget_No) References Budget (Budget_ID);

Alter table bills
Add Foreign Key (Handled_By) References Executive_Team (AUS_ID);

alter table Event
add Foreign Key (Event_Manager) References Activities_team(AUS_ID);

 alter table Collaborated_Events
 add Foreign Key (Event_Manager) References Activities_team(AUS_ID);
 
 alter table Event_Collaborated
 add Foreign key (Event_ID) References Collaborated_Events(Event_ID);
 
 alter table Event_Collaborated --run later!!
 add Foreign key (Emirates_ID) References Collaborators(Emirates_ID);
 
  Alter Table Media_Content
 add Foreign Key (Event_ID) References Event(Event_ID);
 
 Alter Table Media_Content
 add Foreign Key (Creator_AUS_ID) References Media_Team(AUS_ID);
 
 alter  table Budget
Add Foreign Key (Event_ID) References Event(Event_ID);





