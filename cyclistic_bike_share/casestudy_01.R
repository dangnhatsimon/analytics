# Install and load packages
install.packages('tidyverse')
install.packages('lubridate')
install.packages('ggplot')
install.packages('readr')
install.packages('dplyr')
install.packages('janitor')
install.packages('here')
install.packages('skimr')
install.packages('scales')
install.packages('plyr')
library('tidyverse')
library('lubridate')
library('ggplot2')
library('readr')
library('dplyr')
library('janitor')
library('here')
library('skimr')
library('scales')
library('plyr')
getwd()
setwd("D:/Data Analytics/Portfolio/Case study 1/Data/")

# Data prepare
# Get trip data from csv files
# Get attention each file, data type and structure of each file may be different
# Import trip data from "Divvy_Trips_2013.csv", "Divvy_Trips_2018_Q1.csv" to "Divvy_Trips_2019_Q4.csv"
trip_2019_q3 <- read_csv("Divvy_Trips_2019_Q3.csv",
                      skip =1,
                      col_names = c('ride_id','started_at','ended_at','bikeid','tripduration',
                                    'start_station_id','start_station_name',
                                    'end_station_id','end_station_name',
                                    'member_casual','gender','birthyear'),
                      col_types=cols(ride_id = col_character(),
                                     started_at = col_datetime(),ended_at = col_datetime(),
                                     bikeid = col_integer(), tripduration = col_integer(),
                                     start_station_id = col_character(), start_station_name = col_character(),
                                     end_station_id = col_character(), end_station_name = col_character(),
                                     member_casual = col_character(), gender = col_character(),
                                     birthyear = col_integer())
                      )

# Import trip data from "Divvy_Trips_2014_Q1Q2.csv"
trip_2014_q1q2 <- read_csv("Divvy_Trips_2014_Q1Q2.csv",
                           skip =1,
                           col_names = c('ride_id','started_at','ended_at','bikeid','tripduration',
                                         'start_station_id','start_station_name',
                                         'end_station_id','end_station_name',
                                         'member_casual','gender','birthyear'),
                           col_types=cols(ride_id = col_character(),
                                          started_at = col_character(),ended_at = col_character(),
                                          bikeid = col_integer(), tripduration = col_integer(),
                                          start_station_id = col_character(), start_station_name = col_character(),
                                          end_station_id = col_character(), end_station_name = col_character(),
                                          member_casual = col_character(), gender = col_character(),
                                          birthyear = col_integer())
                           )
                           

# Import trip data from "Divvy_Trips_2014-Q3-07.csv" to "Divvy_Trips_2016_Q1.csv", "Divvy_Trips_2017_Q4.csv"
trip_2017_q4 <- read_csv("Divvy_Trips_2017_Q4.csv",
                         skip =1,
                         col_names = c('ride_id','started_at','ended_at','bikeid','tripduration',
                                       'start_station_id','start_station_name',
                                       'end_station_id','end_station_name',
                                       'member_casual','gender','birthyear'),
                         col_types=cols(ride_id = col_character(),
                                        started_at = col_datetime(format="%m/%d/%Y %H:%M"),ended_at = col_datetime(format="%m/%d/%Y %H:%M"),
                                        bikeid = col_integer(), tripduration = col_integer(),
                                        start_station_id = col_character(), start_station_name = col_character(),
                                        end_station_id = col_character(), end_station_name = col_character(),
                                        member_casual = col_character(), gender = col_character(),
                                        birthyear = col_integer())
                         )

# Import trip data from "Divvy_Trips_2016_Q3.csv" to "Divvy_Trips_2017_Q3.csv"
trip_2017_q3 <- read_csv("Divvy_Trips_2017_Q3.csv",
                           skip =1,
                           col_names = c('ride_id','started_at','ended_at','bikeid','tripduration',
                                         'start_station_id','start_station_name',
                                         'end_station_id','end_station_name',
                                         'member_casual','gender','birthyear'),
                           col_types=cols(ride_id = col_character(),
                                          started_at = col_datetime(format="%m/%d/%Y %H:%M:%S"),ended_at = col_datetime(format="%m/%d/%Y %H:%M:%S"),
                                          bikeid = col_integer(), tripduration = col_integer(),
                                          start_station_id = col_character(), start_station_name = col_character(),
                                          end_station_id = col_character(), end_station_name = col_character(),
                                          member_casual = col_character(), gender = col_character(),
                                          birthyear = col_integer())
                           )

