# Catena-Matias-AP2
SEMINARIO DE PRÁCTICA DE INFORMÁTICA - INF275-11807  Trabajo Práctico N° 2

Creación de las Tablas MySQL
```
CREATE DATABASE libreria_jugueteria;

USE libreria_jugueteria;

CREATE TABLE producto (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT,
    stock_minimo INT
);

CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) UNIQUE,
    contraseña VARCHAR(100)
);

CREATE TABLE venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    total DECIMAL(10,2),
    id_empleado INT,
    
    FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado)
);

CREATE TABLE detalle_venta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    codigo_producto INT,
    cantidad INT,
    subtotal DECIMAL(10,2),

    FOREIGN KEY (id_venta)
    REFERENCES venta(id_venta),

    FOREIGN KEY (codigo_producto)
    REFERENCES producto(codigo)
);

CREATE TABLE movimiento_stock (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_movimiento VARCHAR(50),
    fecha DATE,
    cantidad INT,
    codigo_producto INT,
    id_empleado INT,

    FOREIGN KEY (codigo_producto)
    REFERENCES producto(codigo),

    FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado)
);
```
Inserción, Consulta y Borrado de Registros

Inserción de Registros
```
INSERT INTO producto(nombre, categoria, precio, stock, stock_minimo)
VALUES ('Cuaderno A4', 'Librería', 3500, 50, 10);

INSERT INTO empleado(nombre, usuario, contraseña)
VALUES ('Juan Pérez', 'juanp', '1234');
```
Consulta de Registros
```
SELECT * FROM producto;

SELECT nombre, stock
FROM producto;

SELECT *
FROM venta;
```
Actualización de Registros
```
UPDATE producto
SET stock = 45
WHERE codigo = 1;
```
Borrado de Registros
```
DELETE FROM producto
WHERE codigo = 1;
```
Presentación de las Consultas SQL

Consulta de productos con stock bajo
```
SELECT nombre, stock
FROM producto
WHERE stock <= stock_minimo;
Consulta de ventas registradas
SELECT id_venta, fecha, total
FROM venta;
```
Consulta del total vendido
```
SELECT SUM(total) AS total_vendido
FROM venta;
```
Consulta de movimientos de stock
```
SELECT tipo_movimiento, fecha, cantidad
FROM movimiento_stock;
```
Consulta de productos por categoría
```
SELECT nombre, categoria
FROM producto
WHERE categoria = 'Librería';
```
