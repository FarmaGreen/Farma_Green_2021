create database farmagreen;
	use farmagreen;
create table CLIENTE(
		id_cliente varchar(11) not null ,
		p_nombre_cliente varchar(45) not null,
		s_nombre_cliente varchar(45) null,
		p_apellido_cliente varchar(45) not null,
		s_apellido_cliente varchar(45) null,
		direccion varchar(40) not null,
		telefono int not null,
		email varchar(45) not null,
		tipo_doc varchar(45) not null,
		primary key(id_cliente)
		);

create table EMPLEADO(
		id_empleado varchar(11) not null,
		p_nombre_empleado varchar(45) not null,
		s_nombre_empleado varchar(45) null,
		p_apellido_empleado varchar(45) not null,
		s_apellido_empleado varchar(45) null,
		telefono int not null,
		email varchar(45) null,
		direccion varchar(45) null,
		tipo_doc varchar(45) not null,
		admin_id_admin varchar(11) not null,
		primary key(id_empleado,admin_id_admin)
		);

create table ADMIN(
		id_admin varchar(11) not null,
		p_nombre_admin varchar(45) not null,
		s_nombre_admin varchar(45) null,
		p_apellido_admin varchar(45) not null,
		s_apellido_admin varchar(45) null,
		telefono int not null,
		email varchar(45) null,
		direccion varchar(45) null,
		tipo_doc varchar(45) not null,
		primary key(id_admin)
		);

create table PROVEEDOR(
		id_proveedor varchar(11) not null,
		p_nombre_proveedor varchar(45) not null,
		s_nombre_proveedor varchar(45) null,
		p_apellido_proveedor varchar(45) not null,
		s_apellido_proveedor varchar(45) null,
		telefono int not null,
		email varchar(45) null,
		direccion varchar(45) null,
		tipo_doc varchar (45) not null,
		doc_invima varchar(45) not null,
		adm_id_admin varchar(11) not null,
		primary key(id_proveedor,adm_id_admin)
		);

create table PRODUCTO(
		id_producto int not null,
		nombre_producto varchar(45) not null,
		descripcion varchar(100) not null,
		imagen varchar(10) not null,
		fecha_exp date not null,
		fecha_ven date not null,
		cantidad int not null,
		valor_unitario int not null,
		iva varchar(4) not null,
		doc_invima varchar(45) not null,
		primary key(id_producto)
		);

create table REPARTIDOR(
		id_repartidor varchar(11) not null,
		p_nombre_repartidor varchar(50) not null,
		s_nombre_repartidor varchar(50) null,
		p_apellido_repartidor varchar(50) not null,
		s_apellido_repartidor varchar(50) null,
		telefono int not null,
		email varchar(45) null,
		direccion varchar(45) null,
		tipo_doc varchar(45) not null,
		tipo_vehiculo varchar(45) not null,
		pacla varchar(45) not null,
		primary key(id_repartidor)
		);

create table FACTURA(
		id_factura int not null,
		productos_comprados varchar(100) not null,
		cantidad int not null,
		sub_total int not null,
		iva int not null,
		valor_total int not null,
		fecha date not null,
		empleado_id_empleado varchar(11) not null,
		cliente_id_cliente varchar(11) not null,
		primary key(id_factura)
		);

create table FACTURA_has_REPARTIDOR(
		fact_id_factura int not null,
		Rep_id_repartidor varchar(11) not null,
		primary key(fact_id_factura,Rep_id_repartidor)
		);

create table CLIENTE_has_EMPLEADO(
		clt_id_cliente varchar(11) not null,
		emp_id_empleado varchar(11) not null,
		primary key(clt_id_cliente,emp_id_empleado)
		);

create table EMPLEADO_has_PRODUCTO(
		emple_id_empleado varchar(11) not null,
		prd_id_producto int not null,
		primary key(emple_id_empleado,prd_id_producto)
		);

create table PROVEEDOR_has_PRODUCTO(
		producro_id_producto int not null,
		prov_id_proveedor int not null,
		primary key(producro_id_producto,prov_id_proveedor)
		);


