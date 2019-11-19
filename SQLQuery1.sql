Go 

-- Creación de la tabla Especialidad
Create Table Especialidad(
IDEspecialidad int Identity Primary Key Not Null,
TipoEspecialidad Varchar(20)
)
Go

-- Creación de la tabla Ingeniero
Create Table Ingeniero (
Cedula int Not Null,
Nombre Varchar(20) Not Null,
Apellido1 Varchar(20) Not Null,
Apellido2 Varchar(20) Not Null,
IDEspecialidad int Not Null,
Telefono int Not Null,
Codigo int Primary Key Not Null
)
Go

-- Creación de la tabla Cliente
Create Table Cliente (
Cedula int Primary Key Not Null,
Nombre Varchar(20) Not Null,
Apellido1 Varchar(20) Not Null,
Apellido2 Varchar(20) Not Null,
Telefono int Not Null
)
Go

-- Creación de la tabla Empleado
Create Table Empleado (
Cedula int Primary Key Not Null,
Nombre Varchar(20) Not Null,
Apellido1 Varchar(20) Not Null,
Apellido2 Varchar(20) Not Null,
Telefono int Not Null,
PagoHora int Not Null
--HorasLaboradas int Not Null
)
Go

-- Creación de la tabla Material
Create Table Material (
Codigo int Primary Key Not Null,
Nombre Varchar(30) Not Null,
PrecioUnitario int Not Null
)
Go

-- Creación de la tabla Etapa
Create Table Etapa (
IDEtapa int Identity Primary Key Not Null,
IDObra int not null,
Descripcion Varchar(200) Not Null,
TrabajoPreliminar int,
Cimiento int,
Paredes int,
ConcretoReforzado int,
Techos int,
Cielos int,
Repello int,
Entrepisos int,
Pisos int,
Enchapes int,
InstalacionPluvial int,
InstalacionSanitaria int,
InstalacionElectrica int,
Puertas int,
Cerrajeria int,
Ventanas int,
Closets int,
MuebleCocina int,
Pintura int,
Escaleras int
)
Go

-- Creación de la tabla Ubicacion
Create Table Ubicacion(
IDUbicacion int Identity Primary Key Not Null,
Provincia Varchar(20) Not Null,
Canton Varchar(20) Not Null,
Distrito Varchar(50) Not Null
)
Go

-- Creación de la tabla Obra
Create Table Obra (
IDObra int Identity Primary Key Not Null,
Nombre Varchar(30) Not Null,
IDUbicacion int Not Null,
Habitaciones int Not Null,
Baños int Not Null,
Pisos int Not Null,
MetrosCuadradosConstruccion int Not Null,
MetrosCuadradosLote int Not Null,
IDIngeniero1 int Not Null,
IDIngeniero2 int,
IDIngeniero3 int,
IDCliente int Not Null
)
Go

-- Creación de la tabla  ObraMateriales
Create Table ObraMateriales (
IDObraMateriales int Identity Primary Key Not Null,
IDObra int Not Null,
IDEtapa int Not Null,
IDMaterial int Not Null, 
Cantidad int
)
Go

-- Creación de la tabla EtapaProyecto
Create Table EtapaProyecto (
IDEtapaProyecto int Identity Primary Key Not Null,
IDObra int Not Null,
IDEtapa int Not Null,
FechaInicio date Not Null,
FechaFin date,
Presupuesto int
)
Go

-- Creación de la tabla EmpleadoProyecto
Create Table EmpleadoProyecto (
IDEmpleadoProyecto int Identity Primary Key Not Null,
IDEmpleado int Not Null,
IDObra int Not Null,
Horas int Not Null
)
Go

-- Creación de la tabla Gasto
Create Table Gasto (
IDGasto int Identity Primary Key Not Null,
IDObra int Not Null,
IDProveedor int,
IDFactura int,
Foto varchar(100)
)
Go

-- Creación de la tabla CompraMateriales
Create Table CompraMateriales (
IDCompraMateriales int Identity Primary Key Not Null,
Factura int,
IDMaterial int Not Null, 
Cantidad int,
TotalPrecioMaterial int
)
Go

ALTER TABLE  Ingeniero
ADD CONSTRAINT FK_Ingeniero_Especialidad FOREIGN KEY (IDEspecialidad) REFERENCES Especialidad(IDEspecialidad)

ALTER TABLE  Obra
ADD CONSTRAINT FK_Obra_Ubicacion FOREIGN KEY (IDUbicacion) REFERENCES Ubicacion(IDUbicacion),
	CONSTRAINT FK_Obra_Cliente FOREIGN KEY (IDCliente) REFERENCES Cliente(Cedula),
	CONSTRAINT FK_Obra_Ingeniero FOREIGN KEY (IDIngeniero1) REFERENCES Ingeniero(Codigo)
	--Esta puede cambiar si se decide usar el codigo en lugar de la cedula

