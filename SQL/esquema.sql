DROP DATABASE IF EXISTS TiendaOnline;
CREATE DATABASE TiendaOnline;
USE TiendaOnline;

CREATE TABLE Usuario (
    id_usuario BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
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

CREATE TABLE Producto (
    id_producto BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    color VARCHAR(20),
    fecha_lanzamiento DATE,
    garantia VARCHAR(100)
);


CREATE TABLE Categoria (
    id_categoria BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE CategoriaProducto (
    id_producto BIGINT UNSIGNED,
    id_categoria BIGINT UNSIGNED,
    PRIMARY KEY (id_producto, id_categoria),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Configuracion (
    id_configuracion BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    clave VARCHAR(50) UNIQUE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

INSERT INTO Configuracion (clave, valor) VALUES ('precio_minimo', 10.00);

CREATE TABLE Publicacion (
    id_publicacion BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_vendedor BIGINT UNSIGNED,
	id_producto BIGINT UNSIGNED,
    titulo VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2),
    descripcion VARCHAR(255),
    stock INT CHECK (stock >= 0),
    FOREIGN KEY (id_vendedor) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Envio (
    nro_envio BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP NOT NULL,
    estado_envio ENUM('Pendiente', 'Comenzado', 'Finalizado', 'Cancelado') DEFAULT 'Pendiente',
    ubicacion_actual VARCHAR(255)
);

CREATE TABLE Venta (
    id_venta BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_comprador BIGINT UNSIGNED,  
	id_publicación BIGINT UNSIGNED,
	estado ENUM('Concretada', 'Cancelada', 'En curso') DEFAULT 'En curso',
    monto DECIMAL(10, 2) NOT NULL CHECK (monto > 0),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_publicación) REFERENCES Publicacion(id_publicacion),
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

CREATE TABLE Detalle (
    id_venta BIGINT UNSIGNED,
    id_publicación BIGINT UNSIGNED,
    cantidad INT CHECK (cantidad > 0),
    precioFacturado DECIMAL(10, 2) CHECK (precioFacturado > 0),
    PRIMARY KEY (id_venta, id_publicación),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_publicación) REFERENCES Publicacion(id_publicación)
);

CREATE TABLE PagoVenta (
    id_pago BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_venta BIGINT UNSIGNED,
    estado_pago ENUM('Pendiente', 'Pagado', 'Reembolsado') DEFAULT 'Pendiente',
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metodo_pago ENUM('Efectivo', 'Transferencia', 'Credito', 'Debito') NOT NULL
);

CREATE TABLE Oferta (
    id_oferta BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_comprador BIGINT UNSIGNED,
    id_producto BIGINT UNSIGNED,
    precio_ofrecido DECIMAL(10, 2) CHECK (precio_ofrecido > 0),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Pendiente', 'Aceptada', 'Rechazada') DEFAULT 'Pendiente',
    FOREIGN KEY (id_comprador) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

DELIMITER $$

CREATE TRIGGER trigger_actualizar_reputacion_vendedor
AFTER UPDATE ON Venta
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Concretada' THEN
        UPDATE UsuarioRol
        SET reputacion = (
            SELECT COUNT(*)
            FROM Venta v
            INNER JOIN Detalle dp ON v.id_venta = dp.id_venta
            INNER JOIN Producto p ON dp.id_producto = p.id_producto
            WHERE p.id_vendedor = NEW.id_comprador
            AND v.estado = 'Concretada'
        )
        WHERE id_usuario = NEW.id_comprador AND rol = 'Vendedor';
    END IF;
END$$


DELIMITER $$

CREATE TRIGGER trigger_actualizar_reputacion_comprador
AFTER UPDATE ON PagoVenta
FOR EACH ROW
BEGIN
    IF NEW.estado_pago = 'Pagado' THEN
        UPDATE UsuarioRol
        SET reputacion = (
            SELECT COUNT(*)
            FROM Venta v
            WHERE v.id_comprador = (
                SELECT id_comprador
                FROM Venta
                WHERE id_venta = NEW.id_venta
            )
            AND v.estado = 'Concretada'
        )
        WHERE id_usuario = (
            SELECT id_comprador
            FROM Venta
            WHERE id_venta = NEW.id_venta
        )
        AND rol = 'Comprador';
    END IF;
END$$

DELIMITER $$

CREATE TRIGGER validar_precio
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    DECLARE precio_min DECIMAL(10, 2);

    SELECT valor INTO precio_min FROM Configuracion WHERE clave = 'precio_minimo';

    IF NEW.precio < precio_min THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio debe ser mayor al valor mínimo configurado';
    END IF;
END$$

DELIMITER ;


DELIMITER //

CREATE TRIGGER actualizar_precio_producto
AFTER UPDATE ON Oferta
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Aceptada' AND OLD.estado != 'Aceptada' THEN
        UPDATE Producto
        SET precio = NEW.precio_ofrecido
        WHERE id_producto = NEW.id_producto;
    END IF;
END //

DELIMITER ;