# Import trip data from "Divvy_Trips_2020_Q1.csv" to "202212-divvy-tripdata.csv"
trip_2022_12 <- read_csv("202212-divvy-tripdata.csv",
                         skip =1,
                         col_names = c('ride_id','rideable_type','started_at','ended_at',
                                       'start_station_name','start_station_id',
                                       'end_station_name','end_station_id',
                                       'start_lat','start_lng','end_lat','end_lng','member_casual'),
                         col_types=cols(ride_id = col_character(), rideable_type = col_character(),
                                        started_at = col_datetime(),ended_at = col_datetime(),
                                        start_station_name = col_character(), start_station_id= col_character(),
                                        end_station_name = col_character(), end_station_id= col_character(),
                                        start_station_id = col_character(), start_station_name = col_character(),
                                        start_lat = col_double(), start_lng = col_double(),
                                        end_lat = col_double(), end_lng = col_double(),
                                        member_casual = col_character())
                         )

#Get station data from csv files
# Import station data from "Divvy_Stations_2013.csv"
station_2013 <- read_csv("Divvy_Stations_2013.csv",
                         skip =1,
                         col_names = c('id','name','latitude','longitude','dpcapacity','landmark','online_date'),
                         col_types=cols(id = col_integer(), name = col_character(), latitude = col_double(), longitude = col_double(),
                                        dpcapacity = col_integer(), landmark = col_integer(), online_date = col_date(format = '%m/%d/%Y'))
                         )

# Import station data from "Divvy_Stations_2014-Q1Q2.csv"
station_2014_q1q2 <- read_csv("Divvy_Stations_2014-Q1Q2.csv",
                         skip =1,
                         col_names = c('id','name','latitude','longitude','dpcapacity','online_date'),
                         col_types=cols(id = col_integer(), name = col_character(), latitude = col_double(), longitude = col_double(),
                                        dpcapacity = col_integer(), online_date = col_date())
                         )

# Import station data from "Divvy_Stations_2014-Q3Q4.csv"
station_2014_q3q4 <- read_csv("Divvy_Stations_2014-Q3Q4.csv",
                              skip =1,
                              col_names = c('id','name','latitude','longitude','dpcapacity','online_date'),
                              col_types=cols(id = col_integer(), name = col_character(), latitude = col_double(), longitude = col_double(),
                                             dpcapacity = col_integer(), online_date = col_datetime(format = '%m/%d/%Y %H:%M'))
                              )

# Import station data from "Divvy_Stations_2015.csv"
station_2015 <- read_csv("Divvy_Stations_2015.csv",
                              skip =1,
                              col_names = c('id','name','latitude','longitude','dpcapacity','landmark'),
                              col_types=cols(id = col_integer(), name = col_character(), latitude = col_double(), longitude = col_double(),
                                             dpcapacity = col_integer(), landmark = col_integer())
                         )

# Import station data from "Divvy_Stations_2016_Q1Q2.csv" to "Divvy_Stations_2016_Q4.csv"
station_2016_q4 <- read_csv("Divvy_Stations_2016_Q4.csv",
                              skip =1,
                              col_names = c('id','name','latitude','longitude','dpcapacity','online_date'),
                              col_types=cols(id = col_integer(), name = col_character(), latitude = col_double(), longitude = col_double(),
                                             dpcapacity = col_integer(), online_date = col_date(format = '%m/%d/%Y'))
                              )

# Import station data from "Divvy_Stations_2017_Q1Q2.csv"
station_2017_q1q2 <- read_csv("Divvy_Stations_2017_Q1Q2.csv",
                            skip =1,
                            col_names = c('id','name','city','latitude','longitude','dpcapacity','online_date'),
                            col_types=cols(id = col_integer(), name = col_character(), city = col_character(),latitude = col_double(), longitude = col_double(),
                                           dpcapacity = col_integer(), online_date = col_date(format = '%m/%d/%Y %H:%M:%S'))
                            )

# Import station data from "Divvy_Stations_2017_Q3Q4.csv"
station_2017_q3q4 <- read_csv("Divvy_Stations_2017_Q3Q4.csv",
                              skip =1,
                              col_names = c('id','name','city','latitude','longitude','dpcapacity','online_date'),
                              col_types=cols_only(id = col_integer(), name = col_character(), city = col_character(),latitude = col_double(), longitude = col_double(),
                                             dpcapacity = col_integer(), online_date = col_date(format = '%m/%d/%Y %H:%M'))
                              )


# Trip data from trip_2020_q1 to trip_202212 and trip_2013 to trip_2019_q4 have the same data frames.
# When row-binding, columns are matched by name
trip_2020_2022 <- bind_rows(trip_2020_q1, trip_2020_04, trip_2020_05,trip_2020_06,trip_2020_07,trip_2020_08,trip_2020_09,trip_2020_10,trip_2020_11,trip_2020_12, trip_2021_01, 
                            trip_2021_02,trip_2021_03,trip_2021_04,trip_2021_05,trip_2021_06,trip_2021_07,trip_2021_08,trip_2021_09,trip_2021_10,trip_2021_11,trip_2021_12, 
                            trip_2022_01, trip_2022_02,trip_2022_03,trip_2022_04,trip_2022_05,trip_2022_06,trip_2022_07,trip_2022_08,trip_2022_09,trip_2022_10,trip_2022_11,trip_2022_12)

