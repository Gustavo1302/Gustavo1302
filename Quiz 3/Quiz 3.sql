select * from [dbo].['Ventas Videojuegos$'_xlnm#_FilterDatabase]

select Region,Ventas  
from [dbo].['Ventas Videojuegos$'_xlnm#_FilterDatabase]
UNPIVOT (Ventas for Region in ([Ventas NA],[Ventas EU],[Ventas JP],[Ventas Otros])) as Tabla

select [Nombre],Region,Ventas,[Plataforma],[Año],[Genero],[Editorial]  
from [dbo].['Ventas Videojuegos$'_xlnm#_FilterDatabase]
UNPIVOT (Ventas for Region in ([Ventas NA],[Ventas EU],[Ventas JP],[Ventas Otros])) as Tabla
