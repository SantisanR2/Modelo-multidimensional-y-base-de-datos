USE Estudiante_48_202314;
--------------------- Modelo de hecho movimiento
CREATE TABLE Fecha (
ID_Fecha INT,
Fecha DATE, 
Dia TINYINT, 
Mes VARCHAR(20), 
Anio SMALLINT,
Numero_semana_ISO TINYINT,
PRIMARY KEY(ID_Fecha));

CREATE TABLE Producto (
ID_Producto_DWH SMALLINT, 
ID_Producto_T SMALLINT, 
Nombre VARCHAR(100),
Marca VARCHAR(30), 
Paquete_de_compra VARCHAR(20), 
Color VARCHAR(10), 
Necesita_refrigeracion BOOLEAN, 
Dias_tiempo_entrega SMALLINT, 
cantidad_por_salida INT, 
Precio_minorista_recomendado FLOAT, 
Paquete_de_venta VARCHAR(20), 
Precio_unitario FLOAT,
PRIMARY KEY(ID_Producto_DWH));

CREATE TABLE Proveedor(
ID_proveedor_DWH INT,
ID_proveedor_T INT,
Nombre VARCHAR(20),
Categoria VARCHAR(20),
Contacto_principal VARCHAR(30),
Referencia VARCHAR(30),
Dias_pago INT, 
Codigo_postal INT,
PRIMARY KEY(ID_proveedor_DWH)
);

CREATE TABLE TipoTransaccion(
ID_Tipo_transaccion_DWH TINYINT,
ID_Tipo_transaccion_T TINYINT,  
Tipo VARCHAR(20),
PRIMARY KEY(ID_Tipo_transaccion_DWH)
);

CREATE TABLE Cliente (
ID_Cliente_DWH INT,
ID_Cliente_T INT,
Nombre VARCHAR(20),
ClienteFactura VARCHAR(20),
ID_CiudadEntrega INT,
LimiteCredito INT,
FechaAperturaCuenta INT,
DiasPago INT,
NombreGrupoCompra VARCHAR(20),
NombreCategoria VARCHAR(20),
PRIMARY KEY(ID_Cliente_DWH),
CONSTRAINT FK_Fecha FOREIGN KEY (FechaAperturaCuenta) REFERENCES Fecha (ID_Fecha));

CREATE TABLE Movimiento (
ID_Fecha INT,
ID_Producto_DWH SMALLINT,
ID_Proveedor_DWH INT,
ID_Cliente_DWH INT,
ID_Tipo_transaccion_DWH TINYINT,
Cantidad INT,
CONSTRAINT PK_Movimiento PRIMARY KEY CLUSTERED (ID_Fecha, ID_Producto_DWH, ID_Cliente_DWH, ID_Tipo_transaccion_DWH),
CONSTRAINT FK_Fecha_Movimiento FOREIGN KEY (ID_Fecha) REFERENCES Fecha (ID_Fecha),
CONSTRAINT FK_Producto FOREIGN KEY (ID_Producto_DWH) REFERENCES Producto (ID_Producto_DWH),
CONSTRAINT FK_Proveedor FOREIGN KEY (ID_Proveedor_DWH) REFERENCES Proveedor (ID_Proveedor_DWH),
CONSTRAINT FK_Cliente FOREIGN KEY (ID_Cliente_DWH) REFERENCES Cliente (ID_Cliente_DWH),
CONSTRAINT FK_Tipo_transaccion FOREIGN KEY (ID_Tipo_transaccion_DWH) REFERENCES TipoTransaccion (ID_Tipo_transaccion_DWH));

INSERT INTO Fecha (ID_Fecha, Fecha, Dia, Mes, Anio, Numero_semana_ISO)
VALUES
    (1, '2023-08-28', 28, 'Agosto', 2023, 35),
    (2, '2023-08-29', 29, 'Agosto', 2023, 35),
    (3, '2023-08-30', 30, 'Agosto', 2023, 35),
    (4, '2023-08-31', 31, 'Agosto', 2023, 35),
    (5, '2023-09-01', 1, 'Septiembre', 2023, 36);

