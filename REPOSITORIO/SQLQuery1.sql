--1
select FirstName,LastName
from[Person].[Person]
where FirstName='Mark'
--2
select COUNT(*) as 'total' from [Person].[Person]
--3
select top 100* from Production.Product 
where ListPrice <> 0
--4
select * from [HumanResources].[vEmployee]
where [LastName]like'[a-d]%'
--5
select avg(StandardCost) as 'Promedio'  from [Production].[Product]
where [StandardCost] >0.00
--6
select COUNT(PersonType) as 'Numero de personas asociadas' from [Person].[Person]
--7
select * from [Person].[StateProvince]
where [CountryRegionCode] ='CA'
--8
select COUNT (Color) as 'Candtidad de colores Red y Black' from  [Production].[Product]
where [Color] = 'Red' and [Color] =  'Red'
--9 
select AVG(Freight) as 'ValorPromedio' from [Sales].[SalesOrderHeader] where TerritoryID = 4 
--10 
select FirstName, LastName from [Sales].[vIndividualCustomer]
where [LastName] = 'Lopez'or [LastName] = 'Martin' or [LastName] = 'Wood' and [FirstName] like 'C%' and [FirstName] like 'D%' 
and [FirstName] like 'E%' and [FirstName] like 'F%' and [FirstName] like 'G%' and [FirstName] like 'H%' and [FirstName] like 'I%' 
and [FirstName] like 'J%' and [FirstName] like 'K%' and [FirstName] like 'L%'
--11
select FirstName, LastName as 'Apellidos' from [Sales].[vIndividualCustomer]
where LastName = 'Smith'
--12 
select EmailPromotion,[PhoneNumber],[CountryRegionName]  from [Sales].[vIndividualCustomer]
where [CountryRegionName] = 'Astraulia' or [PhoneNumber] = '0' or EmailPromotion = '0'

--13
select max (ListPrice) as 'El producto mas costoso' from [Production].[Product]
--14
select TotalDue,[TerritoryID] from [Sales].[SalesOrderHeader]
where [TotalDue] > 10000.0000
--15
select Name as territorio, count(SalesOrderNumber) as Cantidad_Ventas, SUM(TotalDue) AS Total_vendido 
from Sales.SalesOrderHeader join Sales.SalesTerritory on Sales.SalesOrderHeader.TerritoryID  = Sales.SalesTerritory.TerritoryID
group by Name 
having sum(TotalDue) >10000000

--16
select [FirstName],[LastName],[Department]  from [HumanResources].[vEmployeeDepartment]
where [Department] = 'Engineering' or [Department] = 'Executive' or [Department] = 'Tool Design'


--17
--Forma 1
select [FirstName],[LastName],[StartDate] from HumanResources.vEmployeeDepartment
where [StartDate] between '2000/07/01' and '2002/06/30'
--Forma 2
SELECT [FirstName],[LastName],[StartDate] from HumanResources.vEmployeeDepartment
WHERE  (([StartDate] >= '2000/07/01') AND ([StartDate] <= '2002/06/30'))
--18
select (SalesPersonID) from Sales.SalesOrderHeader
where SalesPersonID is not null
--19
select count (MiddleName) as 'Cantidad' from Person.Person where MiddleName is not null
--20
select SalesPersonID, TotalDue from Sales.SalesOrderHeader 
where [SalesPersonID] is not null and [TotalDue] >70000.0000
--21 
select [LastName] from Sales.vIndividualCustomer where [LastName] like 'R%'
--22
select [LastName] from Sales.vIndividualCustomer where [LastName] like '%R'
--23
select Color, COUNT(*) as 'total'
from [Production].[Product]
where Color is not null
group by Color
having count(Color)>=20
--24
select sum (ListPrice) as 'Cantidad de ventas'  from Production.Product a 
inner join Production.ProductInventory b on a.ProductID = b.ProductID where [ListPrice] >0
--25
select FirstName, LastName, EmailPromotion, 
Case 
when EmailPromotion = 0 then 'Promo 1'
when EmailPromotion = 1 then 'Promo 2'
when EmailPromotion = 2 then 'Promo 3'
ELSE 'No se puede determinar promo' 
END [Promos]
from Person.Person 
--26
select BusinessEntityID, Sales.SalesPerson.SalesYTD ,Name
from Sales.SalesPerson  left join Sales.SalesTerritory 
on Sales.SalesPerson.TerritoryID  = Sales.SalesTerritory.TerritoryID 
--27
select FirstName, LastName, Sales.SalesPerson.SalesYTD ,Name
from Sales.SalesPerson  left join Sales.SalesTerritory 
on Sales.SalesPerson.TerritoryID  = Sales.SalesTerritory.TerritoryID 
left join Person.Person 
on Sales.SalesPerson.BusinessEntityID = Person.Person.BusinessEntityID 
where Name='Northeast' or Name= 'Central' 
--28
select FirstName, LastName, PasswordHash from Person.Person a 
inner join Person.Password b 
on a.BusinessEntityID = b.BusinessEntityID 
--29
select isnull (title,'No hay título') as Titulos from Person.Person 
--30
Select firstName + ' ' + coalesce(MiddleName,'') +' '+ LastName AS 'Nombre' 
from Person.Person
--31
Select  Name,ProductNumber,MakeFlag,FinishedGoodsFlag, 
case when Makeflag = FinishedGoodsFlag then null 
else 'Distintas' end as result 
from Production.Product
--32
--Forma 1
Select COALESCE(color,'Sin color')  as Color 
from Production.Product
--Forma 2 	
Select 
case
when Color is null then 'Sin color'
else color end as color  from Production.Product
--33
select FirstName,LastName, PasswordHash 
from Person.Person inner join Person.Password 
on Person.BusinessEntityID = Password.BusinessEntityID


