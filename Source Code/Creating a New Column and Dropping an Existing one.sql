Alter table member
add SECONDARY_MAJOR VARCHAR (35);

update member 
set secondary_major = 'Economics'
where aus_id = 'g00085775';

update member 
set secondary_major = 'Mathematics'
where aus_id = 'b00089801';

update member 
set secondary_major = 'Music'
where aus_id = 'b00093124';

----

alter table media_team
add SECONDARY_MAJOR VARCHAR (35);

alter table executive_team
add SECONDARY_MAJOR VARCHAR (35);

alter table activities_team
add SECONDARY_MAJOR VARCHAR (35);

-------------
update executive_team
set secondary_major = 'Economics'
where aus_id = 'g00085775';

update activities_team 
set secondary_major = 'Mathematics'
where aus_id = 'b00089801';

update media_team
set secondary_major = 'Music'
where aus_id = 'b00093124';

alter table bills
add bill_description varchar (100);

update bills
set bill_description = 'gift card'
where bill_no = 'PALOALTF207101322';

update bills
set bill_description = 'printing customized taboo cards'
where bill_no = 'TABOOS2221938513';

--adding minor 1, minor2 columns in members tables
Alter table member
add minor1 VARCHAR (35);

Alter table member
add minor2 VARCHAR (35);


alter table media_team
add minor1 VARCHAR (35);

alter table media_team
add minor2 VARCHAR (35);

alter table executive_team
add minor1 VARCHAR (35);

alter table executive_team
add minor2 VARCHAR (35);

alter table activities_team
add minor1 VARCHAR (35);

alter table activities_team
add minor2 VARCHAR (35);

------------------------
update member 
set minor1 = 'Economics'
where aus_id = 'g00089132';

update member 
set minor1 = 'Data Science'
where aus_id = 'b00090070';


update member 
set minor1 = 'Data Science'
where aus_id = 'g00085775';

update member 
set minor2 = 'Music'
where aus_id = 'g00085775';

update member 
set minor1 = 'Data Science'
where aus_id = 'b00084833';

update member 
set minor2 = 'Applied Computational Mathematics'
where aus_id = 'b00084833';

----------------------------------

update activities_team
set minor1 = 'Economics'
where aus_id = 'g00089132';

update activities_team
set minor1 = 'Data Science'
where aus_id = 'b00090070';


update executive_team
set minor1 = 'Data Science'
where aus_id = 'g00085775';

update executive_team 
set minor2 = 'Music'
where aus_id = 'g00085775';

update executive_team
set minor1 = 'Data Science'
where aus_id = 'b00084833';

update executive_team 
set minor2 = 'Applied Computational Mathematics'
where aus_id = 'b00084833';

--dropping the platform column in our media_content table
alter table Media_Content
drop column platform;


