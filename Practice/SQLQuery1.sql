--create view vw_getStudentsByAge
--as
--select * from Students where [Age] > 25

--select * from vw_getStudentsByAge

--create view vw_joinStudentDatas
--as
--select st.Fullname as 'Student', ct.Name as 'City', co.Name as 'Country' from Students st
--join Cities ct
--on st.CityId = ct.Id
--join Countries co
--on co.CountryId = co.Id


--select * from vw_joinStudentDatas

--create table Employees1(
--	[Id] int primary key identity(1,1),
--	[Name] nvarchar(50),
--	[Surname] nvarchar(50),
--	[Email] nvarchar(50),
--	[Age] int
--)

--insert into Employees1([Name],[Surname],[Email],[Age])
--values('Semed','Huseynov','semed@mail.ru',27),
--	  ('Agshin','Valiyev','agshin@mail.ru',26),
--	  ('Ilham','Abasli','ilham@mail.ru',20),
--	  ('Elnur','Sefiyev','elnur@mail.ru',19)


--create function dbo.showWord()
--returns nvarchar(50)
--as
--begin
--  return 'P418'
--end


--declare @result nvarchar(50) = (select dbo.showWord())

--print @result


--create function dbo.showWordWithParametr(@text nvarchar(50))
--returns nvarchar(50)
--as
--begin
--  return @text
--end


--select dbo.showWordWithParametr('Agshin bey') as 'Name'



--create function dbo.getStudentsAvgAgesByIds(@id int)
--returns int
--as
--begin
--   return (select AVG(Age) from Students where [Id] > @id)
--end


--select dbo.getStudentsAvgAgesByIds(3)


--declare @avgAge int = (select dbo.getStudentsAvgAgesByIds(3))

--select * from getStudentsByCondition(@avgAge)

--create function dbo.getStudentsByCondition(@avgAge int)
--returns table
--as
--return (select * from Students where [Age] > @avgAge)



create procedure usp_showText
as
print 'Salam'



exec usp_showText


create procedure usp_showTextWithParametr
@text nvarchar(50)
as
print @text

exec usp_showTextWithParametr 'Azerbaycan'


select * from Employees

create procedure usp_deleteEmployeeById
@id int
as
delete from Employees where [Id] = @id


exec usp_deleteEmployeeById 3


--create procedure usp_createEmployee
--@name nvarchar(50),
--@surname nvarchar(50),
--@email nvarchar(50)
--as
--begin
--	insert into Employees([Name],[Surname],[Email])
--	values(@name,@surname,@email)
--end

exec usp_createEmployee 'Tofiq','Nesibli','tofiq@mail.ru'


create function dbo.getEmployeesAvgAges()
returns int
as
begin
   return (select AVG(Age) from Employees1)
end


create procedure usp_deleteEmployeesByAge
as
begin

	declare @avgAge int = (select dbo.getEmployeesAvgAges())
	delete from Employees1 where [Age] > @avgAge

end

select * from Employees1


exec usp_deleteEmployeesByAge