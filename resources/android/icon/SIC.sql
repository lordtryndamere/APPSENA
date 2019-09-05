create database sic;
use sic;

create table sic.usuario(
    numero_documento int(11) not null,
    primer_nombre_usuario varchar(25) not null,
    segundo_nombre_usuario varchar(25),
    primer_apellido_usuario varchar (25) not null,
    segundo_apellido_usuario varchar(25),
    correo_electronico varchar(30) not null, 
    contraseña varchar(10) not null,
    telefono int(10) not null,
    id_tipo_documento varchar(5) not null,
    id_rol int (5) not null
);

create table sic.tipo_documento(
    id_tipo_documento varchar(5) not null,
    nombre_tipo_documento varchar(25) not null,
    abreviatura varchar(5) not null
);

create table sic.rol(
    id_rol int(5) not null,
    nombre_rol varchar(20) not null
);

create table sic.sugerencias(
    id_sugerencia varchar(5) not null,
    tipo_sugerencia varchar(25) not null,
    fecha date not null,
    hora time not null,
    cantidad_sugerencia int(10)  not null,
    numero_documento int(11) not null,
    id_tipo_documento varchar(5) not null
);

create table sic.notificaciones(
    id_notificacion varchar(5) not null,
    descripcion varchar(25) not null,
    tipo_notificacion varchar(11) not null,
    numero_documento int(11) not null,
    id_tipo_documento varchar(5) not null
);

create table sic.producto(
    id_producto varchar(5) not null,
    nombre_producto varchar(25) not null,
    tamaño varchar(25) not null,
    precio_adquisicion int(10) not null,
    precio_sugerido int(10) not null,
    fecha_vencimiento date not null,
    cantidad int(10) not null,
    id_inventario varchar(5) not null,
    id_compra varchar(5) not null,
    id_categoria varchar(5) not null,
    id_proveedor int(10) not null,
    id_marca int(10) not null
);

create table sic.inventario(
    id_inventario varchar(5) not null,
    nombre varchar(25) not null,
    tipo_producto varchar(25) not null,
    precio int(7) not null,
    fecha_vencimiento_inventario date not null,
    precio_sugerido_inventario int(7) not null,
    cantidad int(7) not null,
    codigo_referencia int(2)
);

create table sic.categoria(
    id_categoria varchar(5) not null,
    nombre_categoria varchar(25) not null
);

create table sic.ventas_productos(
    id_venta varchar(5) not null,
    id_producto varchar(5) not null
);

create table sic.inversion(
    id_compra varchar(5) not null,
    cantidad_inversion int(10) not null,
    tipo_gasto varchar(25) not null,
    fecha date not null,
    hora time not null,
    valor int(10) not null
);

create table sic.marca(
    id_marca int(10) not null,
    nombre_marca varchar(25) not null
);

create table sic.proveedor(
    id_proveedor int(10) not null,
    nombre_proveedor varchar(25) not null,
    direccion_proveedor varchar(25) not null,
    correo_proveedor varchar(30) not null
);

create table sic.ventas(
    id_venta varchar(5) not null,
    cantidad_ventas int(10) not null,
    fecha_ventas date not null,
    hora_ventas time not null,
    valor int(10) not null,
    numero_documento int(11) not null,
    id_rol int(5) not null,
    id_tipo_documento varchar(5) not null
);

create table sic.log_error(
    id_error varchar(5) not null,
    descripcion_error varchar(25) not null,
    fecha_error date not null,
    hora_error time not null
);

create table sic.servidor_correo(
    id_servidor varchar(5) not null,
    dominio_correo varchar(25) not null
);

alter table sic.usuario add primary key (numero_documento, id_tipo_documento);
alter table sic.rol add primary key (id_rol);
alter table sic.tipo_documento add primary key (id_tipo_documento);
alter table sic.sugerencias add primary key (id_sugerencia);
alter table sic.notificaciones add primary key (id_notificacion);
alter table sic.producto add primary key (id_producto);
alter table sic.marca add primary key (id_marca);
alter table sic.categoria add primary key (id_categoria);
alter table sic.proveedor add primary key (id_proveedor);
alter table sic.inversion add primary key (id_compra);
alter table sic.inventario add primary key (id_inventario);
alter table sic.ventas add primary key (id_venta);
alter table sic.log_error add primary key (id_error);
alter table sic.servidor_correo add primary key (id_servidor);
alter table sic.ventas_productos add primary key (id_venta, id_producto);

alter table sic.usuario add constraint foreign key (id_rol) references sic.rol (id_rol) on update cascade;
alter table sic.usuario add constraint foreign key (id_tipo_documento) references sic.tipo_documento(id_tipo_documento) on update cascade;
alter table sic.sugerencias add constraint foreign key (numero_documento) references sic.usuario(numero_documento) on update cascade;
alter table sic.sugerencias add constraint foreign key (id_tipo_documento) references sic.usuario(id_tipo_documento) on update cascade;
alter table sic.notificaciones add constraint foreign key (numero_documento) references sic.usuario(numero_documento) on update cascade;
alter table sic.notificaciones add constraint foreign key (id_tipo_documento) references sic.usuario(id_tipo_documento) on update cascade;
alter table sic.producto add constraint foreign key (id_inventario) references sic.inventario (id_inventario) on update cascade;
alter table sic.producto add constraint foreign key (id_categoria) references sic.categoria (id_categoria) on update cascade;
alter table sic.producto add constraint foreign key (id_compra) references sic.inversion (id_compra) on update cascade;
alter table sic.producto add constraint foreign key (id_proveedor) references sic.proveedor (id_proveedor) on update cascade;
alter table sic.producto add constraint foreign key (id_marca) references sic.marca (id_marca) on update cascade;
alter table sic.ventas add constraint foreign key (numero_documento) references sic.usuario(numero_documento) on update cascade;
alter table sic.ventas add constraint foreign key (id_tipo_documento) references sic.usuario(id_tipo_documento) on update cascade;
alter table sic.ventas_productos add constraint foreign key (id_venta) references sic.ventas(id_venta) on update cascade;
alter table sic.ventas_productos add constraint foreign key (id_producto) references sic.producto(id_producto) on update cascade;


alter table sic.usuario add index fk_id_rol_idx (id_rol);
alter table sic.usuario add index fk_id_tipo_documento_idx (id_tipo_documento);
alter table sic.sugerencias add index fk_numero_documento_idx (numero_documento) ;
alter table sic.sugerencias add index fk_id_tipo_documento_idx (id_tipo_documento);
alter table sic.notificaciones add index fk_numero_documento_idx(numero_documento);
alter table sic.notificaciones add index fk_id_tipo_documento_idx (id_tipo_documento);
alter table sic.producto add index fk_id_inventario_idx (id_inventario);
alter table sic.producto add index fk_id_categoria_idx (id_categoria);
alter table sic.producto add index fk_id_compra_idx (id_compra);
alter table sic.producto add index fk_id_proveedor_idc (id_proveedor);
alter table sic.producto add index fk_id_marca_idx (id_marca);
alter table sic.ventas add index fk_id_venta_idx (id_venta);
alter table sic.ventas_productos add index fk_id_venta_idx (id_venta);
alter table sic.ventas_productos add index fk_id_producto_idx (id_producto);