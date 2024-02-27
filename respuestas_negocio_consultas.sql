/*
1
*/
SELECT COUNT(*) FROM `customer` WHERE `apellido` like "M%";
/*
2
*/
SELECT * FROM `customer` WHERE `fecha_nacimiento` = CURRENT_DATE;

/*
3
*/
SELECT
    DATE_FORMAT(`fecha_compra`, '%Y-%m-%d') AS Dia,
    COUNT(*) AS CantidadVentas,
    COUNT(DISTINCT `fk_id_item`) AS CantidadProductosVendidos,
    SUM(`total_monto`) AS MontoTotalTransaccionado
FROM `order`
WHERE YEAR(`fecha_compra`) = 2020 AND MONTH(`fecha_compra`) = 1
GROUP BY Dia;

/*
4
*/
SELECT
    YEAR(`fecha_compra`) AS Año,
    MONTH(`fecha_compra`) AS Mes,
    vendedor.nombre AS NombreVendedor,
    vendedor.apellido AS ApellidoVendedor,
    COUNT(*) AS CantidadVendida,
    SUM(`total_monto`) AS MontoTotalTransaccionado
FROM `order`
JOIN usuarios AS vendedor ON `order`.fk_id_usuario = vendedor.idUsuarios
JOIN item ON `order`.fk_id_item = item.idItem
WHERE YEAR(`fecha_compra`) = 2019 AND item.fk_categoria_id IN(2,3,6)
GROUP BY Año, Mes, NombreVendedor, ApellidoVendedor
ORDER BY Año, Mes, MontoTotalTransaccionado DESC
LIMIT 5;

/*
5
*/
DELIMITER //
CREATE PROCEDURE PoblarTablaPrecioEstadoItems()
BEGIN
    DECLARE FechaActual DATETIME;

    SET FechaActual = NOW();

    INSERT INTO precioestado (idItem, precio, estado, fecha_registro)
    SELECT idItem, precio, estado, FechaActual
    FROM Items;
END;
//
DELIMITER ;

/*
6
*/
INSERT INTO CategoriasHistorico (idCategoria, nombre, descripcion, lastUpdated)
SELECT idCategoria, nombre, descripcion, lastUpdated
FROM (
    SELECT idCategoria, nombre, descripcion, lastUpdated,
           ROW_NUMBER() OVER (PARTITION BY idCategoria ORDER BY lastUpdated DESC) AS rn
    FROM Categorias
) sub
WHERE rn = 1;


/*
Consultas a la tabla Inventario (Stock)
*/

-- Cantidad disponible de un item

SELECT cantidad_disponible
FROM Inventario
WHERE fk_id_item = Producto; -- Producto hace referencia a cualquier producto que haya en stock.

-- Consulta todos los items del stock que tengan menos de 10 unidades

SELECT fk_id_item, cantidad_disponible
FROM Inventario
WHERE cantidad_disponible < 10;

-- Actualizar el stock del inventario

UPDATE Inventario
SET cantidad_disponible = cantidad_disponible - 5 -- Resta unidades al stock
WHERE fk_id_item = Producto; -- Producto hace referencia a cualquier producto que haya en stock








