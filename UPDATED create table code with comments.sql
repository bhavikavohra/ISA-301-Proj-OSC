--creating the member table----

Create table Member(
 AUS_ID VARCHAR(9) Primary Key, --the AUS_ID is the PK
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE, --should be unique for each member
 TEAM VARCHAR(15) NOT NULL --activities_team, media_team and executive team
 );

--creating the activities_team table----

  Create table Activities_Team(
 AUS_ID VARCHAR(9) Primary Key, --the AUS_ID is the PK
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE, --should be unique for each member
 TEAM VARCHAR(15) NOT NULL,
 Activities_Team_Position VARCHAR(30) NOT NULL, --THE POSITION OF THE ACTIVITIES TEAM MEMBER, SUCH AS HEADOFACTIVITIES, RESEARCH COORDINATOR
 Tech_skill_Level INT NOT NULL CHECK (Tech_skill_Level>=1 and Tech_skill_Level<=10), --tech skill is a range from 1 to 10 (with 10 being the highest)
 Reports_To VARCHAR(25) --position of their superior (ie. for head of activities, the reports to is president)
 );
 
 --creating the media_team table----
 
   Create table Media_Team(
 AUS_ID VARCHAR(9) Primary Key, --the AUS_ID is the PK
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE, --THE EMAIL SHOULD BE UNIQUE FOR EVERY MEMBER
 TEAM VARCHAR(15) NOT NULL,
 Media_Team_Position VARCHAR(25) NOT NULL, --THE POSITION OF THE MEDIA TEAM MEMBER, SUCH AS HEADOFMEDIA
 Media_skill_Level INT NOT Null CHECK (Media_skill_Level>=1 and Media_skill_Level<=10), --MEDIA SKILL IS A RANGE FROM 1 TO 10 (WITH 10 BEING THE HIGHEST)
 Reports_To Varchar(25) --position of their superior (IE. FOR HEAD OF MEDIA, IT WOULD BE PRESIDENT)
 );
 
 --creating the executive_team table----
 
   Create table Executive_Team(
 AUS_ID VARCHAR(9) Primary Key, --the AUS_ID is the PK
 Name VARCHAR(50) NOT NULL,
 Primary_Major VARCHAR(35) NOT NULL,
 Standing VARCHAR(15) NOT NULL,
 Email VARCHAR(17) NOT NULL UNIQUE, --THE EMAIL SHOULD BE UNIQUE FOR EVERY MEMBER
 TEAM VARCHAR(15) NOT NULL,
 Executive_Team_Position VARCHAR(25) NOT NULL, --THE POSITION OF THE EXECUTIVE TEAM MEMBER, SUCH AS PRESIDENT, VICEPRESIDENT
 Bank_Account_Number VARCHAR(50), --CAN BE NULL, AS OSC DOES NOT STORE BANK ACCOUNT NUMBER OF EVERY EXECUTIVE TEAM MEMBER
 Reports_To Varchar(25) --position of their superior (is null for president, is president for vicepresident, treasurer and executive assistant)
 );
 
  --creating the event table----
  
    Create table Event(
 Event_ID VARCHAR(10) Primary Key, --xxxTTT, where xxx - 3 letter acronym for the event, TTT - term, for eg, CTFS23
 Event_Name VARCHAR(50) NOT NULL,
 Event_Semester VARCHAR(15) NOT NULL,
 EventDate DATE, --can be null if the event is hosted over 2 days or more
 Event_Location VARCHAR(20), --some events do not have locations (for example: a data analysing competition where students have to submit results through mail
 Event_StartTime VARCHAR(10),
 Event_EndTime VARCHAR(10),
 Event_Description VARCHAR(50),
 Event_Category VARCHAR(50), --is the event primarily informational, recreational or educational
 Collaborated_Event CHAR(1) CHECK (Collaborated_Event='Y' or Collaborated_Event='N'), --if event has collaborator, then 'Y', otherwise 'N'
 Event_Manager VARCHAR(9), --added as an FK later to the Activities team table, references AUS_ID from Activities team table
 Attendance INT CHECK (Attendance>0 or Attendance is NULL) --should be greater than 0, otherwise attendance is NULL
 );
 
  --creating the collaborated_events table----
 
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
 Collaborated_Event CHAR(1) CHECK (Collaborated_Event='Y'), --only those events which have collabortors and have 'Y' as Collaborated_Event from Event will be stored in this table
 Event_Manager VARCHAR(9), --added as an FK later to the Activities team table, references AUS_ID from Activities team table
 Attendance INT CHECK (Attendance>0 or Attendance is NULL) --should be greater than 0, otherwise attendance is NULL
 );
 
 --creating the Event_Collaborated table (an associative table between Collaborated_Events and Collaborators table----
 Create table Event_Collaborated(
 Event_ID Varchar(10), ---primary key of Collaborated_Events table
 Emirates_ID Varchar(20), ----primary key of Collaborators table
 Primary key(Event_ID, Emirates_ID)); --both the attributes are composite PK's in this table
 
 --creating the Collaborators table----

 Create table Collaborators(
 Emirates_ID Varchar(20) PRIMARY KEY, --THE PK IS EMIRATES_ID, WE STORE THE EMIRATES_ID OF THE COLLABORATOR OR THE POC OF THE ORGANIZATION
 Name_of_Collaborator Varchar(50) Not Null, --NAME OF POC OF THE ORGANIZATION OR THE ACTUAL COLLABORATOR
 Organization Varchar(50) Not Null, --NOT NULL AS COLLABORATOR HAS TO BELONG TO AN ORGANIZATION (IF IN THE FUTURE, WE EVER CALL A INDIVIDUAL COLLABORTOR, WE CAN STORE THE ORGANIZATION AS STANDALONE
 Email Varchar(20) Not Null UNIQUE, --SHOULD BE NOT NULL AND UNIQUE, EMAIL CAN BE DOMAIN OF THE ORGANIZATION OR DOMAIN OF GMAIL OR YAHOO
 Phone_No Varchar(20) not Null UNIQUE, --SHOULD BE UNIQUE
 Collaborator_Type Varchar(10) not Null CHECK (Collaborator_Type='Internal' or Collaborator_Type='External') --SHOULD BE NOT NULL, AND SHOULD BE ONLY INTERNAL OR EXTERNAL
 );

 --creating the Internal (Collaboratrs) table----
 
 Create table Internal( --INTERNAL COLLABORATORS REFER TO COLLABORATORS WHO ARE APART OF THE AUS COMMUNITY
 Emirates_ID Varchar(20) PRIMARY KEY, 
 Name_of_Collaborator Varchar(50) Not Null,
 Organization Varchar(50) Not Null,
 Email Varchar(20) Not Null UNIQUE,
 Phone_No Varchar(20) not Null UNIQUE,
 Collaborator_Type Varchar(10) not Null CHECK (Collaborator_Type='Internal'),--this table only stores internal collaborators, so this value should be checked with INTERNAL constraint
 Department Varchar(50), --OFFICE OF STUDENT AFFAIRS REQUIRES US TO STORE THE DEPARTMENT OF THE INTERNAL COLLABORATOR
 college Varchar(50) --OFFICE OF STUDENT AFFAIRS REQUIRES US TO STORE THE COLLEGE OF THE INTERNAL COLLABORATOR (for a specific club, it would be the college they operate under or have primary business in
 );
 
  --creating the External (Collaboratrs) table----
 
 Create table External( --EXTERNAL COLLABORATORS REFER TO COLLABORATORS WHO ARE not APART OF THE AUS COMMUNITY
 Emirates_ID Varchar(20) PRIMARY KEY,
 Name_of_Collaborator Varchar(50) Not Null,
 Organization Varchar(50) Not Null,
 Email Varchar(20) Not Null UNIQUE,
 Phone_No Varchar(20) not Null UNIQUE,
 Collaborator_Type Varchar(10) not Null CHECK (Collaborator_Type='External'), --this table only stores EXTERNAL collaborators, so this value should be checked with EXTERNAL constraint
 Education_Level Varchar(25) not Null, --OFFICE OF STUDENT AFFAIRS REQUIRES US TO STORE THE EDUCATION LEVEL OF THE EXTERNAL COLLABORATOR
 Place_of_Residence Varchar(50) not null, --OFFICE OF STUDENT AFFAIRS REQUIRES US TO STORE THE PLACE OF RESIDENCE OF THE EXTERNAL COLLABORATOR
 Nationality Varchar(50) not null --OFFICE OF STUDENT AFFAIRS REQUIRES US TO STORE THE NATIONALITY OF THE EXTERNAL COLLABORATOR
 );
 
  --creating the Media_Content table----
 
 Create table Media_Content(
 Content_ID Varchar(15) Primary Key, -- xxx-TTT-yy - xxx - acronym for the media post, TTT - term, yy - number, for eg: TT-S23-01, Content_ID is the PK
 Creator_AUS_ID varchar(9),
 Event_ID Varchar(10), --some media content is associated to an event, will make this a FK later on
 Format Varchar(15) Not Null, --for example: reel, post, video
 DatePublished Date Not Null,
 Platform Varchar(15) Not Null, 
 No_Of_Likes INT Not Null CHECK (No_Of_Likes>=0), --the number of likes cannot be null, but can be greater than or equal to 0
 No_Of_Views INT Not Null CHECK (No_Of_Views>=0) --the number of views cannot be null, but can be greater than or equal to 0
 );
 
  --creating the Budget table----
  
create table Budget(
Budget_ID Varchar(10) Primary Key, --6 digit number (c.f. Engage), this is the PK, we use the same number as found on Engage
Event_ID Varchar(10) Not Null, --every budget is associated to an event, thus cannot be null
Amount_Of_Budget NUMBER(6,2) Not Null CHECK (Amount_Of_Budget>=0.0),
Budget_Status Varchar(10) CHECK (Budget_Status='Approved' or Budget_Status='Rejected' or Budget_Status='Pending'), -- added a constraint to make the budget_status either Approved, Pending or Rejected
Budget_Used NUMBER(6,2) DEFAULT 0.00 NOT NULL, --the budget used for the specific event
Budget_Left NUMBER(6,2) Not Null, --the budget left, this is calculated as Amount_Of_Buget - Budget_Used, however at this point we just manually calculate and add it, but later we will make it derived attribute
Academic_Term Varchar(15) NOT NULL --the term the Budget belongs to
);

  --creating the Bills table----

create table Bills(
Bill_No varchar(20) Primary key, --the primary key of the table, xxx-yyy-zzz-NUM, where xxx: Event, yyy: last 3 digits of budgetNo, zzz: last 3 digits of ID of purchaser, NUM: serial number of the bill. for eg: CTF-351-833-001
Amount_of_Bill NUMBER(6,2) Not Null CHECK (Amount_of_Bill>=0.0), --the amount of bill should be greater or equal to 0
Purchased_By varchar(9) Not Null, --the ausid of the member who paid for the bill
Merchant_Name Varchar(25) Not Null,
Payment_Method Varchar(15) Not Null, --cash or card or bank transfer
Reimbursed CHAR(1) Not Null CHECK (Reimbursed='Y' or Reimbursed='N'), --to check if the bill has been reimbursed ('Y' as reimbursed or 'N' as reimbursed)
Payment_Date Date Not Null, 
Budget_No Varchar(10) NOT NULL, --which bill the budget corresponds to
Handled_By Varchar(9) NOT NULL --the ausid of the executive team member who handles the bill (in OSC, president or treasurer handles the bill)
);

--altering the bills table to make the Puchased_By attribute as an FK, referencing the AUS_ID in Member table--
Alter table bills
Add Foreign Key (Purchased_By) References Member (AUS_ID);

--altering the bills table to make the Budget_No attribute as an FK, referencing the Budget_ID in Budget table--
Alter table bills
Add Foreign Key (Budget_No) References Budget (Budget_ID);

--altering the bills table to make the Handled_By attribute as an FK, referencing the AUS_ID in Executive_Team table--
Alter table bills
Add Foreign Key (Handled_By) References Executive_Team (AUS_ID);

--altering the Event table to make the Event_Manager attribute as an FK, referencing the AUS_ID in Activities_Team table--
alter table Event
add Foreign Key (Event_Manager) References Activities_team(AUS_ID);

--altering the Collaborated_Events table to make the Event_Manager attribute as an FK, referencing the AUS_ID in Activities_Team table--
 alter table Collaborated_Events
 add Foreign Key (Event_Manager) References Activities_team(AUS_ID);
 
 --altering the Event_Collaborated table to make the Event_ID attribute as an FK, referencing the Event_ID in Collaborated_Events table--
 alter table Event_Collaborated
 add Foreign key (Event_ID) References Collaborated_Events(Event_ID);
 
  --altering the Event_Collaborated table to make the Emirates_ID attribute as an FK, referencing the Emirates_ID in Collaborators table--
 alter table Event_Collaborated
 add Foreign key (Emirates_ID) References Collaborators(Emirates_ID);
 
   --altering the Media_Content table to make the Event_ID attribute as an FK, referencing the Event_ID in Event table--
  Alter Table Media_Content
 add Foreign Key (Event_ID) References Event(Event_ID);
 
    --altering the Media_Content table to make the Creator_AUS_ID attribute as an FK, referencing the AUS_ID in Media_Team_table--
 Alter Table Media_Content
 add Foreign Key (Creator_AUS_ID) References Media_Team(AUS_ID);
 
    --altering the Budget table to make the Event_ID attribute as an FK, referencing the Event_ID in Event table--
 alter  table Budget
Add Foreign Key (Event_ID) References Event(Event_ID);





