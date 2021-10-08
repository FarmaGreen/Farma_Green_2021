CREATE DATABASE FarmaGreen2;
	use FarmaGreen2;

CREATE TABLE cliente (
	idCliente int not null,
	tipoDeDocumento varchar (100) not null,
	nombres varchar(100) not null,
	apellidos varchar(100) not null,
	direccion varchar(100) not null,
	telefono varchar(100) not null,
	correo varchar(100) not null,
	primary key(idCliente)
);

CREATE TABLE producto (
	idProducto int(10) not null,
	nombreProducto varchar (100) not null,
	descripcion varchar(100) not null,
	imagen varchar(100) not null,
	marca varchar(100) not null,
	documentoInvima varchar(100) not null,
	valorUnitario varchar(100) not null,
	iva int not null,
	primary key(idProducto)
);

CREATE TABLE ventas (
	idVentas int(10) not null,
	nombreProducto varchar (100) not null,
	cantidad int not null,
	valorTotal int not null,
	fecha DATE not null,
	Empleado_idEmpleado int not null,
	Cliente_idCliente int not null,
	primary key(idVentas, Empleado_idEmpleado, Cliente_idCliente)
);

CREATE TABLE Ventas_has_Producto (
	Ventas_idVentas int(10) not null,
	Productos_idproducto int(10) not null,
	cantidadVendidas int(10) not null,
	SubValor varchar(100) not null,
	ivaProducto varchar(100) not null,
	primary key(Ventas_idVentas, Productos_idproducto)
);



CREATE TABLE empleado (
	idEmpleado int(10) not null,
	tipoDeDocumento varchar (100) not null,
	nombres varchar(100) not null,
	apellidos varchar(100) not null,
	direccion varchar(100) not null,
	telefono varchar(100) not null,
	correo varchar(100) not null,
	rolesEmpleado_idrolesEmpleado int not null,
	primary key(idEmpleado, rolesEmpleado_idrolesEmpleado)
);

CREATE TABLE rolesEmpleado (
	idrolesEmpleado int not null,
	tipoDeCargo varchar (100) not null,
	primary key(idrolesEmpleado)
);

CREATE TABLE domiciliario (
	idDomiciliario int not null,
	tipoDeDocumento varchar (100) not null,
	nombres varchar(100) not null,
	apellidos varchar(100) not null,
	direccion varchar(100) not null,
	telefono varchar(100) not null,
	correo varchar(100) not null,
	primary key(idDomiciliario)
);

CREATE TABLE vehiculo (
	idVehiculo int not null,
	tipoVehiculo varchar (100) not null,
	placa varchar(100) not null,
	Domiciliario_idDomiciliario int not null,
	primary key(idVehiculo, Domiciliario_idDomiciliario)
);

CREATE TABLE formaDePago (
	idFormaDePago int not null,
	tiposDeFormasDePagos varchar (100) not null,
	primary key(idformaDePago)
);

CREATE TABLE estadoDePedido (
	idEstadoDePedido int not null,
	estados varchar(100) not null,
	primary key(idEstadoDePedido)
);

CREATE TABLE pedido (
	idPedido int not null,
	valorUnitario varchar(100) not null,
	iva varchar(100) not null,
	Domiciliario_idDomiciliario int not null,
	Empleado_idempleado int not null,
	estadoDePedido_idEstadoDePedido int not null,
	formaDePago_idFormaDePago int not null,
	Ventas_idVentas int not null,
	primary key(idPedido, Domiciliario_idDomiciliario,
Empleado_idempleado, estadoDePedido_idEstadoDePedido,
formaDePago_idFormaDePago, Ventas_idVentas));

--RELACIONES

alter table Ventas_has_Producto add
constraint fk_Ventas_has_Producto_producto
foreign key (Productos_idproducto)
references producto (idProducto);

alter table Ventas_has_Producto add
foreign key (Ventas_idVentas)
references ventas (idVentas);

alter table ventas add
constraint fk_veb_clientes
foreign key (Cliente_idCliente)
references cliente (idCliente);

alter table ventas add
foreign key (Empleado_idempleado)
references empleado (idEmpleado);

alter table pedido add
foreign key (Empleado_idEmpleado)
references empleado (idEmpleado);

alter table pedido add
foreign key (formaDePago_idFormaDePago)
references formaDePago (idFormaDePago);

alter table pedido add
foreign key (estadoDePedido_idEstadoDePedido)
references estadoDePedido(idEstadoDePedido);

alter table pedido add
foreign key (Ventas_idVentas)
references ventas (idVentas);

alter table pedido add
constraint fk_domi_pedido
foreign key (Domiciliario_idDomiciliario)
references domiciliario (idDomiciliario);

alter table vehiculo add
constraint fk_domi_vehiculo
foreign key (Domiciliario_idDomiciliario)
references domiciliario (idDomiciliario);

alter table empleado add
foreign key (rolesEmpleado_idrolesEmpleado)
references rolesEmpleado (idrolesEmpleado);

-- DATOS INSERTADOS

