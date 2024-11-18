CREATE ROLE Administrador;
CREATE ROLE Vendedor;
CREATE ROLE Comprador;

GRANT ALL PRIVILEGES ON *.* TO Administrador WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE ON TiendaOnline.Producto TO Vendedor;
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.Categoria TO Vendedor;

GRANT SELECT ON TiendaOnline.Producto TO Comprador;
GRANT INSERT, UPDATE ON TiendaOnline.Venta TO Comprador;
GRANT SELECT, UPDATE ON TiendaOnline.Envio TO Comprador;

CREATE USER 'admin'@'%' IDENTIFIED BY 'clave_admin';
CREATE USER 'vendedor'@'%' IDENTIFIED BY 'clave_vendedor';
CREATE USER 'comprador'@'%' IDENTIFIED BY 'clave_comprador';

GRANT Administrador TO 'admin'@'%';
GRANT Vendedor TO 'vendedor'@'%';
GRANT Comprador TO 'comprador'@'%';

SET DEFAULT ROLE Administrador TO 'admin'@'%';
SET DEFAULT ROLE Vendedor TO 'vendedor'@'%';
SET DEFAULT ROLE Comprador TO 'comprador'@'%';

SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'vendedor'@'%';
SHOW GRANTS FOR 'comprador'@'%';
