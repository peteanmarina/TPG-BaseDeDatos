-- Crear Roles
CREATE ROLE Administrador;
CREATE ROLE Vendedor;
CREATE ROLE Comprador;

-- Asignación de Privilegios a los Roles

-- Administrador: tiene todos los privilegios sobre la base de datos.
GRANT ALL PRIVILEGES ON *.* TO Administrador WITH GRANT OPTION;

REVOKE ALL PRIVILEGES ON *.* FROM 'Vendedor';
REVOKE ALL PRIVILEGES ON *.* FROM 'Comprador';
FLUSH PRIVILEGES;

-- El Vendedor puede realizar operaciones sobre la tabla Publicación y CategoríaPublicación
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.Publicacion TO Vendedor;
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.CategoriaPublicacion TO Vendedor;

-- Vista para compradores que muestra publicaciones con información relevante
CREATE VIEW VistaPublicacionComprador AS
SELECT titulo, precio, descripcion, stock
FROM TiendaOnline.Publicacion;

-- Vista para compradores que muestra detalles de envíos
CREATE VIEW VistaEnvioComprador AS
SELECT tipo_envio, estado
FROM TiendaOnline.DetalleEnvio;

-- Permitir a compradores ver publicaciones
GRANT SELECT ON TiendaOnline.VistaPublicacionComprador TO Comprador;

-- Permitir que compradores puedan comprar
GRANT INSERT, UPDATE ON TiendaOnline.Venta TO Comprador;

-- Permitir que compradores puedan ver y actualizar estados de envíos
GRANT SELECT, UPDATE ON TiendaOnline.VistaEnvioComprador TO Comprador;

-- Permitir a compradores ver los productos
GRANT SELECT ON TiendaOnline.VistaProductoComprador TO Comprador;

-- Permitir que el Comprador oferte
GRANT INSERT ON TiendaOnline.Oferta TO Comprador;

-- Permitir al comprador comprar
GRANT INSERT, UPDATE ON TiendaOnline.Venta TO Comprador;

-- Permitir que el Comprador vea y actualice envios
GRANT SELECT, UPDATE ON TiendaOnline.VistaEnvioComprador TO Comprador;

-- Crear los usuarios
CREATE USER 'admin'@'%' IDENTIFIED BY 'clave_admin';
CREATE USER 'vendedor'@'%' IDENTIFIED BY 'clave_vendedor';
CREATE USER 'comprador'@'%' IDENTIFIED BY 'clave_comprador';

-- Asignar los roles a los usuarios
GRANT Administrador TO 'admin'@'%';
GRANT Vendedor TO 'vendedor'@'%';
GRANT Comprador TO 'comprador'@'%';

-- Para testear
GRANT Vendedor TO 'root'@'localhost';
GRANT Comprador TO 'root'@'localhost';
GRANT Administrador TO 'root'@'localhost';


-- Establecer los roles predeterminados para los usuarios
SET DEFAULT ROLE Administrador TO 'admin'@'%';
SET DEFAULT ROLE Vendedor TO 'vendedor'@'%';
SET DEFAULT ROLE Comprador TO 'comprador'@'%';


-- Ver los roles asignados a los usuarios
SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'vendedor'@'%';
SHOW GRANTS FOR 'comprador'@'%';
