-- Crear Roles
CREATE ROLE Administrador;
CREATE ROLE Vendedor;
CREATE ROLE Comprador;

-- Asignación de Privilegios a los Roles

-- Administrador: tiene todos los privilegios sobre la base de datos.
GRANT ALL PRIVILEGES ON *.* TO Administrador WITH GRANT OPTION;

-- Vendedor: puede realizar operaciones sobre la tabla Producto (modificar productos)
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.Producto TO Vendedor;
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.Categoria TO Vendedor;

-- Vista para los vendedores, solo con ciertos atributos de Producto
CREATE VIEW VistaProductoVendedor AS
SELECT id_producto, nombre, descripcion, precio, stock, id_categoria
FROM TiendaOnline.Producto;

-- Vista para los compradores, solo con ciertos atributos de Producto
CREATE VIEW VistaProductoComprador AS
SELECT id_producto, nombre, precio, descripcion
FROM TiendaOnline.Producto;

-- Asignar permisos a los Vendedores sobre la vista
GRANT SELECT, INSERT, UPDATE ON TiendaOnline.VistaProductoVendedor TO Vendedor;

-- Asignar permisos a los Compradores sobre la vista
GRANT SELECT ON TiendaOnline.VistaProductoComprador TO Comprador;

-- Permitir que el Comprador inserte ofertas en la tabla Oferta
GRANT INSERT ON TiendaOnline.Oferta TO Comprador;

-- Permitir que el Comprador realice ventas
GRANT INSERT, UPDATE ON TiendaOnline.Venta TO Comprador;

-- Permitir que el Comprador vea y actualice envíos
GRANT SELECT, UPDATE ON TiendaOnline.Envio TO Comprador;

-- Crear los usuarios
CREATE USER 'admin'@'%' IDENTIFIED BY 'clave_admin';
CREATE USER 'vendedor'@'%' IDENTIFIED BY 'clave_vendedor';
CREATE USER 'comprador'@'%' IDENTIFIED BY 'clave_comprador';

-- Asignar los roles a los usuarios
GRANT Administrador TO 'admin'@'%';
GRANT Vendedor TO 'vendedor'@'%';
GRANT Comprador TO 'comprador'@'%';

-- Establecer los roles predeterminados para los usuarios
SET DEFAULT ROLE Administrador TO 'admin'@'%';
SET DEFAULT ROLE Vendedor TO 'vendedor'@'%';
SET DEFAULT ROLE Comprador TO 'comprador'@'%';

-- Verificación de los Privilegios Asignados
SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'vendedor'@'%';
SHOW GRANTS FOR 'comprador'@'%';
