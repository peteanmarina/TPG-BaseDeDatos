-- Usuarios
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Admin', 'admin@site.com', 'Administrador', 0);
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Vendedor1', 'vendedor1@site.com', 'Vendedor', 5);
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Comprador1', 'comprador1@site.com', 'Comprador', 3);
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Vendedor2', 'vendedor2@site.com', 'Vendedor', 4);
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Comprador2', 'comprador2@site.com', 'Comprador', 2);
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Vendedor3', 'vendedor3@site.com', 'Vendedor', 6);
INSERT INTO Usuario (nombre, email, rol, reputacion) VALUES ('Comprador3', 'comprador3@site.com', 'Comprador', 7);

-- Categorías
INSERT INTO Categoria (nombre_categoria) VALUES ('Electrónicos');
INSERT INTO Categoria (nombre_categoria) VALUES ('Hogar');
INSERT INTO Categoria (nombre_categoria) VALUES ('Juguetes');
INSERT INTO Categoria (nombre_categoria) VALUES ('Ropa');
INSERT INTO Categoria (nombre_categoria) VALUES ('Deportes');
INSERT INTO Categoria (nombre_categoria) VALUES ('Libros');

-- Productos
INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Televisor 40 pulgadas', 75000.00, 1, 'Televisor HD', 10, 2);

INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Lavarropas', 50000.00, 2, 'Lavarropas automático', 5, 2);

INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Micrófono inalámbrico', 12000.00, 1, 'Micrófono de alta calidad', 30, 3);

INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Silla de oficina', 15000.00, 2, 'Silla ergonómica', 20, 3);

INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Camiseta de fútbol', 3500.00, 4, 'Camiseta oficial', 50, 4);

INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Balón de fútbol', 4000.00, 5, 'Balón de fútbol profesional', 25, 4);

INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('El código Da Vinci', 800.00, 6, 'Novela de suspenso', 100, 5);

-- Pedidos
INSERT INTO Pedido (id_comprador, fecha_pedido, estado_envio, tipo_envio) 
VALUES (3, NOW(), 'Pendiente', 'Envío rápido');
INSERT INTO Pedido (id_comprador, fecha_pedido, estado_envio, tipo_envio) 
VALUES (2, NOW(), 'Enviado', 'Envío estándar');
INSERT INTO Pedido (id_comprador, fecha_pedido, estado_envio, tipo_envio) 
VALUES (4, NOW(), 'Pendiente', 'Envío rápido');
INSERT INTO Pedido (id_comprador, fecha_pedido, estado_envio, tipo_envio) 
VALUES (5, NOW(), 'Pendiente', 'Envío económico');

-- Envíos
INSERT INTO Envio (id_pedido, estado_envio, tipo_envio) 
VALUES (1, 'Despachado', 'Envío rápido');
INSERT INTO Envio (id_pedido, estado_envio, tipo_envio) 
VALUES (2, 'Enviado', 'Envío estándar');
INSERT INTO Envio (id_pedido, estado_envio, tipo_envio) 
VALUES (3, 'Pendiente', 'Envío rápido');
INSERT INTO Envio (id_pedido, estado_envio, tipo_envio) 
VALUES (4, 'Pendiente', 'Envío económico');

-- Transacciones
INSERT INTO Transaccion (id_vendedor, id_pedido, monto, estado_pago) 
VALUES (2, 1, 75000.00, 'Pendiente');
INSERT INTO Transaccion (id_vendedor, id_pedido, monto, estado_pago) 
VALUES (3, 2, 12000.00, 'Completado');
INSERT INTO Transaccion (id_vendedor, id_pedido, monto, estado_pago) 
VALUES (3, 3, 15000.00, 'Pendiente');
INSERT INTO Transaccion (id_vendedor, id_pedido, monto, estado_pago) 
VALUES (4, 4, 3500.00, 'Completado');
