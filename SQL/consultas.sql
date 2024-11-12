
-- Listar todos los productos de la plataforma
SELECT * FROM Producto;

-- Listar productos por categoría (ejemplo para 'Electrónicos')
SELECT * FROM Producto WHERE id_categoria = (SELECT id_categoria FROM Categoria WHERE nombre_categoria = 'Electrónicos');

-- Crear una publicación para vender
INSERT INTO Producto (nombre, precio, id_categoria, descripcion, stock, id_vendedor) 
VALUES ('Laptop Gamer', 150000.00, 1, 'Laptop de alta gama para videojuegos', 5, 2);

-- Actualizar una publicación de venta
UPDATE Producto SET precio = 145000.00 WHERE nombre = 'Laptop Gamer';

-- Realizar una compra
INSERT INTO Pedido (id_comprador, fecha_pedido, estado_envio, tipo_envio) 
VALUES (3, NOW(), 'Pendiente', 'Envío estándar');

-- Guardar un envío
INSERT INTO Envio (id_pedido, estado_envio, tipo_envio) 
VALUES (1, 'En camino', 'Envío rápido');

-- Cancelar una compra
UPDATE Pedido SET estado_envio = 'Cancelado' WHERE id_pedido = 1;

-- Cancelar un envío
UPDATE Envio SET estado_envio = 'Cancelado' WHERE id_envio = 1;

-- Ver reputaciones (para vendedores)
SELECT nombre, reputacion FROM Usuario WHERE rol = 'Vendedor';

-- Contabilizar la cantidad de ventas para un rango de fechas
SELECT COUNT(*) FROM Pedido WHERE fecha_pedido BETWEEN '2024-11-01' AND '2024-11-30';

-- Contabilizar el valor total de ventas para un rango de fechas
SELECT SUM(Transaccion.monto) FROM Transaccion
INNER JOIN Pedido ON Transaccion.id_pedido = Pedido.id_pedido
WHERE Pedido.fecha_pedido BETWEEN '2024-11-01' AND '2024-11-30';
