INSERT INTO Usuario (nombre, email, rol, reputacion_comprador, reputacion_vendedor)
VALUES
    ('Juan Pérez', 'juan.perez@email.com', 'Comprador', 5, 0),
    ('Ana Gómez', 'ana.gomez@email.com', 'Vendedor', 0, 4),
    ('Carlos Martínez', 'carlos.martinez@email.com', 'Administrador', 0, 0),
    ('Laura Sánchez', 'laura.sanchez@email.com', 'Comprador', 2, 0),
    ('Pedro López', 'pedro.lopez@email.com', 'Vendedor', 0, 3),
    ('Marta Ruiz', 'marta.ruiz@email.com', 'Comprador', 3, 0),
    ('Luis Fernández', 'luis.fernandez@email.com', 'Administrador', 0, 0),
    ('Elena Rodríguez', 'elena.rodriguez@email.com', 'Vendedor', 0, 5),
    ('José García', 'jose.garcia@email.com', 'Comprador', 4, 0),
    ('Beatriz Pérez', 'beatriz.perez@email.com', 'Vendedor', 0, 2);

INSERT INTO Categoria (nombre_categoria) 
VALUES 
    ('Electrónica'), 
    ('Ropa'), 
    ('Hogar'), 
    ('Muebles'), 
    ('Juguetes'), 
    ('Deportes'), 
    ('Alimentos'), 
    ('Libros'), 
    ('Belleza'), 
    ('Automóviles');
	
INSERT INTO CategoriaProducto (id_producto, id_categoria)
VALUES
    (1, 1),  -- Smartphone en Electrónica
    (2, 2),  -- T-Shirt en Ropa
    (3, 3),  -- Cafetera en Hogar
    (4, 1),  -- Laptop en Electrónica
    (5, 2),  -- Chaqueta en Ropa
    (6, 4),  -- Silla de oficina en Muebles
    (7, 6),  -- Pelota de fútbol en Deportes
    (8, 8),  -- Libro en Libros
    (9, 9),  -- Crema antiarrugas en Belleza
    (10, 10); -- Neumáticos en Automóviles


INSERT INTO Producto (nombre, descripcion, precio, modelo, marca, color, fecha_lanzamiento, garantia)
VALUES
    ('Smartphone', 'Smartphone de última generación', 299.99, 'Galaxy S21', 'Samsung', 'Negro', '2024-01-01', '1 año'),
    ('T-Shirt', 'Camiseta de algodón, talla M', 19.99, 'CottonClassic', 'Hanes', 'Blanco', '2023-06-01', 'No aplica'),
    ('Cafetera', 'Cafetera de 1.5 litros', 49.99, 'CoffeePro', 'DeLonghi', 'Negro', '2022-11-10', '2 años'),
    ('Laptop', 'Laptop portátil con procesador i7', 999.99, 'XPS 15', 'Dell', 'Plata', '2023-09-15', '1 año'),
    ('Chaqueta', 'Chaqueta de cuero', 89.99, 'LeatherMaster', 'Armani', 'Marrón', '2023-02-20', '6 meses'),
    ('Silla de oficina', 'Silla ergonómica', 120.00, 'ErgoChair', 'HermanMiller', 'Negro', '2022-05-30', '5 años'),
    ('Pelota de fútbol', 'Pelota de fútbol profesional', 15.00, 'ProBall', 'Nike', 'Blanco', '2021-08-15', 'No aplica'),
    ('Libro "Cien años de soledad"', 'Novela de Gabriel García Márquez', 12.50, 'Primera edición', 'Penguin', 'N/A', '1967-06-05', 'No aplica'),
    ('Crema antiarrugas', 'Crema para el cuidado de la piel', 45.00, 'AgeDefy', 'L\'Oreal', 'N/A', '2024-04-01', '1 año'),
    ('Neumáticos', 'Neumáticos para automóviles', 85.00, 'AutoGrip', 'Michelin', 'Negro', '2023-03-25', '3 años');
	
INSERT INTO Publicacion (id_usuario, id_categoria, titulo, descripcion, precio, stock, estado)
VALUES
    (2, 1, 'Smartphone', 'Smartphone de última generación con excelentes características.', 299.99, 50, 'Activa'),
    (2, 2, 'T-Shirt', 'Camiseta de algodón ideal para el verano.', 19.99, 200, 'Activa'),
    (2, 3, 'Cafetera', 'Cafetera compacta con capacidad para 1.5 litros.', 49.99, 30, 'Activa'),
    (3, 1, 'Laptop', 'Laptop portátil con procesador Intel i7, 16GB RAM y SSD de 512GB.', 999.99, 15, 'Activa'),
    (4, 2, 'Chaqueta de Cuero', 'Chaqueta de cuero auténtico, ideal para invierno.', 89.99, 100, 'Activa'),
    (5, 4, 'Silla de Oficina', 'Silla ergonómica perfecta para largas horas de trabajo.', 120.00, 25, 'Pausada'),
    (6, 6, 'Pelota de Fútbol', 'Pelota profesional aprobada por FIFA.', 15.00, 150, 'Activa'),
    (7, 8, 'Libro: Cien años de soledad', 'Novela clásica de Gabriel García Márquez.', 12.50, 200, 'Activa'),
    (8, 9, 'Crema antiarrugas', 'Crema avanzada para el cuidado de la piel.', 45.00, 80, 'Activa'),
    (9, 10, 'Neumáticos', 'Neumáticos de alta resistencia para cualquier vehículo.', 85.00, 50, 'Finalizada');

	
