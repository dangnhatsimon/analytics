# To rename a database, we need create new database and rename all table in old database to new database
# All table from old will be transfer to new one.
create database casestudy_02;
rename table casestudy_01.202004_trip to casestudy_02.202004_trip;
rename table casestudy_01.202005_trip to casestudy_02.202005_trip;
rename table casestudy_01.202006_trip to casestudy_02.202006_trip;
rename table casestudy_01.202007_trip to casestudy_02.202007_trip;