# Create new database
create database if not exists casestudy_02;
use casestudy_02;

# Fixing error code 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
show variables like "secure_file_priv";
-- Go to "C:\ProgramData\MySQL\MySQL Server 8.0\"
-- Give permission to edit file "my.in"
-- Edit file "my.in" by notepad
-- In line "# Secure File Priv.
-- secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads" 
-- Change to
-- "# Secure File Priv.
-- #secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"
-- secure-file-priv=""
-- Save and go to Service
-- Restart MYSQL80

# Import data from csv. Trip data from "Divvy_Trips_2013.csv"
set sql_mode="";
DROP table if exists 2013_trip;
CREATE TABLE IF NOT EXISTS 2013_trip 
(
	id int primary key,
	activitydate datetime,
	totalsteps int,
	totaldistance double,
	trackerdistance double,
	LoggedActivitiesDistance int,
	VeryActiveDistance text,
	ModeratelyActiveDistance int,
	LightActiveDistance text,
	SedentaryActiveDistance varchar(50),
	VeryActiveMinutes varchar(50),
	FairlyActiveMinutes int,
    LightlyActiveMinutes int,
    SedentaryMinutes int,
    calories int
);
LOAD DATA INFILE 'D:/Data Analytics/Portfolio/Case study 2/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv'
INTO TABLE 2013_trip
FIELDS	TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
