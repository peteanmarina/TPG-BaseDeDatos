
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
('Beatriz Díaz', 'beatriz.diaz@example.com'),
('Daniel Ruiz', 'daniel.ruiz@example.com'),
('Sofía Morales', 'sofia.morales@example.com'),
('Andrés Castillo', 'andres.castillo@example.com'),
('Claudia Rivas', 'claudia.rivas@example.com'),
('Ricardo Vega', 'ricardo.vega@example.com'),
('Elena Ortiz', 'elena.ortiz@example.com'),
('Gabriel Herrera', 'gabriel.herrera@example.com'),
('Isabel Cruz', 'isabel.cruz@example.com'),
('Manuel Navarro', 'manuel.navarro@example.com'),
('María León', 'maria.leon@example.com');


INSERT INTO UsuarioRol (id_usuario, rol, reputacion) VALUES
(1, 'Administrador', 0),
(2, 'Vendedor', 0),
(2, 'Comprador', 0),
(3, 'Comprador', 0),
(3, 'Vendedor', 0),
(4, 'Vendedor', 0),
(5, 'Comprador', 0),
(6, 'Vendedor', 0),
(7, 'Comprador', 0),
(8, 'Administrador', 0),
(9, 'Comprador', 0),
(10, 'Vendedor', 0),
(11, 'Vendedor', 0),
(11, 'Comprador', 0),
(12, 'Comprador', 0),
(13, 'Administrador', 0),
(14, 'Vendedor', 0),
(15, 'Comprador', 0),
(16, 'Administrador', 0),
(17, 'Vendedor', 0),
(17, 'Comprador', 0),
(18, 'Comprador', 0),
(19, 'Vendedor', 0),
(20, 'Administrador', 0);

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
('Monitor Acer', 'Monitor Acer Predator de 27 pulgadas', 'Predator-27', 'Acer', 'Negro', '2024-07-15', '2 años'),
('Cámara Canon', 'Cámara réflex Canon EOS R5', 'EOS-R5', 'Canon', 'Negro', '2024-03-01', '2 años'),
('Impresora Epson', 'Impresora Epson EcoTank L3250', 'L3250', 'Epson', 'Blanco', '2024-04-10', '1 año'),
('Router TP-Link', 'Router inalámbrico TP-Link Archer AX73', 'AX73', 'TP-Link', 'Negro', '2024-02-20', '3 años'),
('Disco Duro Seagate', 'Disco duro externo Seagate de 2TB', 'Expansion-2TB', 'Seagate', 'Negro', '2024-05-05', '2 años'),
('Teclado Logitech', 'Teclado mecánico inalámbrico Logitech MX Keys', 'MXKeys', 'Logitech', 'Gris', '2024-06-18', '2 años'),
('Mouse Razer', 'Mouse gamer Razer DeathAdder V3', 'DeathAdder-V3', 'Razer', 'Negro', '2024-07-20', '2 años'),
('Parlante JBL', 'Parlante portátil JBL Charge 5', 'Charge5', 'JBL', 'Azul', '2024-01-25', '1 año'),
('Microondas Panasonic', 'Microondas Panasonic NN-SN936B de 2.2 pies cúbicos', 'NN-SN936B', 'Panasonic', 'Negro', '2024-08-05', '3 años'),
('Frigorífico Samsung', 'Frigorífico Samsung French Door RF28R7201', 'RF28R7201', 'Samsung', 'Plata', '2024-09-15', '10 años'),
('Bicicleta Trek', 'Bicicleta de montaña Trek Marlin 7', 'Marlin7', 'Trek', 'Rojo', '2024-10-10', '5 años');

INSERT INTO Categoria (nombre_categoria) VALUES 
('Electrónica'),
('Tecnología'),
('Audio'),
('Hogar'),
('Gadgets'),
('Deportes'),
('Electrodomésticos'),
('Moda'),
('Juguetes'),
('Muebles'),
('Vehículos'),
('Libros');