alter table FACTURA add
constraint fk_fact_empl
foreign key (empleado_id_empleado)
references EMPLEADO (id_empleado);

alter table FACTURA add
constraint fk_fact_clien
foreign key (cliente_id_cliente)
references CLIENTE (id_cliente);

alter table EMPLEADO add
constraint fk_empl_adm
foreign key (admin_id_admin)
references ADMIN (id_admin);

alter table PROVEEDOR add
constraint fk_prov_adm
foreign key (adm_id_admin)
references ADMIN (id_admin);

alter table FACTURA_has_REPARTIDOR add
constraint fk_rel_fact
foreign key (fact_id_factura)
references FACTURA (id_factura);

alter table CLIENTE_has_EMPLEADO add
constraint fk_rel_clit
foreign key (clt_id_cliente)
references CLIENTE (id_cliente);

alter table CLIENTE_has_EMPLEADO add
constraint fk_rel_emp
foreign key (emp_id_empleado)
references EMPLEADO (id_empleado);

alter table EMPLEADO_has_PRODUCTO add
constraint fk_rel_empl
foreign key (emple_id_empleado)
references EMPLEADO (id_empleado);

alter table EMPLEADO_has_PRODUCTO add
constraint fk_rel_prod
foreign key (prd_id_producto)
references PRODUCTO (id_producto);

alter table PROVEEDOR_has_PRODUCTO add
constraint fk_rel_prod
foreign key (producro_id_producto)
references PRODUCTO (id_producto);

alter table PROVEEDOR_has_PRODUCTO add
constraint fk_rel_prov
foreign key (prov_id_proveedor)
references PROVEEDOR (id_proveedor);

alter table FACTURA_has_REPARTIDOR add
constraint fk_rel_fact
foreign key (Rep_id_repartidor)
references REPARTIDOR (id_repartidor);

---INSERTAR---

INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1013576811","Andres", "Felipe","Orjuela" ,"Arias","Calle 95 Sur #5G 12 Este", 3256545896,"aforjuela11@misena.edu.co","CC");

INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1012316243","Andres", "Felipe","Monroy", "Moreno","diagonal 74 sur #78i39", 3012514581,"afmonroy34@misena.edu.co","CE");

INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1034656167","Heelen", "Lizeth","Cano", "Moreno","Calle 78 #78-71 sur", 3043385964,"hlcano76@misena.edu.co","CC");
---
INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1192831945","Maria", "Paula","Patiño", "Aparicio","Calle 130 d bis # 99 - 27", 3153130156,"mapu302929@gmail.com ","TI");

INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1016943117","José", "Manuel","Posada", "Restrepo","Calle 6a #94a 25", 3172727783,"josemanuelposada14@gmail.com","CE");

INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1010051342","Yasmin", "Lucia","Moreno", "Suarez","Calle 104 #5-62 Sur", 3003441688,"ylmoreno243@misena.edu.co","TI");

INSERT INTO CLIENTE (id_cliente, p_nombre_cliente, s_nombre_cliente, p_apellido_cliente, s_apellido_cliente, Direccion,telefono, email, tipo_doc)
VALUES ("1006051207","Camilo", "Andres","Osorio", "colmenares","Calle 130 #94-08", 3118271726,"Camiloandresosoriocolmenares@gmail.com","CC");


---JOINS--

SELECT*FROM
CLIENTE WHERE tipo_doc = 'CC';

SELECT*FROM
CLIENTE WHERE p_nombre_cliente LIKE '%Andres%';

SELECT*FROM
CLIENTE WHERE Direccion like '%diagonal%' or Direccion like '%Calle%';

SELECT*FROM
CLIENTE WHERE p_nombre_cliente like '%Andres%' and Direccion like '%diagonal%';

SELECT*FROM 
CLIENTE WHERE p_apellido_cliente like 'M%' or p_apellido_cliente like 'C%';

SELECT*FROM
CLIENTE where (p_nombre_cliente like 'A%' or p_nombre_cliente like 'Y%') and (p_apellido_cliente like 'M%' or p_apellido_cliente like 'A%'); 