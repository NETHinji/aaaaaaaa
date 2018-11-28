create schema mod3


create table mod3.travelerState
(
stateId int primary key,
stateName varchar(20)
)

create table mod3.travelerCity
(
CityId int primary key,
CityName varchar(20),
StateId int foreign key references mod3.travelerState(stateId)
)


create table mod3.travelerAccomodation
(
travelerID int identity(101,1),
travelerName varchar(30),
travelerCID date,
travelerCOD date,
travelerStateId int foreign key references mod3.travelerState(stateId),
travelerCityId int foreign key references mod3.travelerCity(cityId),
travelerAddress varchar(100)
)
