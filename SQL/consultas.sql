-- Listar todos los productos de la plataforma
SELECT * FROM TiendaOnline.Producto;

-- Listar productos de la plataforma por categoría (ejemplo: "Electrónica")
SELECT * FROM TiendaOnline.Producto
WHERE id_categoria = (SELECT id_categoria FROM TiendaOnline.Categoria WHERE nombre_categoria = 'Electrónica');

-- Crear una publicación para vender (ejemplo: Publicar un producto de "Laptop")
INSERT INTO TiendaOnline.Producto (id_vendedor, nombre, precio, id_categoria, descripcion, stock)
VALUES (1, 'Laptop HP', 500.00, (SELECT id_categoria FROM TiendaOnline.Categoria WHERE nombre_categoria = 'Electrónica'), 'Laptop HP con 8GB RAM', 10);

-- Actualizar una publicación de venta (ejemplo: Cambiar el precio de la "Laptop HP" a 450.00)
UPDATE TiendaOnline.Producto
SET precio = 450.00
WHERE nombre = 'Laptop HP';

-- Realizar una compra (ejemplo: Comprar un producto)
INSERT INTO TiendaOnline.Venta (id_comprador, estado, monto, fecha)
VALUES (2, 'En curso', 450.00, NOW());

-- Guardar un envío (ejemplo: Enviar una compra)
INSERT INTO TiendaOnline.Envio (fecha, estado_envio, ubicacion_actual)
VALUES (NOW(), 'Pendiente', 'Almacén Central');

-- Cancelar una compra (ejemplo: Cancelar la compra de ID 1)
UPDATE TiendaOnline.Venta
SET estado = 'Cancelada'
WHERE id_venta = 1;

-- Cancelar un envío (ejemplo: Cancelar el envío de ID 1)
UPDATE TiendaOnline.Envio
SET estado_envio = 'Cancelado'
WHERE nro_envio = 1;

-- Ver reputaciones (ejemplo para un vendedor y un comprador)
SELECT nombre, reputacion_vendedor FROM TiendaOnline.Usuario WHERE id_usuario = 1; -- Reputación del vendedor
SELECT nombre, reputacion_comprador FROM TiendaOnline.Usuario WHERE id_usuario = 2; -- Reputación del comprador

-- Contabilizar la cantidad de ventas de la plataforma para un rango de fechas (ejemplo: del 2024-01-01 al 2024-12-31)
SELECT COUNT(*) AS cantidad_ventas
FROM TiendaOnline.Venta
WHERE fecha BETWEEN '2024-01-01' AND '2024-12-31';

-- Contabilizar el valor total de ventas de la plataforma para un rango de fechas (ejemplo: del 2024-01-01 al 2024-12-31)
SELECT SUM(monto) AS valor_total_ventas
FROM TiendaOnline.Venta
WHERE fecha BETWEEN '2024-01-01' AND '2024-12-31';
