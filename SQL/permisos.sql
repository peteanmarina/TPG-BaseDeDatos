-- Borrar Roles
DROP ROLE IF EXISTS Administrador;
DROP ROLE IF EXISTS Vendedor;
DROP ROLE IF EXISTS Comprador;

-- Crear Roles
CREATE ROLE Administrador;
CREATE ROLE Vendedor;
CREATE ROLE Comprador;

-- Administrador:
GRANT ALL PRIVILEGES ON *.* TO Administrador WITH GRANT OPTION;

-- Quitarle los permisos a vendedor y comprador
REVOKE ALL PRIVILEGES ON *.* FROM 'Vendedor';
REVOKE ALL PRIVILEGES ON *.* FROM 'Comprador';
FLUSH PRIVILEGES;

-- Vista reducida de las publicaciones
CREATE VIEW VistaPublicacion AS
SELECT titulo, precio, descripcion, stock
FROM TiendaOnline.Publicacion;

-- Vista para compradores que muestra detalles de envíos
CREATE VIEW VistaEnvioComprador AS
SELECT tipo_envio, estado
FROM TiendaOnline.DetalleEnvio;

-- Vendedor
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.CategoriaProducto TO Vendedor;
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.Categoria TO Vendedor;
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.VistaPublicacion TO Vendedor;

-- Comprador
GRANT SELECT ON TiendaOnline.VistaPublicacion TO Comprador;
GRANT INSERT, UPDATE ON TiendaOnline.Venta TO Comprador;
GRANT INSERT, UPDATE ON TiendaOnline.Detalle TO Comprador;
GRANT SELECT, UPDATE ON TiendaOnline.VistaEnvioComprador TO Comprador;
GRANT INSERT, UPDATE ON TiendaOnline.Venta TO Comprador;
GRANT SELECT ON TiendaOnline.Envio TO Comprador;

-- Crear los usuarios
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'clave_admin';
CREATE USER 'vendedor'@'localhost' IDENTIFIED BY 'clave_vendedor';
CREATE USER 'comprador'@'localhost' IDENTIFIED BY 'clave_comprador';

-- Para testear
GRANT Vendedor TO 'root'@'localhost';
GRANT Comprador TO 'root'@'localhost';
GRANT Administrador TO 'root'@'localhost';

GRANT Vendedor TO 'vendedor'@'localhost';
GRANT Comprador TO 'comprador'@'localhost';
GRANT Administrador TO 'admin'@'localhost';

-- Establecer los roles predeterminados para los usuarios
SET DEFAULT ROLE Administrador TO 'admin'@'localhost';
SET DEFAULT ROLE Vendedor TO 'vendedor'@'localhost';
SET DEFAULT ROLE Comprador TO 'comprador'@'localhost';

-- Ver los roles asignados a los usuarios
SHOW GRANTS FOR 'admin'@'localhost';
SHOW GRANTS FOR 'vendedor'@'localhost';
SHOW GRANTS FOR 'comprador'@'localhost';
