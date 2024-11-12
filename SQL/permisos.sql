-- Crear Roles
CREATE ROLE Administrador;
CREATE ROLE Vendedor;
CREATE ROLE Comprador;

-- Permisos para el Administrador
GRANT ALL PRIVILEGES ON *.* TO Administrador;

-- Permisos para el Vendedor
GRANT SELECT, INSERT, UPDATE ON Producto TO Vendedor;
GRANT SELECT, INSERT, UPDATE ON Pedido TO Vendedor;
GRANT SELECT ON Usuario TO Vendedor;

-- Permisos para el Comprador
GRANT SELECT ON Producto TO Comprador;
GRANT INSERT, UPDATE ON Pedido TO Comprador;
GRANT SELECT ON Envio TO Comprador;

-- Crear Usuarios
CREATE USER 'admin'@'%' IDENTIFIED BY 'clave_admin';
CREATE USER 'vendedor'@'%' IDENTIFIED BY 'clave_vendedor';
CREATE USER 'comprador'@'%' IDENTIFIED BY 'clave_comprador';

-- Asignar Roles a los Usuarios
GRANT Administrador TO 'admin'@'%';
GRANT Vendedor TO 'vendedor'@'%';
GRANT Comprador TO 'comprador'@'%';

-- Mostrar los permisos asignados a cada usuario
SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'vendedor'@'%';
SHOW GRANTS FOR 'comprador'@'%';