INSERT INTO CategoriaProducto (id_producto, id_categoria) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2),
(4, 1), (4, 4),
(5, 2), (5, 1),
(6, 5), (10, 4),
(7, 3), (8, 1),
(9, 2), (10, 1), 
(11, 7), (11, 1),
(12, 2), (12, 8),
(13, 3), (13, 9),
(14, 7), (14, 10),
(15, 2), (15, 12),
(16, 6), (16, 5),
(17, 3), (17, 1),
(18, 1), (18, 11),
(19, 2), (19, 1),
(20, 2), (20, 11),
(3, 3);

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
(10, 10, 'Monitor Acer Predator 27"', 'Monitor Acer Predator de 27" con tasa de refresco de 144Hz', 500.00, 30, 'Activa'),
(1, 11, 'Lavadora Samsung 10kg', 'Lavadora de carga frontal con capacidad de 10kg', 450.00, 5, 'Activa'),
(2, 12, 'Reloj Casio Vintage', 'Reloj digital estilo retro con cronómetro', 30.00, 20, 'Activa'),
(3, 13, 'Pelota Adidas', 'Pelota de fútbol Adidas oficial de la FIFA', 50.00, 15, 'Activa'),
(4, 14, 'Sofá 3 plazas', 'Sofá cómodo y moderno con capacidad para 3 personas', 600.00, 3, 'Activa'),
(5, 15, 'Libro: El Principito', 'Edición especial del clásico libro "El Principito"', 20.00, 40, 'Activa'),
(6, 16, 'Auriculares Bluetooth JBL', 'Auriculares con batería de larga duración', 120.00, 10, 'Activa'),
(7, 17, 'Barra de Sonido Sony', 'Barra de sonido con subwoofer inalámbrico', 300.00, 8, 'Activa'),
(8, 18, 'Bicicleta Eléctrica Xiaomi', 'Bicicleta eléctrica plegable Xiaomi con autonomía extendida', 1200.00, 4, 'Activa'),
(9, 19, 'Cámara GoPro Hero 10', 'Cámara GoPro con grabación en 5K y resistente al agua', 500.00, 12, 'Activa'),
(10, 20, 'Patineta Eléctrica Razor', 'Patineta eléctrica con velocidad máxima de 25 km/h', 400.00, 6, 'Activa');

INSERT INTO Envio (fecha, estado_envio, ubicacion_actual) VALUES
('2024-11-20 10:00:00', 'Pendiente', 'Almacén Central'),
('2024-11-21 11:30:00', 'Comenzado', 'Ruta de distribución'),
('2024-11-22 14:45:00', 'Finalizado', 'Dirección del comprador'),
('2024-11-23 09:00:00', 'Pendiente', 'Almacén 2'),
('2024-11-24 08:30:00', 'Pendiente', 'Almacén 1'),
('2024-11-25 12:00:00', 'Pendiente', 'Almacén Central'),
('2024-11-26 15:45:00', 'Comenzado', 'Ruta de distribución'),
('2024-11-27 17:20:00', 'Finalizado', 'Dirección del comprador'),
('2024-11-28 10:30:00', 'Pendiente', 'Almacén Secundario');


INSERT INTO Venta (id_comprador, estado) VALUES
(3, 'En curso'),
(4, 'Concretada'),
(5, 'En curso'),
(6, 'Concretada'),
(7, 'En curso'),
(8, 'Concretada'),
(9, 'En curso'),
(10, 'Concretada'),
(11, 'En curso'),
(12, 'Concretada'),
(13, 'En curso'),
(14, 'Concretada'),
(15, 'En curso');

INSERT INTO DetalleEnvio (nro_envio, id_venta, estado, tipo_envio) VALUES
(1, 1, 'Pendiente', 'Domicilio'),
(2, 2, 'Despachado', 'Punto entrega'),
(3, 3, 'En camino', 'Domicilio'),
(4, 4, 'Pendiente', 'Punto entrega'),
(5, 5, 'Pendiente', 'Domicilio'),
(6, 9, 'Pendiente', 'Domicilio'),
(7, 10, 'En camino', 'Punto entrega'),
(8, 11, 'Despachado', 'Domicilio');

INSERT INTO Detalle (id_venta, id_publicacion, cantidad, precioFacturado) VALUES
(1, 1, 1, 800.00),
(1, 2, 2, 999.99),
(1, 3, 1, 350.00),
(2, 4, 1, 1200.00),
(2, 1, 1, 1100.00),
(2, 6, 1, 600.00),
(2, 2, 2, 400.00),
(3, 5, 2, 2200.00),
(3, 6, 1, 600.00),
(4, 7, 1, 400.00),
(5, 8, 2, 1500.00),
(6, 9, 1, 900.00),
(6, 10, 1, 500.00),
(7, 1, 1, 800.00),
(8, 2, 1, 999.99),
(8, 3, 3, 1050.00);

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
(10, 'Pagado', 'Transferencia'),
(9, 'Pendiente', 'Credito'),
(10, 'Pagado', 'Efectivo'),
(11, 'Pendiente', 'Transferencia'),
(12, 'Pagado', 'Debito'),
(13, 'Pendiente', 'Efectivo');