ALTER TABLE  Etapa
ADD CONSTRAINT FK_Etapa_Obra FOREIGN KEY (IDObra) REFERENCES Obra(IDObra)


ALTER TABLE  CompraMateriales
ADD CONSTRAINT FK_CompraMateriales_Material FOREIGN KEY (IDMaterial) REFERENCES Material(Codigo)

ALTER TABLE  ObraMateriales
ADD CONSTRAINT FK_ObraMateriales_Obra FOREIGN KEY (IDObra) REFERENCES Obra(IDObra),
	CONSTRAINT FK_ObraMateriales_Etapa FOREIGN KEY (IDEtapa) REFERENCES Etapa(IDEtapa),
	CONSTRAINT FK_ObraMateriales_Material FOREIGN KEY (IDMaterial) REFERENCES Material(Codigo)

ALTER TABLE  EmpleadoProyecto
ADD CONSTRAINT FK_EmpleadoProyecto_Empleado FOREIGN KEY (IDEmpleado) REFERENCES Empleado(Cedula),
	CONSTRAINT FK_EmpleadoProyecto_Obra FOREIGN KEY (IDObra) REFERENCES Obra(IDObra)

ALTER TABLE  EtapaProyecto
ADD CONSTRAINT FK_EtapaProyecto_Obra FOREIGN KEY (IDObra) REFERENCES Obra(IDObra),
	CONSTRAINT FK_EtapaProyecto_Etapa FOREIGN KEY (IDEtapa) REFERENCES Etapa(IDEtapa)

ALTER TABLE  Gasto
ADD CONSTRAINT FK_Gasto_Obra FOREIGN KEY (IDObra) REFERENCES Obra(IDObra)


