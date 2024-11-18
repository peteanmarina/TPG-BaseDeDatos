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

INSERT INTO Producto (id_vendedor, nombre, precio, id_categoria, descripcion, stock)
VALUES
    (2, 'Smartphone', 299.99, 1, 'Smartphone de última generación', 50),
    (2, 'T-Shirt', 19.99, 2, 'Camiseta de algodón, talla M', 200),
    (2, 'Cafetera', 49.99, 3, 'Cafetera de 1.5 litros', 30),
    (3, 'Laptop', 999.99, 1, 'Laptop portátil con procesador i7', 15),
    (4, 'Chaqueta', 89.99, 2, 'Chaqueta de cuero', 100),
    (5, 'Silla de oficina', 120.00, 4, 'Silla ergonómica', 25),
    (6, 'Pelota de fútbol', 15.00, 6, 'Pelota de fútbol profesional', 150),
    (7, 'Libro "Cien años de soledad"', 12.50, 8, 'Novela de Gabriel García Márquez', 200),
    (8, 'Crema antiarrugas', 45.00, 9, 'Crema para el cuidado de la piel', 80),
    (9, 'Neumáticos', 85.00, 10, 'Neumáticos para automóviles', 50),
    (10, 'Camiseta de algodón', 19.99, 2, 'Camiseta básica en varios colores', 180),
    (2, 'Auriculares Bluetooth', 59.99, 1, 'Auriculares inalámbricos con cancelación de ruido', 100),
    (4, 'Smartwatch', 199.99, 1, 'Reloj inteligente con monitor de actividad', 70);

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
    (2, 'Vendedor', 4),
    (3, 'Administrador', 0),
    (4, 'Comprador', 2),
    (5, 'Vendedor', 3),
    (6, 'Comprador', 3),
    (7, 'Administrador', 0),
    (8, 'Vendedor', 5),
    (9, 'Comprador', 4),
    (10, 'Vendedor', 2);

