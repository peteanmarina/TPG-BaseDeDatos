-- Inserción de usuarios
INSERT INTO Usuario (nombre, email) VALUES 
('Juan Pérez', 'juan.perez@example.com'),
('Ana Gómez', 'ana.gomez@example.com'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com'),
('Laura Fernández', 'laura.fernandez@example.com'),
('Pedro Martínez', 'pedro.martinez@example.com'),
('Marta Sánchez', 'marta.sanchez@example.com'),
('Luis García', 'luis.garcia@example.com'),
('Patricia Torres', 'patricia.torres@example.com'),
('José López', 'jose.lopez@example.com'),
('Beatriz Díaz', 'beatriz.diaz@example.com');

-- Inserción de roles para usuarios
INSERT INTO UsuarioRol (id_usuario, rol, reputacion) VALUES
(1, 'Administrador', 10),
(2, 'Vendedor', 5),
(3, 'Comprador', 3),
(4, 'Vendedor', 6),
(5, 'Comprador', 2),
(6, 'Vendedor', 4),
(7, 'Comprador', 7),
(8, 'Administrador', 8),
(9, 'Comprador', 1),
(10, 'Vendedor', 9);

-- Inserción de productos
INSERT INTO Producto (nombre, descripcion, modelo, marca, color, fecha_lanzamiento, garantia) VALUES
('Laptop HP', 'Laptop HP con 16GB de RAM y procesador i7', 'HP-2024', 'HP', 'Negro', '2024-10-01', '2 años'),
('Smartphone Samsung', 'Smartphone Samsung Galaxy S23', 'S23', 'Samsung', 'Azul', '2024-01-15', '1 año'),
('Auriculares Bose', 'Auriculares Bose con cancelación de ruido', 'Bose-100', 'Bose', 'Blanco', '2024-03-10', '3 años'),
('Televisor LG', 'Televisor 4K de 55 pulgadas', 'LG-55UHD', 'LG', 'Negro', '2024-06-20', '5 años'),
('Tablet Apple', 'Tablet Apple iPad Pro 12.9', 'iPadPro2024', 'Apple', 'Gris', '2024-09-01', '2 años'),
('Smartwatch Garmin', 'Reloj inteligente Garmin Fenix 7', 'Fenix7', 'Garmin', 'Negro', '2024-02-25', '1 año'),
('Auriculares Sony', 'Auriculares Sony WH-1000XM5', 'Sony-1000', 'Sony', 'Negro', '2024-05-15', '2 años'),
('Smartphone Xiaomi', 'Smartphone Xiaomi Mi 12', 'Mi12', 'Xiaomi', 'Rojo', '2024-08-10', '1 año'),
('Laptop Dell', 'Laptop Dell XPS 13 con 8GB de RAM', 'XPS13', 'Dell', 'Plata', '2024-11-01', '3 años'),
('Monitor Acer', 'Monitor Acer Predator de 27 pulgadas', 'Predator-27', 'Acer', 'Negro', '2024-07-15', '2 años');

-- Inserción de categorías
INSERT INTO Categoria (nombre_categoria) VALUES 
('Electrónica'),
('Tecnología'),
('Audio'),
('Hogar'),
('Gadgets'),
('Deportes');

-- Asignación de productos a categorías
INSERT INTO CategoriaProducto (id_producto, id_categoria) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2),
(3, 3),
(4, 1), (4, 4),
(5, 2), (5, 1),
(6, 5),
(7, 3),
(8, 1),
(9, 2),
(10, 1), (10, 4);

