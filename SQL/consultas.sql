-- Listar todos los productos de la plataforma
SELECT * FROM TiendaOnline.Producto;

-- Listar productos de la plataforma por categoría
SELECT * 
FROM TiendaOnline.Producto p, TiendaOnline.CategoriaProducto cp, TiendaOnline.Categoria c
WHERE c.id_categoria = cp.id_categoria
AND p.id_producto = cp.id_producto
AND c.nombre_categoria = 'Tecnología';

-- Crear una publicación para vender
INSERT INTO TiendaOnline.Publicacion (id_vendedor, id_producto, titulo, descripcion, precio, stock)
VALUES (2, 1, 'Laptop HP NUEVA', 'Laptop muy linda', 500000.00, 2);

-- Actualizar una publicación de venta
UPDATE TiendaOnline.Publicacion
SET precio = 4500.00
WHERE id_publicacion = 11;

-- Realizar una compra (Creo la venta (El monto se calcula con el detalle))
INSERT INTO TiendaOnline.Venta (id_comprador) 
VALUES (2);
-- (Agrego productos a la venta)
INSERT INTO TiendaOnline.Detalle (id_venta, id_publicacion, cantidad, precioFacturado) 
VALUES ((SELECT MAX(id_venta) FROM Venta), 11, 1, 4500.00);

-- Guardar un envío
INSERT INTO TiendaOnline.Envio (fecha, ubicacion_actual)
VALUES ('2024-12-12', 'Almacén Central');

INSERT INTO TiendaOnline.DetalleEnvio (nro_envio, id_venta, tipo_envio)
VALUES ((SELECT MAX(nro_envio) FROM Envio), 3, 'Domicilio'), ((SELECT MAX(nro_envio) FROM Envio), 5, 'Punto entrega');

-- Cancelar una compra
UPDATE TiendaOnline.Venta
SET estado = 'Cancelada'
WHERE id_venta = 1;

-- Cancelar un envío
UPDATE TiendaOnline.Envio
SET estado_envio = 'Cancelado'
WHERE nro_envio = 5;

-- Ver reputaciones (cargadas en el sistema)

SELECT nombre, reputacion AS reputacionVendedor
FROM UsuarioRol r, Usuario u
WHERE r.id_usuario = u.id_usuario
AND rol= 'Vendedor'
LIMIT 1;

SELECT nombre, reputacion AS reputacionComprador
FROM UsuarioRol r, Usuario u
WHERE r.id_usuario = u.id_usuario
AND rol= 'Comprador'
LIMIT 1;

-- Contabilizar la cantidad de ventas de la plataforma para un rango de fechas

SELECT COUNT(*) AS cantidadVentas
FROM TiendaOnline.Venta
WHERE fecha BETWEEN '2024-01-01' AND '2024-12-31';

-- Contabilizar el valor total de ventas de la plataforma para un rango de fechas

SELECT SUM(valor) AS valorTotalVentas
FROM (
SELECT cantidad * precioFacturado AS valor
FROM TiendaOnline.Detalle d, Venta v
WHERE d.id_venta = v.id_venta
AND fecha BETWEEN '2024-01-01' AND '2024-12-31'
AND v.estado = 'Concretada') AS t;

--Reputaciones:

-- Vendedor
SELECT u.nombre AS vendedor, COALESCE(COUNT(*), 0) AS reputacion_vendedor
FROM Usuario u
LEFT JOIN Publicacion p ON u.id_usuario = p.id_vendedor
LEFT JOIN Detalle d ON p.id_publicacion = d.id_publicacion
LEFT JOIN Venta v ON d.id_venta = v.id_venta AND v.estado = 'Concretada'
WHERE EXISTS (SELECT 1 FROM UsuarioRol ur WHERE ur.id_usuario = u.id_usuario AND ur.rol = 'Vendedor')
GROUP BY u.id_usuario;


-- Comprador

SELECT u.nombre AS comprador, COALESCE(COUNT(DISTINCT v.id_venta), 0) AS reputacion_comprador
FROM Usuario u
LEFT JOIN Venta v ON v.id_comprador = u.id_usuario AND v.estado = 'Concretada'
LEFT JOIN Detalle d ON v.id_venta = d.id_venta
LEFT JOIN Publicacion p ON d.id_publicacion = p.id_publicacion
WHERE EXISTS (SELECT 1 FROM UsuarioRol ur WHERE ur.id_usuario = u.id_usuario AND ur.rol = 'Comprador')
GROUP BY u.id_usuario;