trip_2013_2019 <- bind_rows(trip_2013, trip_2014_q1q2, trip_2014_q3_07, trip_2014_q3_0809, trip_2014_q4, trip_2015_07, trip_2015_08, trip_2015_09, trip_2015_q1, trip_2015_q2,
                            trip_2015_q4, trip_2016_q1, trip_2016_04, trip_2016_05, trip_2016_06, trip_2016_q3, trip_2016_q4, trip_2017_q1, trip_2017_q2, trip_2017_q3, trip_2017_q4,
                            trip_2018_q1, trip_2018_q2, trip_2018_q3, trip_2018_q4,trip_2019_q1, trip_2019_q2, trip_2019_q3, trip_2019_q4)

# Station data combine
station_2013_2017 <- bind_rows(station_2013,station_2014_q1q2, station_2014_q3q4, station_2015, station_2016_q1q2, station_2016_q3, station_2016_q4, station_2017_q1q2, station_2017_q3q4)

# Combine all trip data
trip_2013_2022 <- bind_rows(trip_2013_2019,trip_2020_2022)

# For data processing we focus on trip_2020_2022 or trip_2013_2019. Each file is consistent data structure to process separately.
# Data process
rm(trip_2013) # Remove data frames 
load("D:/Data Analytics/Portfolio/Case study 1/Output/casestudy_01.RData") # Loading saved dataset workspace from previous working session which was turned off
save.image("D:/Data Analytics/Portfolio/Case study 1/Output/casestudy_01.RData")
save(trip_2013_2022,station_2013_2017, file = "D:/Data Analytics/Portfolio/Case study 1/Output/trip_station.RData")

# Look data generally
glimpse(trip_2013_2022)
spec(trip_2013_2022)
str(trip_2013_2022)

# Convert data type of field  to combine with another same data frames
trip_2014_q1q2<- trip_2014_q1q2 %>% mutate(started_at = as.POSIXct(started_at,format="%m/%d/%Y %H:%M"))
trip_2014_q1q2<- trip_2014_q1q2 %>% mutate(ended_at = as.POSIXct(ended_at,format="%m/%d/%Y %H:%M"))

trip_2014_q1q2$started_at <- as.POSIXct(trip_2014_q1q2$started_at, format='%m/%d/%Y %H:%M',tz='GMT')
trip_2014_q1q2$ended_at <- as.POSIXct(trip_2014_q1q2$ended_at, format='%m/%d/%Y %H:%M',tz='GMT')
# POSIXct, which stores seconds since UNIX epoch (+some other data), and POSIXlt, which stores a list of day, month, year, hour, minute, second, etc.

trip_2014_q1q2<- trip_2014_q1q2 %>% mutate(started_at = mdy_hm(started_at))
trip_2014_q1q2<- trip_2014_q1q2 %>% mutate(ended_at = mdy_hm(ended_at))

trip_2014_q1q2$started_at <- strptime(trip_2014_q1q2$started_at, format = "%m/%d/%Y %H:%M",tz="GMT")
trip_2014_q1q2$ended_at <- strptime(trip_2014_q1q2$ended_at, format = "%m/%d/%Y %H:%M",tz="GMT")


trip_2020_q1 <- trip_2020_q1 %>% mutate(start_station_id = as.character(start_station_id),
                                        end_station_id = as.character(end_station_id ))
trip_202004 <- trip_202004 %>% mutate_at(c('start_station_id','end_station_id'), as.character)
# Delete a specific columns if we don't want to show
station_2017_q3q4<-station_2017_q3q4[, !names(station_2017_q3q4) %in% c('online_date'), drop = F]

station_2017_q3q4$X8<-NULL

station_2017_q3q4<- station_2017_q3q4 %>% select(-online_date)

# Replace values "Subscriber", "Customer" into "Member", "Casual" in column member_casual to synchronize
trip_2013_2022$member_casual[tolower(trip_2013_2022$member_casual) == 'subscriber'] <- 'member'
trip_2013_2022$member_casual[tolower(trip_2013_2022$member_casual) == 'customer'] <- 'casual'

trip_2013_2022 <- trip_2013_2022 %>% mutate(member_casual = if_else(tolower(member_casual) =='subscriber','member',
                                                                    if_else(tolower(member_casual) =='customer'),'casual',member_casual))

trip_2013_2022 <- trip_2013_2022 %>% mutate(member_casual = recode(member_casual, 'Subscriber' = 'member', 'Customer'='casual'))

