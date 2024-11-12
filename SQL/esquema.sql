-- Tabla Usuario
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    rol ENUM('Administrador', 'Vendedor', 'Comprador') NOT NULL,
    reputacion INT DEFAULT 0 CHECK (reputacion >= 0)
);

-- Tabla Categoria
CREATE TABLE Categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0), -- Falta que sea mayor a una constante
    id_categoria BIGINT UNSIGNED,
    descripcion TEXT,
    stock INT CHECK (stock >= 0),
    id_vendedor BIGINT UNSIGNED,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_vendedor) REFERENCES Usuario(id_usuario)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_comprador BIGINT UNSIGNED,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_envio ENUM('Pendiente', 'Despachado', 'En camino', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    tipo_envio VARCHAR(50),
    FOREIGN KEY (id_comprador) REFERENCES Usuario(id_usuario)
);

-- Tabla Envio
CREATE TABLE Envio (
    id_envio SERIAL PRIMARY KEY,
    id_pedido BIGINT UNSIGNED,
    estado_envio ENUM('Pendiente', 'Despachado', 'En camino', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    tipo_envio VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Tabla Transaccion
CREATE TABLE Transaccion (
    id_transaccion SERIAL PRIMARY KEY,
    id_vendedor BIGINT UNSIGNED,
    id_pedido BIGINT UNSIGNED,
    monto DECIMAL(10, 2) NOT NULL CHECK (monto > 0),
    estado_pago ENUM('Pendiente', 'Pagado', 'Reembolsado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_vendedor) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
