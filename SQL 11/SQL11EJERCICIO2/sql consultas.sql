/* Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos. */

SELECT DISTINCT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
FROM cliente
JOIN pedido ON cliente.id = pedido.id_cliente
ORDER BY cliente.nombre, cliente.apellido1, cliente.apellido2;

/* Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados 
alfabéticamente. */

SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, c.apellido1 AS cliente_apellido1, c.apellido2 AS cliente_apellido2, c.ciudad AS cliente_ciudad, c.categoria AS cliente_categoria,
p.id AS pedido_id, p.total AS pedido_total, p.fecha AS pedido_fecha, p.id_cliente AS pedido_id_cliente, p.id_comercial AS pedido_id_comercial
FROM cliente AS c
JOIN pedido AS p
ON c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

/* Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
El listado debe mostrar los datos de los comerciales ordenados alfabéticamente. */

SELECT comercial.id AS comercial_id, comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1, comercial.apellido2 AS comercial_apellido2, comercial.comision AS comercial_comision,
p.id AS pedido_id, p.total AS pedido_total, p.fecha AS pedido_fecha, p.id_cliente AS pedido_id_cliente, p.id_comercial AS pedido_id_comercial
FROM comercial
JOIN pedido AS p
ON comercial.id = p.id_comercial
ORDER BY comercial.nombre, comercial.apellido1, comercial.apellido2;

/* Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido. */

SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, c.apellido1 AS cliente_apellido1, c.apellido2 AS cliente_apellido2, c.ciudad AS cliente_ciudad, c.categoria AS cliente_categoria,
p.id AS pedido_id, p.total AS pedido_total, p.fecha AS pedido_fecha, 
comercial.id AS comercial_id, comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1, comercial.apellido2 AS comercial_apellido2, comercial.comision AS comercial_comision
FROM cliente AS c
JOIN pedido AS p
ON c.id = p.id_cliente
JOIN comercial ON p.id_comercial = comercial.id
ORDER BY c.nombre, c.apellido1, c.apellido2;

/* Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €. */

SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, c.apellido1 AS cliente_apellido1, c.apellido2 AS cliente_apellido2, c.ciudad AS cliente_ciudad, c.categoria AS cliente_categoria,
p.id AS pedido_id, p.total AS pedido_total, p.fecha AS pedido_fecha
FROM cliente AS c
JOIN pedido AS p
ON c.id = p.id_cliente
WHERE YEAR(p.fecha) = 2017 AND p.total BETWEEN 300 AND 1000
ORDER BY c.nombre, c.apellido1, c.apellido2;

/* Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno. */

SELECT comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1, comercial.apellido2 AS comercial_apellido2
FROM comercial
JOIN pedido AS p ON comercial.id = p.id_comercial
JOIN cliente AS c ON p.id_cliente = c.id
WHERE c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';

/* Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega. */

SELECT DISTINCT c.nombre AS cliente_nombre
FROM cliente AS c
JOIN pedido AS p ON c.id = p.id_cliente
JOIN comercial ON p.id_comercial = comercial.id
WHERE comercial.nombre = 'Daniel' AND comercial.apellido1 = 'Sáez' AND comercial.apellido2 = 'Vega'
ORDER BY c.nombre;

/* Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes. */

SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, c.apellido1 AS cliente_apellido1, c.apellido2 AS cliente_apellido2, c.ciudad AS cliente_ciudad, c.categoria AS cliente_categoria,
p.id AS pedido_id, p.total AS pedido_total, p.fecha AS pedido_fecha, p.id_comercial AS pedido_id_comercial
FROM cliente AS c
LEFT JOIN pedido AS p ON c.id = p.id_cliente
ORDER BY c.apellido1, c.apellido2, c.nombre;

/* Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales. */

SELECT comercial.id AS comercial_id, comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1, comercial.apellido2 AS comercial_apellido2, comercial.comision AS comercial_comision, 
p.id AS pedido_id, p.total AS pedido_total, p.fecha AS pedido_fecha, p.id_cliente AS pedido_id_cliente
FROM comercial
LEFT JOIN pedido AS p ON comercial.id = p.id_comercial
ORDER BY comercial.apellido1, comercial.apellido2, comercial.nombre;

/* Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido. */

SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, c.apellido1 AS cliente_apellido1, c.apellido2 AS cliente_apellido2, c.ciudad AS cliente_ciudad, c.categoria AS cliente_categoria
FROM cliente AS c
LEFT JOIN pedido AS p ON c.id = p.id_cliente
WHERE p.id IS NULL;

/* Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido. */

SELECT comercial.id AS comercial_id, comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1, comercial.apellido2 AS comercial_apellido2, comercial.comision AS comercial_comision
FROM comercial
LEFT JOIN pedido AS p ON comercial.id = p.id_comercial
WHERE p.id IS NULL;


