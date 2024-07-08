/*- UNION para mostrar todos los campos incluyendo los NULL de un lado y del otro */

SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo
FROM alumnos AS a 
LEFT JOIN salon AS s
ON a.idSalon = s.idsalon

UNION ALL

SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo
FROM alumnos AS a 
RIGHT JOIN salon AS s
ON a.idSalon = s.idsalon;

/* Crear vista. Como la muestras? Como la modificas? Listando las tablas, como sabes cuales son tabals y cuales son vistas? Como la borras? */

CREATE VIEW vista_alumnos AS
SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo
FROM alumnos AS a 
LEFT JOIN salon AS s
ON a.idSalon = s.idsalon

UNION ALL

SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo
FROM alumnos AS a 
RIGHT JOIN salon AS s
ON a.idSalon = s.idsalon;

/* Mostrar vista */

SELECT * FROM vista_alumnos;

/*Modificar vista*/

CREATE OR REPLACE VIEW vista_alumnos AS
SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo, a.idSalon
FROM alumnos AS a 
LEFT JOIN salon AS s
ON a.idSalon = s.idsalon

UNION ALL

SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo, a.idSalon
FROM alumnos AS a 
RIGHT JOIN salon AS s
ON a.idSalon = s.idsalon;

SELECT * FROM vista_alumnos;

/* listar tablas */

SELECT table_name, table_type 
FROM information_schema.tables
WHERE table_schema = 'escuela';

/* borrar vista */

DROP VIEW vista_alumnos;

/* crear nueva tabla */

CREATE TABLE nueva_tabla AS
SELECT a.nombre, a.fecha_ingreso, s.grado, s.grupo
FROM alumnos AS a 
LEFT JOIN salon AS s
ON a.idSalon = s.idsalon