go



 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Carmen')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Catedral')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Hatillo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Hospital')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','La Uruca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Mata Redonda')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Merced')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Pavas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','San Francisco de Dos Ríos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','San Sebastián')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','San José','Zapote')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Acosta','Cangrejal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Acosta','Guaitil')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Acosta','Palmichal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Acosta','Sabanillas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Acosta','San Ignacio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Alajuelita','Alajuelita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Alajuelita','Concepción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Alajuelita','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Alajuelita','San Felipe')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Alajuelita','San Josecito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','Aserrí')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','Legua')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','Monterrey')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','Salitrillos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','San Gabriel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','Tarbaca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Aserrí','Vuelta de Jorco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Curridabat','Curridabat')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Curridabat','Granadilla')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Curridabat','Sánchez')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Curridabat','Tirrases')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Damas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Desamparados')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Frailes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Gravilias')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Los Guido')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Patarrá')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','Rosario')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','San Cristóbal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','San Juan de Dios')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','San Miguel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','San Rafael Abajo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Desamparados','San Rafael Arriba')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Dota','Copey')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Dota','Jardín')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Dota','Santa María')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Escazú','Escazú')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Escazú','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Escazú','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','Calle Blancos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','Guadalupe')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','Ipís')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','Mata de Plátano')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','Purral')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','Rancho Redondo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Goicoechea','San Francisco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','León Cortés Castro','San Pablo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','León Cortés Castro','San Andrés')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','León Cortés Castro','Llano Bonito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','León Cortés Castro','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','León Cortés Castro','Santa Cruz')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','León Cortés Castro','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Montes de Oca','Mercedes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Montes de Oca','Sabanilla')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Montes de Oca','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Montes de Oca','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Cuidad Colón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Guayabo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Jaris')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Picagres')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Quitirrisí')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Piedras Negras')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Mora','Tabarcia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Moravia','San Jerónimo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Moravia','San Vicente')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Moravia','Trinidad')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','San Isidro de El General')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Barú')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Cajón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Daniel Flores')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','El General')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','La Amistad')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Páramo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Pejibaye')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Platanares')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Río Nuevo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','Rivas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Pérez Zeledón','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Barbacoas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Candelarita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Chires')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Desamparaditos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Grifo Alto')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Mercedes Sur')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Puriscal','Santiago')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Santa Ana','Brasil')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Santa Ana','Piedades')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Santa Ana','Pozos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Santa Ana','Salitral')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Santa Ana','Santa Ana')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Santa Ana','Uruca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tarrazú','San Carlos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tarrazú','San Lorenzo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tarrazú','San Marcos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tibás','Anselmo Llorente')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tibás','Cinco Esquinas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tibás','Colima')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tibás','León XIII')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Tibás','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Turrubares','Carara')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Turrubares','San Juan de Mata')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Turrubares','San Luis')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Turrubares','San Pablo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Turrubares','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Vázquez de Coronado','Cascajal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Vázquez de Coronado','Dulce Nombre de Jesús')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Vázquez de Coronado','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Vázquez de Coronado','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('San José','Vázquez de Coronado','Patalillo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Alajuela')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Carrizal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Desamparados')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Garita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Guácima')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Río Segundo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Sabanilla')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','San José')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Sarapiquí')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Tambor')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Alajuela','Turrúcares')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','Atenas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','Concepción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','Escobal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','Jesús')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','Mercedes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','San José')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Atenas','Santa Eulalia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','Bolívar')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','Grecia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','Puente de Piedra')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','San José')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','San Roque')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Grecia','Tacares')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Guatuso','Buenavista')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Guatuso','Cote')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Guatuso','Katira')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Guatuso','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Los Chiles','Caño Negro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Los Chiles','El Amparo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Los Chiles','Los Chiles')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Los Chiles','San Jorge')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','Cirrí')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','El Rosario')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','Naranjo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','Palmitos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','San Jerónimo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','San José')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Naranjo','San Miguel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Orotina','Coyolar')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Orotina','Hacienda Vieja')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Orotina','La Ceiba')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Orotina','Mastate')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Orotina','Orotina')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','Buenos Aires')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','Candelaria')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','Esquipulas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','La Granja')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','Palamares')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','Santiago')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Palmares','Zaragoza')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Poás','Carrillos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Poás','Sabana Redonda')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Poás','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Poás','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Poás','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Río Cuarto','Río Cuarto')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Agua Zarcas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Buenavista')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Cutris')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Florencia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','La Fortuna')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','La Palmera')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','La Tigra')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Monterrey')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Pital')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Pocosol')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Quesada')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Venado')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Carlos','Venecia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Mateo','San Mateo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Mateo','Desmonte')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Mateo','Labrador')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Mateo','Jesús María')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Alfaro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Ángeles')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Concepción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Peñas Blancas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Piedades Norte')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Piedades Sur')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','San Ramón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Santiago')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Volio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','San Ramón','Zapotal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Aguas Claras')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Canalete')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Bijagua')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Delicias')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Dos Ríos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','San José')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Upala')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Upala','Yolillal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Sarchí','Rodríguez')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Sarchí','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Sarchí','Sarchí Norte')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Sarchí','Sarchí Sur')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Sarchí','Toro Amarillo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Brisas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Guadalupe')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Laguna')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Palmira')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Tapezco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Zapote')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Alajuela','Zarcero','Zarcero')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Agua Caliente')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Carmen')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Corralillo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Dulce Nombre')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Guadalupe')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Llano Grande')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Occidental')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Oriental')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Quebradilla')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','San Nicolás')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Cartago','Tierra Blanca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Alvarado','Pacayas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Alvarado','Cervantes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Alvarado','Capellades')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','El Guarco','El Tejar')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','El Guarco','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','El Guarco','Tobosi')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','El Guarco','Patio de Agua')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Jiménez','Juan Viñas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Jiménez','Tucurrique')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Jiménez','Pejibaye')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','Tres Ríos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','San Diego')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','Concepción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','Dulce Nombre')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','San Ramón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','La Unión','Río Azul')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Paraíso','Paraíso')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Paraíso','Santiago')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Paraíso','Orosi')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Paraíso','Cachí')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Paraíso','Llanos de Santa Lucía')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Turrialba')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','La Suiza')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Peralta')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Santa Cruz')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Santa Teresita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Pavones')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Tuis')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Tayutic')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Santa Rosa')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Tres Equis')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','La Isabel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Turrialba','Chirripó')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Oreamuno','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Oreamuno','Cot')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Oreamuno','Potrero Cerrado')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Oreamuno','Cipreses')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Cartago','Oreamuno','Santa Rosa')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Heredia','Heredia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Heredia','Mercedes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Heredia','San Francisco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Heredia','Ulloa')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Heredia','Vara Blanca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Barva','Barva')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Barva','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Barva','San Pablo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Barva','San Roque')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Barva','Santa Lucía')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Barva','San José de la Montaña')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','Santo Domingo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','San Vicente')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','San Miguel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','Paracito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','Santo Tomás')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','Santa Rosa')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','Tures')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santo Domingo','Pará')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santa Bárbara','Santa Bárbara')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santa Bárbara','San Pedro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santa Bárbara','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santa Bárbara','Jesús')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santa Bárbara','Santo Domingo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Santa Bárbara','Purabá')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Rafael','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Rafael','San Josecito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Rafael','Santiago')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Rafael','Ángeles')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Rafael','Concepción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Isidro','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Isidro','San José')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Isidro','Concepción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Isidro','San Francisco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Belén','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Belén','La Ribera')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Belén','La Asunción')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Flores','San Joaquín')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Flores','Barrantes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Flores','Llorente')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Pablo','San Pablo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','San Pablo','Rincón de Sabanilla')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Sarapiquí','Puerto Viejo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Sarapiquí','La Virgen')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Sarapiquí','Horquetas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Sarapiquí','Llanuras del Gaspar')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Heredia','Sarapiquí','Cureña')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Liberia','Liberia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Liberia','Cañas Dulces')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Liberia','Mayorga')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Liberia','Nacascolo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Liberia','Curubandé')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','Nicoya')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','Mansión')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','San Antonio')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','Quebrada Honda')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','Sámara')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','Nosara')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nicoya','Belén de Nosarita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Santa Cruz')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Bolsón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Veintisiete de Abril')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Tempate')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Cartagena')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Cuajiniquil')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Diriá')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Cabo Velas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Santa Cruz','Tamarindo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Bagaces','Bagaces')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Bagaces','La Fortuna')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Bagaces','Mogote')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Bagaces','Río Naranjo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Carrillo','Filadelfia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Carrillo','Palmira')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Carrillo','Saldinal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Carrillo','Belén')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Cañas','Cañas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Cañas','Palmira')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Cañas','San Miguel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Cañas','Bebedero')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Cañas','Porozal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Abangares','Las Juntas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Abangares','Sierra')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Abangares','San Juan')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Abangares','Colorado')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Tilarán')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Quedrada Grande')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Tronadora')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Santa Rosa')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Libano')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Tierras Morenas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Tilarán','Arenal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nandayure','Carmona')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nandayure','Santa Rita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nandayure','Zapotal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nandayure','San Pablo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nandayure','Porvenir')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Nandayure','Bejuco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','La Cruz','La Cruz')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','La Cruz','Santa Cecilia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','La Cruz','La Garita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','La Cruz','Santa Elena')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Hojancha','Hojancha')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Hojancha','Monte Romo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Hojancha','Puerto Carillo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Hojancha','Huacas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Guanacaste','Hojancha','Matambú')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Puntarenas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Lepanto')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Pitahaya')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Chomes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Paquera')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Manzanillo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Guacimal')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Barranca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Monteverde')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Isla del Coco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Cóbano')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Chacarita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Chira')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Acapulco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','El Roble')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Puntarenas','Arancibia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Esparza','Espíritu Santo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Esparza','San Juan Grande')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Esparza','Macacona')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Esparza','San Rafael')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Esparza','San Jerónimo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Esparza','Caldera')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Buenos Aires')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Volcán')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Potrero Grande')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Boruca')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Pilas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Colinas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Chánguena')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Biolley')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Buenos Aires','Brunka')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Montes de Oro','Miramar')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Montes de Oro','La Unión')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Montes de Oro','San Isidro')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Osa','Cuidad Cortés')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Osa','Palmar')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Osa','Sierpe')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Osa','Bahía Ballena')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Osa','Piedras Blancas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Osa','Bahía Drake')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Quepos','Quepos')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Quepos','Savagre')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Quepos','Naranjito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Golfito','Golfito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Golfito','Puerto Jiménez')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Golfito','Guaycará')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Golfito','Pavón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Coto Brus','San Vito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Coto Brus','Sabalito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Coto Brus','Aguabuena')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Coto Brus','Limoncito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Coto Brus','Pittier')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Coto Brus','Gutiérrez Brown')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Parrita','Parrita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Corredores','Corredor')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Corredores','La Cuesta')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Corredores','Paso Canoas')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Corredores','Laurel')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Garabito','Jacó')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Puntarenas','Garabito','Tárcoles')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Limón','Limón')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Limón','Valle La Estrella')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Limón','Río Blanco')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Limón','Matama')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','Guápiles')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','Jiménez')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','La Rita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','Roxana')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','Cariari')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','Colorado')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Pococí','La Colonia')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Siquirres','Siquirres')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Siquirres','Pacuarito')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Siquirres','Florida')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Siquirres','Germania')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Siquirres','Cairo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Siquirres','Alegría')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Talamanca','Bratsi')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Talamanca','Sixaola')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Talamanca','Cahuita')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Talamanca','Telire')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Matina','Matina')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Matina','Batán')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Matina','Carrandi')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Guácimo','Guácimo')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Guácimo','Mercedes')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Guácimo','Pocora')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Guácimo','Río Jiménez')
 INSERT INTO [dbo].[Ubicacion]([Provincia],[Canton],[Distrito]) VALUES('Limón','Guácimo','Duacarí')

GO

DBCC CHECKIDENT ('Ubicacion')  
DELETE FROM Ubicacion WHERE IDUbicacion=484  
DBCC CHECKIDENT ('Ubicacion', RESEED,482 )  
 
SELECT * FROM Ubicacion