trip_2013_2022 <- trip_2013_2022 %>% mutate(member_casual = replace(member_casual, tolower(member_casual) =='subscriber', 'member'))
trip_2013_2022 <- trip_2013_2022 %>% mutate(member_casual = replace(member_casual, tolower(member_casual) =='customer', 'casual'))

trip_2013_2022 <- trip_2013_2022 %>% mutate(member_casual = case_when(tolower(member_casual) =='subscriber'~'member',
                                                                      tolower(member_casual) =='customer'~'casual', TRUE ~ member_casual))

# Create new calculated column ride_length by difference of ended_at and started_at
trip_2013_2022 <- trip_2013_2022 %>% mutate(ride_length = difftime(ended_at, started_at, units = 'secs'))

# Create new calculated column day_of_week of started_at, the first day is Sunday
trip_2013_2022 <- trip_2013_2022 %>% mutate(day_of_week = wday(started_at, week_start = 7, label = FALSE))

# Create new calculated column day_of_week of started_at, the first day is Monday
trip_2013_2022 <- trip_2013_2022 %>% mutate(day_of_week <- format(as.Date(started_at),'%u'))

# Data cleaning
# Check and remove nulls in rows
trip_2013_2022_clean <- trip_2013_2022[!(is.na(trip_2013_2022$ride_id) | is.na(trip_2013_2022.member_casual) |
                                                 is.na(trip_2013_2022.started_at) | is.na(trip_2013_2022.ended_at)),]

trip_2013_2022_clean <- trip_2013_2022[complete.cases(trip_2013_2022[,c('ride_id', 'member_casual', 'started_at', 'ended_at')]),]

trip_2013_2022_clean <- trip_2013_2022 %>% drop_na(c('ride_id', 'member_casual', 'started_at', 'ended_at'))

trip_2013_2022_clean <- trip_2013_2022_clean %>% filter(!(is.na(ride_id) | is.na(member_casual) | is.na(started_at) | is.na(ended_at)))

trip_2013_2022_check <- trip_2013_2022_clean %>% filter(is.na(ride_id) | is.na(member_casual) | is.na(started_at) | is.na(ended_at))

# Check ride_id duplicated or not
trip_2013_2022_clean <- trip_2013_2022[!duplicated(trip_2013_2022$ride_id),]

trip_2013_2022_clean <- trip_2013_2022 %>% distinct(ride_id, .keep_all = TRUE)

trip_2013_2022_clean <- trip_2013_2022 %>% group_by(ride_id) %>% slice_max(started_at) %>% ungroup()

trip_2013_2022_clean <- trip_2013_2022 %>% group_by(ride_id) %>% filter(n()==1)

trip_2013_2022_check <- trip_2013_2022_clean %>% group_by(ride_id) %>% filter(n()>1)
trip_2013_2022_check <- trip_2013_2022_clean[duplicated(trip_2013_2022_clean$ride_id),]
trip_2013_2022_check <- trip_2013_2022_clean %>% filter(duplicated(trip_2013_2022_clean$ride_id))

# Member_casual field have only 2 distinct values
unique(trip_2013_2022_clean$member_casual)
trip_2013_2022_clean %>% distinct(member_casual)
trip_2013_2022_clean %>% filter(member_casual == 'Dependent')

trip_2013_2022_clean <- trip_2013_2022_clean %>% subset(!(member_casual == 'Dependent')) # including NA and NaN
trip_2013_2022_clean <- trip_2013_2022_clean %>% subset(member_casual == 'member' | member_casual == 'casual') #not including NA and NaN

unique(trip_2013_2022_clean$member_casual)

# Check and remove bad data where ride_length <=0
trip_2013_2022_clean <- trip_2013_2022_clean %>% subset(!(ride_length<=0))
trip_2013_2022_clean <- trip_2013_2022_clean %>% subset(!(ended_at<=started_at))

trip_2013_2022_clean <- trip_2013_2022_clean[!(trip_2013_2022_clean$ride_length<=0),]

trip_2013_2022_clean <- trip_2013_2022_clean %>% filter(!(ended_at<=started_at))

trip_2013_2022_check <- trip_2013_2022_clean %>% filter(!(ride_length >0))
trip_2013_2022_check <- trip_2013_2022_clean[!(trip_2013_2022_clean$ended_at>trip_2013_2022_clean$started_at),]
trip_2013_2022_check <- trip_2013_2022_clean %>% filter(!(ride_length>0))

# Latitudes should be between -90 to 90 and longitudes should be between -180 to 180.
trip_2013_2022_clean1 <- trip_2013_2022_clean %>% filter(!(start_lat %in% c(-90:90)))

trip_2013_2022_check <- trip_2013_2022_clean %>% subset(!(between(start_lat,-90,90) & between(start_lng,-180,180) & between(end_lat,-90,90) & between(end_lng,-180,180)))

