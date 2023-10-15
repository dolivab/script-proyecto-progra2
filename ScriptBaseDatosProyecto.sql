create table categoria_producto (
	id_categoria_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL
);

create table producto (
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria_producto INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_compra NUMERIC(12,2) NOT NULL,
    precio_venta NUMERIC(12,2) NOT NULL,
    precio_promocion NUMERIC(12,2) NOT NULL,
    imagen_producto VARCHAR(200),
    existencia_producto INT NOT NULL,
    
    CONSTRAINT fk_catproducto_producto FOREIGN KEY (id_categoria_producto) REFERENCES categoria_producto (id_categoria_producto)
);

create table rol (
	id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(30) NOT NULL
);

create table usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(30) NOT NULL,
    contrasenia VARCHAR(200) NOT NULL,
    id_rol INT NOT NULL,
    CONSTRAINT fk_rol_usuario FOREIGN KEY (id_rol) REFERENCES rol (id_rol)
);

create table bitacora_inventario (
	id_bitacora_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    fecha_hora DATE NOT NULL,
    existencia_agregada INT NOT NULL,
    existencia_disminuida INT NOT NULL,
    existencia_nueva INT NOT NULL,
    motivo_modificacion VARCHAR(200) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_bitinventario_usario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_bitinventario_producto FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

create table cliente (
	nit VARCHAR(30) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100)  NOT NULL
);

create table forma_pago (
	id_forma_pago INT PRIMARY KEY AUTO_INCREMENT,
    nombre_forma_pago VARCHAR(30)
);

create table venta (
	id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_hora DATE NOT NULL,
    nit VARCHAR(30) NOT NULL,
    id_forma_pago INT NOT NULL,
    recargo_tarjeta NUMERIC(12,2) NOT NULL,
    total NUMERIC(12,2) NOT NULL,
    
    CONSTRAINT fk_usuario_venta FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_cliente_venta FOREIGN KEY (nit) REFERENCES cliente (nit),
    CONSTRAINT fk_formpago_venta FOREIGN KEY (id_forma_pago) REFERENCES forma_pago (id_forma_pago)
);

create table detalle_venta (
	id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_venta NUMERIC(12,2) NOT NULL,
    impuestos NUMERIC(12,2) NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    
    CONSTRAINT fk_venta_detventa FOREIGN KEY (id_venta) REFERENCES venta (id_venta),
    CONSTRAINT fk_producto_det_venta FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);