-- Inserción de publicaciones
INSERT INTO Publicacion (id_vendedor, id_producto, titulo, descripcion, precio, stock, estado) VALUES
(2, 1, 'Laptop HP 16GB', 'Laptop HP con procesador Intel i7 y 16GB de RAM', 800.00, 10, 'Activa'),
(2, 2, 'Smartphone Samsung Galaxy S23', 'Smartphone Samsung S23, pantalla 6.1" y 128GB de almacenamiento', 999.99, 5, 'Activa'),
(3, 3, 'Auriculares Bose', 'Auriculares Bose con cancelación activa de ruido', 350.00, 15, 'Activa'),
(4, 4, 'Televisor LG 55" 4K', 'Televisor LG con resolución 4K y HDR', 1200.00, 8, 'Activa'),
(5, 5, 'Tablet Apple iPad Pro 12.9', 'Tablet Apple con pantalla Retina y 128GB de almacenamiento', 1100.00, 12, 'Activa'),
(6, 6, 'Smartwatch Garmin Fenix 7', 'Smartwatch Garmin Fenix 7 con GPS y sensor de frecuencia cardíaca', 600.00, 20, 'Activa'),
(7, 7, 'Auriculares Sony WH-1000XM5', 'Auriculares Sony con cancelación de ruido y conectividad Bluetooth', 400.00, 25, 'Activa'),
(8, 8, 'Smartphone Xiaomi Mi 12', 'Smartphone Xiaomi con 8GB de RAM y pantalla AMOLED', 750.00, 18, 'Activa'),
(9, 9, 'Laptop Dell XPS 13', 'Laptop Dell con procesador Intel i5 y 8GB de RAM', 900.00, 14, 'Activa'),
(10, 10, 'Monitor Acer Predator 27"', 'Monitor Acer Predator de 27" con tasa de refresco de 144Hz', 500.00, 30, 'Activa');

-- Inserción de envíos
INSERT INTO Envio (fecha, estado_envio, ubicacion_actual) VALUES
('2024-11-20 10:00:00', 'Pendiente', 'Almacén Central'),
('2024-11-21 11:30:00', 'Comenzado', 'Ruta de distribución'),
('2024-11-22 14:45:00', 'Finalizado', 'Dirección del comprador'),
('2024-11-23 09:00:00', 'Pendiente', 'Almacén 2'),
('2024-11-24 08:30:00', 'Pendiente', 'Almacén 1');

-- Inserción de ventas
INSERT INTO Venta (id_comprador, estado, monto) VALUES
(3, 'En curso', 850.00),
(4, 'Concretada', 1200.00),
(5, 'En curso', 1350.00),
(6, 'Concretada', 600.00),
(7, 'En curso', 750.00),
(8, 'Concretada', 1100.00),
(9, 'En curso', 400.00),
(10, 'Concretada', 500.00);

-- Inserción de detalles de venta
INSERT INTO Detalle (id_venta, id_publicacion, cantidad, precioFacturado) VALUES
(1, 1, 1, 800.00),
(1, 2, 2, 999.99),
(1, 3, 1, 350.00),
(2, 4, 1, 1200.00),
(2, 1, 1, 1100.00),
(2, 6, 1, 600.00),
(2, 2, 2, 400.00);

-- Inserción de pagos
INSERT INTO PagoVenta (id_venta, estado_pago, metodo_pago) VALUES
(1, 'Pendiente', 'Efectivo'),
(2, 'Pagado', 'Transferencia'),
(3, 'Pendiente', 'Credito'),
(4, 'Pagado', 'Debito'),
(5, 'Pendiente', 'Efectivo'),
(6, 'Pagado', 'Transferencia'),
(7, 'Pendiente', 'Credito'),
(8, 'Pagado', 'Debito'),
(9, 'Pendiente', 'Efectivo'),
(10, 'Pagado', 'Transferencia');

-- Inserción de detalles de envío
INSERT INTO DetalleEnvio (nro_envio, id_venta, estado, tipo_envio) VALUES
(1, 1, 'Pendiente', 'Domicilio'),
(2, 2, 'Despachado', 'Punto entrega'),
(3, 3, 'En camino', 'Domicilio'),
(4, 4, 'Pendiente', 'Punto entrega'),
(5, 5, 'Pendiente', 'Domicilio');
