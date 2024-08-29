-- Vehículos que no han sido vendidos
SELECT * 
FROM Vehiculos 
WHERE idVehiculo NOT IN (SELECT idVehiculo FROM Ventas);

-- Detalles de ventas en enero de 2020
SELECT V.Folio, V.FechaVenta, V.MontoVenta, C.NombreCliente, C.RutCliente, 
       Ve.Patente, M.NombreMarca, Ve.Modelo
FROM Ventas V
JOIN Clientes C ON V.idCliente = C.idCliente
JOIN Vehiculos Ve ON V.idVehiculo = Ve.idVehiculo
JOIN Marcas M ON Ve.idMarca = M.idMarca
WHERE V.FechaVenta BETWEEN '2020-01-01' AND '2020-01-31';

-- Ventas por mes y marca en el año 2020
SELECT MONTH(V.FechaVenta) AS Mes, M.NombreMarca, SUM(V.MontoVenta) AS TotalVentas
FROM Ventas V
JOIN Vehiculos Ve ON V.idVehiculo = Ve.idVehiculo
JOIN Marcas M ON Ve.idMarca = M.idMarca
WHERE YEAR(V.FechaVenta) = 2020
GROUP BY MONTH(V.FechaVenta), M.NombreMarca;

-- Clientes y empresas en un solo conjunto de resultados
SELECT C.RutCliente, C.NombreCliente 
FROM Clientes C
UNION
SELECT E.RutEmpresa, E.NombreEmpresa 
FROM Empresas E;