INSERT INTO cliente (idCliente, tipoDeDocumento, nombres, apellidos, direccion, telefono, correo)
VALUES  (1013576811,"Cedula de Ciudadania","Andres Felipe","Orjuela Arias","Calle 95 Sur #5G 12 Este", "30212393458","aforjuela11@misena.edu.co"),
		(1012316243,"Pasaporte","Andres Felipe","Monroy Moreno","Diagonal 74 sur #78 I 39", "3256545896","aforjuela11@misena.edu.co"),
		(1016942358,"Pasaporte","Juan David","Camargo Useche","Calle 4A #93 sur 34", "3043385964","jdcamargo853@misena.edu.co"),
		(1034656167,"Cedula de Ciudadania","Heelen Lizeth","Cano Moreno","Calle 78 #78-71 sur", "3153130156","hlcano76@misena.edu.co");


INSERT INTO empleado (idEmpleado, tipoDeDocumento, nombres, apellidos, direccion, telefono, correo, rolesEmpleado_idrolesEmpleado)
VALUES  (1016943117,"Pasaporte", "Jose Manuel",	"Posada Restrepo", "Calle 6a #94a 25", "3003441688", "josemanuelposada14@gmail.com", 2),
		(1010051342, "Cedula de Ciudadania", "Yasmin Lucia", "Moreno Suarez", "Calle 104 #5-62 Sur", "3118271726", "ylmoreno243@misena.edu.co", 3),
		(1006051207,"Cedula de Ciudadania", "Camilo Andres", "Osorio colmenares", "Calle 130#94-08", "3235940505",	"Camiloandresosoriocolmenares@gmail.com",2),
		(1014176160,"Trajeta de Identidad", "Paula Alejandra", "Cuéllar Rodríguez", "Carrera 18 G# 15 35", "3137528493", "pacuellar06@misena.edu.com",1);

INSERT INTO rolesEmpleado (idrolesEmpleado, tipoDeCargo)
VALUES (1, "Despachador de pedidos"), (2, "Encargado del inventario"), (3, "Encargado de Ventas");

INSERT INTO domiciliario (idDomiciliario, tipoDeDocumento, nombres, apellidos, direccion, telefono, correo)
VALUES  (1000350620, "pasaporte", "Esteban David",	"Pedrozo Aldana", "Ac 68 sur No 69-45", "3044568380",	"edpedrozo02@misena.edu.co"),
		(1019602056, "Cedula de Ciudadania", "Jenifer Carolina",	"Russi Benavides", "Calle79 sur #3-05", "3015551357",	"Jcrussi6@misena.edu.co"),
		(1016942409, "Cedula de Ciudadania", "Brayan Andres",	"Puello Sanchez", "Calle 70 a # 122 a 76", "3208357118", "Bapuello9@misena.edu.co"),
		(1000464506, "Cedula de Ciudadania", "Sebastian Danilo",	"Correa Boyaca", "Carrera 87 #129c 19 Interior 8", "3195890562", "sdcorrea60@misena.edu.co"),
		(1023903053, "Cedula de Ciudadania", "Gary Daniela",	"Vargas Saenz", "Carrera 8 este # 9-28 sur", "3219240401", "gdvargas35@misena.edu.co");


INSERT INTO formaDePago (idFormaDePago, tiposDeFormasDePagos)
VALUES (1, "Tarjeta de credito"), (2, "Trajeta de debito"), (3, "Contra entrega"), (4, "Billeteras virtuales");


INSERT INTO estadoDePedido (idEstadoDePedido, estados)
VALUES (1, "Cancelado"), (2, "En proceso"), (3, "Entegado");

INSERT INTO vehiculo (idVehiculo, tipoVehiculo, placa, Domiciliario_idDomiciliario)
VALUES  (1, "Camion", "DPE 666", 1000350620),
		(2, "Auto", "AHY 754", 1019602056),
		(3, "Motocicleta", "DFC 54A", 1016942409),
		(4, "Motocicleta", "KDF 32P", 1000464506),
		(5, "Camion", "AOK 987", 1023903053);

INSERT INTO producto (idProducto, nombreProducto, descripcion, imagen, marca, documentoInvima, valorUnitario, iva)
VALUES  (1, "Pedialyte Zinc", "Sabor a Manzana, tratamiento oral deshidratancion", "https://acortar.link/DpfxiF", "Pedialyte", "2016M-0011256-R1", "6000",16),
		(2, "Dolex", "Tabletas Sobre X10Tab", "https://acortar.link/Fwsb7e", "Dolex", "2009 M-13851R1", "5900",16),
		(3, "Solución Para Lentes", "Opti-Free Pure Moist Desinfectante", "https://acortar.link/4wvWBL", "Alcon", "2009 M-13851R1", "30900",16),
		(4, "Alcohol Antiseptico", "Aprovecha todos los beneficios desinfectantes del alcohol.", "https://acortar.link/qOtnX2", "MK", "2008-M-011909", "5900",16),
		(5, "Pedialyte Zinc", "Sabor a uva, uso oral. Solución electrolítica para REHIDRATACIÓN.", "https://acortar.link/5W88OZ", "Pedialyte", "2016M-0011256-R1", "6400",16),
		(6, "DOLEX Niños", "Suspensión Oral Frasco x90Ml.", "https://acortar.link/lbKMVP", "Dolex", "2013M-0002141-R1", "11600",16),
		(7, "Isopto Atropina", "Solución Frasco X5Ml.", "https://acortar.link/lbKMVP", "Alcon", "2016M-07416-R3", "23300",16),
		(8, "Espironolactona", "Espironolactona Mk 25mg Caja X 30tab", "https://acortar.link/lbKMVP", "MK", "2015M-0016362", "19200",16);