INSERT INTO Producto (ID_Producto_DWH, ID_Producto_T, Nombre, Marca, Paquete_de_compra, Color, Necesita_refrigeracion, Dias_tiempo_entrega, cantidad_por_salida, Precio_minorista_recomendado, Paquete_de_venta, Precio_unitario)
VALUES
    (1, 101, 'Producto1', 'Marca1', 'Paquete1', 'Rojo', 0, 2, 100, 10.99, 'Paquete1', 5.99),
    (2, 102, 'Producto2', 'Marca2', 'Paquete2', 'Verde', 1, 3, 50, 5.49, 'Paquete2', 2.99),
    (3, 103, 'Producto3', 'Marca3', 'Paquete3', 'Azul', 0, 1, 200, 12.99, 'Paquete3', 9.99),
    (4, 104, 'Producto4', 'Marca4', 'Paquete4', 'Amarillo', 1, 2, 75, 8.49, 'Paquete4', 4.99),
    (5, 105, 'Producto5', 'Marca5', 'Paquete5', 'Blanco', 0, 4, 150, 15.99, 'Paquete5', 11.99);

INSERT INTO Proveedor (ID_proveedor_DWH, ID_proveedor_T, Nombre, Categoria, Contacto_principal, Referencia, Dias_pago, Codigo_postal)
VALUES
    (1, 201, 'Proveedor1', 'Categoria1', 'Contacto1', 'Referencia1', 30, 12345),
    (2, 202, 'Proveedor2', 'Categoria2', 'Contacto2', 'Referencia2', 45, 67890),
    (3, 203, 'Proveedor3', 'Categoria3', 'Contacto3', 'Referencia3', 60, 54321),
    (4, 204, 'Proveedor4', 'Categoria4', 'Contacto4', 'Referencia4', 30, 98765),
    (5, 205, 'Proveedor5', 'Categoria5', 'Contacto5', 'Referencia5', 45, 13579);

INSERT INTO TipoTransaccion (ID_Tipo_transaccion_DWH, ID_Tipo_transaccion_T, Tipo)
VALUES
    (1, 113, 'Compra'),
    (2, 112, 'Venta'),
    (3, 113, 'Devolución'),
    (4, 114, 'Transferencia'),
    (5, 115, 'Ajuste');

INSERT INTO Cliente (ID_Cliente_DWH, ID_Cliente_T, Nombre, ClienteFactura, ID_CiudadEntrega, LimiteCredito, FechaAperturaCuenta, DiasPago, NombreGrupoCompra, NombreCategoria)
VALUES
    (1, 401, 'Cliente1', 'ClienteFactura1', 101, 1000, 1, 30, 'GrupoCompra1', 'Categoria1'),
    (2, 402, 'Cliente2', 'ClienteFactura2', 102, 1500, 2, 45, 'GrupoCompra2', 'Categoria2'),
    (3, 403, 'Cliente3', 'ClienteFactura3', 103, 2000, 3, 30, 'GrupoCompra3', 'Categoria3'),
    (4, 404, 'Cliente4', 'ClienteFactura4', 104, 800, 4, 60, 'GrupoCompra4', 'Categoria4'),
    (5, 405, 'Cliente5', 'ClienteFactura5', 105, 1200, 5, 45, 'GrupoCompra5', 'Categoria5');

INSERT INTO Movimiento (ID_Fecha, ID_Producto_DWH, ID_Cliente_DWH, ID_Tipo_transaccion_DWH, Cantidad)
VALUES
    (1, 1, 1, 1, 50),
    (2, 2, 2, 2, 30),
    (3, 3, 3, 3, 25),
    (4, 4, 4, 4, 40),
    (5, 5, 5, 5, 60);

SELECT
    Fecha.Fecha AS FechaMovimiento,
    Cliente.Nombre AS Cliente,
    Proveedor.Nombre AS Proveedor,
    TipoTransaccion.Tipo AS TipoTransaccion,
    SUM(Movimiento.Cantidad) AS TotalProductosMovidos
FROM Movimiento
INNER JOIN Fecha ON Movimiento.ID_Fecha = Fecha.ID_Fecha
LEFT JOIN Cliente ON Movimiento.ID_Cliente_DWH = Cliente.ID_Cliente_DWH
LEFT JOIN Proveedor ON Movimiento.ID_Proveedor_DWH = Proveedor.ID_proveedor_DWH
INNER JOIN TipoTransaccion ON Movimiento.ID_Tipo_transaccion_DWH = TipoTransaccion.ID_Tipo_transaccion_DWH
WHERE Fecha.Fecha BETWEEN '2023-08-28' AND '2023-09-01'
GROUP BY Fecha.Fecha, Cliente.Nombre, Proveedor.Nombre, TipoTransaccion.Tipo
ORDER BY Fecha.Fecha;