INSERT INTO Venta (id_comprador, estado, monto)
VALUES
    (1, 'En curso', 319.98),   -- Juan compra un Smartphone y una T-Shirt
    (1, 'Concretada', 49.99),  -- Juan compra una Cafetera
    (2, 'En curso', 1000.00),  -- Ana compra una Laptop
    (3, 'Concretada', 89.99),  -- Carlos compra una Chaqueta
    (4, 'En curso', 240.00),   -- Laura compra una Silla y un libro
    (5, 'Concretada', 120.00), -- Pedro compra una Silla de oficina
    (6, 'Cancelada', 90.00),   -- Marta compra una Pelota de fútbol
    (7, 'En curso', 50.00),    -- Luis compra un libro
    (8, 'En curso', 45.00),    -- Elena compra una crema antiarrugas
    (9, 'Concretada', 85.00);  -- José compra neumáticos

INSERT INTO Envio (fecha, estado_envio, ubicacion_actual)
VALUES
    ('2024-11-01 10:00:00', 'Pendiente', 'Centro de distribución - Ciudad A'),
    ('2024-11-02 11:15:00', 'Comenzado', 'Sucursal B - Ciudad B'),
    ('2024-11-03 09:30:00', 'Finalizado', 'Cliente - Ciudad C'),
    ('2024-11-04 14:00:00', 'Pendiente', 'Centro de distribución - Ciudad D'),
    ('2024-11-05 13:45:00', 'Comenzado', 'Sucursal E - Ciudad E'),
    ('2024-11-06 16:20:00', 'Finalizado', 'Cliente - Ciudad F'),
    ('2024-11-07 08:00:00', 'Pendiente', 'Centro de distribución - Ciudad G'),
    ('2024-11-08 17:00:00', 'Comenzado', 'Sucursal H - Ciudad H'),
    ('2024-11-09 10:00:00', 'Pendiente', 'Centro de distribución - Ciudad I'),
    ('2024-11-10 11:30:00', 'Finalizado', 'Cliente - Ciudad J');


INSERT INTO DetalleEnvio (nro_envio, id_venta, estado, tipo_envio)
VALUES
    (1, 1, 'Pendiente', 'Domicilio'),
    (1, 2, 'Despachado', 'Punto entrega'),
    (1, 3, 'Pendiente', 'Domicilio'),
    (1, 4, 'Despachado', 'Domicilio'),
    (2, 5, 'En camino', 'Punto entrega'),
    (2, 6, 'Pendiente', 'Domicilio'),
    (2, 7, 'Despachado', 'Punto entrega'),
    (2, 8, 'Pendiente', 'Domicilio'),
    (2, 9, 'Despachado', 'Punto entrega');

INSERT INTO PagoVenta (id_venta, estado_pago, metodo_pago)
VALUES
    (1, 'Pendiente', 'Credito'),
    (2, 'Pagado', 'Debito'),
    (3, 'Pendiente', 'Credito'),
    (4, 'Pagado', 'Transferencia'),
    (5, 'Pendiente', 'Debito'),
    (6, 'Pagado', 'Credito'),
    (7, 'Reembolsado', 'Transferencia'),
    (8, 'Pendiente', 'Debito'),
    (9, 'Pagado', 'Credito'),
    (10, 'Pendiente', 'Transferencia');

INSERT INTO UsuarioRol (id_usuario, rol, reputacion)
VALUES
    (1, 'Comprador', 5),
	(1, 'Vendedor', 10),
    (2, 'Vendedor', 4),
    (3, 'Administrador', 0),
    (4, 'Comprador', 2),
	(5, 'Comprador', 1),
    (5, 'Vendedor', 3),
    (6, 'Comprador', 3),
    (7, 'Administrador', 0),
	(8, 'Comprador', 1),
    (8, 'Vendedor', 5),
    (9, 'Comprador', 4),
    (10, 'Vendedor', 2);

INSERT INTO Oferta (id_producto, id_comprador, precio_ofrecido, estado, fecha)
VALUES
    (1, 1, 280.00, 'Aceptada', '2024-11-10 10:00:00'),  -- Juan Pérez hace una oferta por un Smartphone
    (2, 1, 15.00, 'Pendiente', '2024-11-11 12:00:00'),  -- Juan Pérez hace una oferta por una T-Shirt
    (3, 4, 45.00, 'Rechazada', '2024-11-12 09:00:00'),  -- Laura Sánchez hace una oferta por una Cafetera
    (4, 5, 850.00, 'Aceptada', '2024-11-13 15:30:00'),  -- Pedro López hace una oferta por una Laptop
    (5, 6, 80.00, 'Pendiente', '2024-11-14 11:45:00'),  -- Marta Ruiz hace una oferta por una Chaqueta
    (6, 9, 12.00, 'Rechazada', '2024-11-15 08:20:00'),  -- José García hace una oferta por una Pelota de fútbol
    (7, 7, 10.50, 'Aceptada', '2024-11-16 16:10:00'),   -- Luis Fernández hace una oferta por un libro
    (8, 3, 40.00, 'Aceptada', '2024-11-17 13:00:00'),   -- Carlos Martínez hace una oferta por una crema antiarrugas
    (9, 2, 80.00, 'Pendiente', '2024-11-18 14:30:00'),  -- Ana Gómez hace una oferta por neumáticos
    (10, 8, 17.99, 'Aceptada', '2024-11-19 09:50:00');  -- Elena Rodríguez hace una oferta por una camiseta.
