CREATE DATABASE DB_Arkadia;
USE DB_Arkadia;
CREATE TABLE Tbl_Categorias(
Id_Categoria int AUTO_INCREMENT primary key,
Nombre_Categoria varchar (100) not null,
Descripcion varchar(1000)
);
CREATE TABLE Tbl_Productos(
Id_Producto int AUTO_INCREMENT primary key,
Id_Categoria int,
Nombre_Producto varchar (100) not null,
Descripcion varchar(1000),
Precio Int default (0),
Stock Int default (0),
Imagen binary,
FOREIGN KEY (Id_Categoria) REFERENCES Tbl_Categorias(Id_Categoria)
);
CREATE TABLE Tbl_Rol(
Id_Rol int AUTO_INCREMENT primary key,
Nombre_Rol varchar (100) not null
);
CREATE TABLE Tbl_Usuarios(
Id_Usuario int AUTO_INCREMENT primary key,
Id_Rol int,
Email nvarchar(500) not null,
Password nvarchar (500) not null,
Username varchar(500) not null,
Nombre varchar(500) not null,
Apellido varchar(500) not null,
Direccion varchar(500) not null,
Telefono varchar (500) not null,
Fecha_Nacimiento Date not null,
FOREIGN KEY (Id_Rol) REFERENCES Tbl_Rol(Id_Rol)
);
CREATE TABLE Tbl_Cuenta(
Id_Cuenta int AUTO_INCREMENT primary key,
Id_Usuario int,
Cantidad_Puntos int,
FOREIGN KEY (Id_Usuario) REFERENCES Tbl_Usuarios(Id_Usuario)
);
CREATE TABLE Tbl_Contactenos(
Id int AUTO_INCREMENT primary key,
Email nvarchar(500) not null,
Mensaje nvarchar(4000) not null,
Atendido Bit default(0),
FOREIGN KEY (Id_Usuario) REFERENCES Tbl_Usuarios(Id_Usuario)
);
CREATE TABLE Tbl_Ventas(
Id_Venta bigint AUTO_INCREMENT primary key,
Id_Usuario int,
Comprobante_venta varchar(100),
Fecha_Venta datetime not null,
Total_venta int,
FOREIGN KEY (Id_Usuario) REFERENCES Tbl_Usuarios(Id_Usuario)
);
CREATE TABLE Tbl_Detalle_Venta(
Id_Detalle bigint AUTO_INCREMENT primary key,
Id_Venta Bigint,
id_Producto int,
Cantidad INT,
Descuento float,
Valor_descuento int,
Monto float,
FOREIGN KEY (Id_Venta) REFERENCES Tbl_Ventas(Id_Venta),
FOREIGN KEY (id_Producto) REFERENCES Tbl_Productos(id_Producto)
);

