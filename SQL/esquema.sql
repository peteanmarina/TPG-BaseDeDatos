DROP DATABASE IF EXISTS TiendaOnline;
CREATE DATABASE TiendaOnline;
USE TiendaOnline;

CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    rol ENUM('Administrador', 'Vendedor', 'Comprador') NOT NULL,
    reputacion_comprador INT DEFAULT 0 CHECK (reputacion_comprador >= 0),
    reputacion_vendedor INT DEFAULT 0 CHECK (reputacion_vendedor >= 0)
);

CREATE TABLE UsuarioRol(
    id_usuario BIGINT UNSIGNED,
    rol ENUM('Administrador', 'Vendedor', 'Comprador') NOT NULL,
    reputacion INT DEFAULT 0 CHECK (reputacion >= 0),
    PRIMARY KEY (id_usuario, rol),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);


CREATE TABLE Categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    id_vendedor BIGINT UNSIGNED,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0),
    id_categoria BIGINT UNSIGNED,
    descripcion VARCHAR(255),
    stock INT CHECK (stock >= 0),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_vendedor) REFERENCES Usuario(id_usuario)
);  

CREATE TABLE Envio (
    nro_envio SERIAL PRIMARY KEY,
	fecha TIMESTAMP NOT NULL,
    estado_envio ENUM('Pendiente', 'Comenzado', 'Finalizado', 'Cancelado') DEFAULT 'Pendiente',
    ubicacion_actual VARCHAR(255)
);

CREATE TABLE Venta (
    id_venta SERIAL PRIMARY KEY,
    id_comprador BIGINT UNSIGNED,
    estado ENUM('Concretada', 'Cancelada', 'En curso') DEFAULT 'En curso',
    monto DECIMAL(10, 2) NOT NULL CHECK (monto > 0),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_comprador) REFERENCES Usuario(id_usuario)
);

CREATE TABLE DetalleEnvio (
    nro_envio BIGINT UNSIGNED,
    id_venta BIGINT UNSIGNED,
    estado ENUM('Pendiente', 'Despachado', 'En camino', 'Cancelado') DEFAULT 'Pendiente',
    tipo_envio ENUM('Domicilio', 'Punto entrega'),  
    FOREIGN KEY (nro_envio) REFERENCES Envio(nro_envio),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta)
); 

CREATE TABLE DetalleProducto (
    id_venta BIGINT UNSIGNED,
    id_producto BIGINT UNSIGNED,
    cantidad INT CHECK (cantidad > 0),
    precioFacturado DECIMAL(10, 2) CHECK (precioFacturado > 0),
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE PagoVenta (
    id_pago SERIAL PRIMARY KEY,
	id_venta BIGINT UNSIGNED,
	estado_pago ENUM('Pendiente', 'Pagado', 'Reembolsado') DEFAULT 'Pendiente',
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metodo_pago ENUM('Efectivo', 'Transferencia', 'Credito', 'Debito') NOT NULL
);