INSERT INTO ventas (idVentas, nombreProducto, cantidad, valorTotal, fecha, Empleado_idEmpleado, Cliente_idCliente)
VALUES	(1, "Pedialyte Zinc", 20,120000, "2021-05-12", 1016943117, 1013576811),
		(2, "Dolex", 3, 17700, "2021-05-12", 1016943117, 1013576811),
		(3, "Solución Para Lentes", 1,30900, "2021-06-09", 1010051342, 1012316243),
		(4, "Solución Para Lentes", 1,30900, "2021-07-01", 1010051342, 1012316243),
		(5, "Alcohol Antiseptico", 2,11800, "2021-07-01", 1006051207, 1016942358),
		(6, "Pedialyte Zinc", 1,6000, "2021-07-01", 1006051207, 1016942358),
		(7, "Pedialyte Zinc", 1,6000, "2021-07-01", 1014176160, 1034656167),
		(8, "Pedialyte Zinc", 1,6000, "2021-07-01", 1014176160, 1034656167);


INSERT INTO Ventas_has_Producto (Ventas_idVentas, Productos_idproducto, cantidadVendidas, SubValor, ivaProducto)
VALUES	(2, 2, 3,17700, 16),
		(3, 3, 1,30900, 16),
		(4, 3, 1,30900, 16),
		(5, 4, 2,11800, 16),
		(6, 1, 1,6000, 16),
		(7, 1, 1,6000, 16),
		(8, 1, 1,6000, 16);

INSERT INTO ventas (idVentas, nombreProducto, cantidad, valorTotal, fecha, Empleado_idEmpleado, Cliente_idCliente)
VALUES	(1, "Pedialyte Zinc", 20,120000, "2021-05-12", 1016943117, 1013576811),
		(2, "Dolex", 3, 17700, "2021-05-12", 1016943117, 1013576811),
		(3, "Solución Para Lentes", 1,30900, "2021-06-09", 1010051342, 1012316243),
		(4, "Solución Para Lentes", 1,30900, "2021-07-01", 1010051342, 1012316243),
		(5, "Alcohol Antiseptico", 2,11800, "2021-07-01", 1006051207, 1016942358),
		(6, "Pedialyte Zinc", 1,6000, "2021-07-01", 1006051207, 1016942358),
		(7, "Pedialyte Zinc", 1,6000, "2021-07-01", 1014176160, 1034656167),
		(8, "Pedialyte Zinc", 1,6000, "2021-07-01", 1014176160, 1034656167);

INSERT INTO pedido (idPedido, valorUnitario, iva, Domiciliario_idDomiciliario, Empleado_idempleado, estadoDePedido_idEstadoDePedido, formaDePago_idFormaDePago, Ventas_idVentas)
VALUES  (1, 120000, 16, 1000350620, 1016943117, 2, 1, 1),
		(2, 17700, 16, 1019602056, 1010051342, 1, 2, 2),
		(3, 30900, 16, 1016942409, 1006051207, 3, 3, 3),
		(4, 11800, 16, 1000464506, 1014176160, 2, 4, 4);

-- JOIN 

select * from ventas_has_producto v
inner join producto p on  v.productos_idproducto = p.idProducto
inner join ventas ven on v.Ventas_idVentas = ven.idVentas;

select pe.idPedido, pe.valorUnitario , d.nombres as Domiciliario, e.nombres as Empleado, estado.estados as Estados, forma.tiposDeFormasDePagos, ven.nombreProducto  from pedido pe
inner join domiciliario d on  pe.Domiciliario_idDomiciliario = d.idDomiciliario
inner join empleado e on pe.Empleado_idempleado = e.idEmpleado 
inner join estadodepedido estado on pe.estadoDePedido_idEstadoDePedido = estado.idEstadoDePedido
inner join formadepago forma on pe.formaDePago_idFormaDePago = forma.idFormaDePago
inner join ventas ven on pe.Ventas_idVentas = ven.idVentas
order by idPedido asc;

select idEmpleado, nombres ,rolesEmpleado_idrolesEmpleado as rol, rolesempleado.tipoDeCargo from empleado
inner join rolesempleado on rolesempleado.idrolesEmpleado = empleado.rolesEmpleado_idrolesEmpleado;

SELECT idDomiciliario, nombres, apellidos, placa, tipoVehiculo FROM vehiculo v
inner join domiciliario d on d.idDomiciliario = v.Domiciliario_idDomiciliario;