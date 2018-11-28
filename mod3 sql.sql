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

select * from mod3.travelerState
select * from mod3.travelerCity
select * from mod3.travelerAccomodation


create proc mod3.uspAddTravelerDetails(@travelerName varchar(30), @travelerCID date, @travelerCOD date, @travelerStateId int, @travelerCityId int, @travelerAddress varchar(100))
as
begin
insert into mod3.travelerAccomodation values (@travelerName, @travelerCID, @travelerCOD, @travelerStateId, @travelerCityId, @travelerAddress)
end
go


create proc mod3.uspDeleteTravelerDetails(@travelerID int)
as
begin
delete from mod3.travelerAccomodation where travelerID=@travelerID
end
go


create proc mod3.uspUpdateTravelerDetails(@travelerID int, @travelerName varchar(30), @travelerCID date, @travelerCOD date, @travelerStateId int, @travelerCityId int, @travelerAddress varchar(100)) 
as
begin
update mod3.travelerAccomodation
set travelerName=@travelerName, travelerCID=@travelerCID, travelerCOD=@travelerCOD, travelerStateId=@travelerStateId, travelerCityId=@travelerCityId, travelerAddress=@travelerAddress
end
go


create proc.uspShowTravelerDetailsByID(@travelerID int)
as
begin
select * from mod3.travelerAccomodation where travelerID=@travelerID
end
go


create proc.uspShowAllTravelerDetails(@travelerID int)
as
begin
select * from mod3.travelerAccomodation
end
go