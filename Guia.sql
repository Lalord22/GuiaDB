CREATE DATABASE Guia;

USE Guia;

create table Usuario (
  cedula varchar(10) not null,
  clave varchar(10) not null,
  tipo integer not null,
  Primary key(cedula)
);

create table Cliente (
  cedula varchar(10) not null,
  nombre varchar(30) not null,
  telefono varchar(8),
  correo varchar(50),
  datosTarjeta varchar(16) not null,
  usuario varchar(10) not null,
  Primary key(cedula)
);

CREATE TABLE Marca (
  id INTEGER NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

create table Modelo (
id integer auto_increment not null,
descripcion varchar(30) not null,
marca integer not null, 
Primary key(id)
);

create table Categoria (
id integer auto_increment not null,
descripcion varchar(50) not null,
Primary key(id)
);

create table Cobertura (
  id integer auto_increment not null,
  descripcion varchar(50),
  costoMinimo double not null,
  costoPorcentual double not null,
  categoria integer,
  Primary key(id)
);

create table Poliza (
  id integer auto_increment not null,
  numeroPlaca varchar(8) not null,
  anno varchar(4) not null,
  valorAsegurado double not null,
  plazoPago varchar(10) not null,
  fechaInicio varchar(30) not null,
  modelo integer not null,
  cliente varchar(10) not null,
  Primary key(id)
);

create table Poliza_Cobertura (
poliza integer not null,
cobertura integer not null,
Primary key(poliza, cobertura)
);

alter table Cliente add foreign key (usuario) references Usuario(cedula);
alter table Poliza add foreign key (cliente) references Cliente(cedula);
alter table Modelo add foreign key (marca) references Marca(id);
alter table Poliza add foreign key (modelo) references Modelo(id);
alter table Cobertura add foreign key (categoria) references Categoria(id);
alter table Poliza_Cobertura add foreign key (poliza) references Poliza(id);
alter table Poliza_Cobertura add foreign key (cobertura) references Cobertura(id);

insert into Usuario (cedula,clave,tipo) 
	values ("111","111",1);

insert into Usuario (cedula,clave,tipo) 
	values ("222","222",1);

insert into Usuario (cedula,clave,tipo) 
	values ("333","333",2);	

insert into Cliente (cedula,nombre,telefono,correo,datosTarjeta,usuario) 
	values ("111","J.Perez","85964712","111@gmail.com","111",'111');	

insert into Cliente (cedula,nombre,telefono,correo,datosTarjeta,usuario) 
	values ("222","B.Banner","89547454","222@gmail.com","222",'222');	

insert into Marca (descripcion) values ("Mercedes-Benz");
insert into Marca (descripcion) values ("JEEP");

insert into Modelo (descripcion, marca) values ("Clase G", 1);
insert into Modelo (descripcion, marca) values ("4X4", 2);

insert into Categoria (descripcion) values ("Básica");
insert into Categoria (descripcion) values ("Premium");

insert into Cobertura (descripcion, costoMinimo, costoPorcentual, categoria)
values ("Daños a terceros", 50.0, 0.0, 1);
insert into Cobertura (descripcion, costoMinimo, costoPorcentual, categoria)
values ("Robo", 100.0, 0.05, 2);

insert into Poliza (numeroPlaca, anno, valorAsegurado, plazoPago, fechaInicio, modelo, cliente)
values ("DMM-027", "2022", "10000", "Anual", "2023-04-18", 1, "111");

insert into Poliza_Cobertura (poliza, cobertura) values (1, 1);
insert into Poliza_Cobertura (poliza, cobertura) values (1, 2);

insert into Poliza (numeroPlaca, anno, valorAsegurado, plazoPago, fechaInicio, modelo, cliente)
VALUES ("DMM-023", "2017", "20000", "Anual", "2023-04-18", 1, "111");

insert into Poliza_Cobertura (poliza, cobertura) values (2, 1);
insert into Poliza (numeroPlaca, anno, valorAsegurado, plazoPago, fechaInicio, modelo, cliente)
VALUES ("JLV-015", "2022", "10000", "Anual", "2023-04-18", 2, "222");

insert into Poliza_Cobertura (poliza, cobertura) values (3, 2);


