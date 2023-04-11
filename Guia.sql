CREATE DATABASE Guia;

USE Guia;

create table Usuario (
  cedula varchar(10) not null,
  clave varchar(10),
  tipo integer,
  Primary key(cedula)
);

create table Cliente (
  cedula varchar(10) not null,
  nombre varchar(30),
  telefono varchar(8),
  correo varchar(50),
  datosTarjeta varchar(16),
  usuario varchar(10),
  Primary key(cedula)
);

create table Poliza (
  numeroPlaca varchar(8) not null,
  marcaModelo varchar(30),
  anno varchar(4),
  valorAsegurado double,
  plazoPago varchar(10),
  fechaInicio varchar(30),
  cobertura integer,
  cliente varchar(10),
  Primary key(numeroPlaca)
);

alter table Cliente add foreign key (usuario) references Usuario(cedula);
alter table Poliza add foreign key (cliente) references Cliente(cedula);

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

insert into Poliza (numeroPlaca,marcaModelo,anno,valorAsegurado,plazoPago,fechaInicio,cobertura,cliente) 
	values ("DMM-027","Mercedes-Benz Clase G","2022",10000, "Anual","11-04-2023",1,'111');	
insert into Poliza (numeroPlaca,marcaModelo,anno,valorAsegurado,plazoPago,fechaInicio,cobertura,cliente) 
	values ("DMM-023","Mercedes-Benz Clase G","2017",20000, "Anual","11-04-2023",1,'111');		

insert into Poliza (numeroPlaca,marcaModelo,anno,valorAsegurado,plazoPago,fechaInicio,cobertura,cliente) 
	values ("JLV-015","JEEP 4X4","2022",10000, "Anual","11-04-2023",1,'222');	
