

-- 1. Valor total de préstamos por año
CREATE VIEW Punto_1 AS
SELECT EXTRACT(YEAR FROM fecha) AS ano,
       SUM(valor_otorgado) AS total_prestamos
FROM prestamo
GROUP BY EXTRACT(YEAR FROM fecha)


-- 2. Valor total de los préstamos de un año, mes para los bancos
CREATE  VIEW Punto_2 AS
SELECT b.nombre AS banco,
       EXTRACT(YEAR FROM p.fecha) AS anio,
       EXTRACT(MONTH FROM p.fecha) AS mes,
       SUM(p.valor_otorgado) AS totalprestamos
FROM prestamo p
JOIN banco b ON p.idbanco = b.id
GROUP BY b.nombre, EXTRACT(YEAR FROM p.fecha), EXTRACT(MONTH FROM p.fecha)


-- 3. Saldo de cada prEstamo
CREATE  VIEW Punto_3 AS
SELECT p.id AS idprestamo,
       d.nombre AS deudor,
       p.valor_otorgado,
       NVL(SUM(a.valor_abono),0) AS totalabonado,
       (p.valor_otorgado - NVL(SUM(a.valor_abono),0)) AS saldo
FROM prestamo p
JOIN deudor d ON p.iddeudor = d.id
LEFT JOIN abono a ON p.id = a.idprestamo
GROUP BY p.id, d.nombre, p.valor_otorgado

-- 4. nombre y cédula del deudor, banco, fecha y valor del préstamo
CREATE VIEW Punto_4 AS
SELECT d.nombre AS deudor,
       d.numero_doc AS cedula,
       b.nombre AS banco,
       p.fecha,
       p.valor_otorgado
FROM prestamo p
JOIN deudor d ON p.iddeudor = d.id
JOIN banco b ON p.idbanco = b.id
ORDER BY d.tipo_doc, d.numero_doc

-- 5. Cantidad de prestamos por deudor
CREATE VIEW Punto_5 AS
SELECT d.nombre AS deudor,
NVL(COUNT(p.id),0) AS totalprestamos
FROM deudor d
LEFT JOIN prestamo p ON d.id = p.iddeudor
GROUP BY d.nombre

-- 6. Total de prestamos por año con fila extra de totales 
CREATE VIEW Punto_6 AS
SELECT NVL(TO_CHAR(EXTRACT(YEAR FROM fecha)), 'Total') AS ano,
       SUM(valor_otorgado) AS total_prestamos
FROM prestamo
GROUP BY ROLLUP(EXTRACT(YEAR FROM fecha))

-- 7. Deudor que ha tenido prestamos en todos los bancos existentes
CREATE VIEW Punto_7 AS
SELECT d.nombre AS deudor
FROM deudor d
JOIN prestamo p ON d.id = p.iddeudor
GROUP BY d.nombre
HAVING COUNT(DISTINCT p.idbanco) = (
SELECT COUNT(*) 
FROM banco
) 

-- 8. Bancos con promedio de prestamos por año mayor al promedio general 

CREATE VIEW Punto_8 AS
SELECT b.nombre AS banco,
       t.ano,
       t.promedio_general,
       t.promedio_banco
FROM (
  SELECT idbanco,
         EXTRACT(YEAR FROM fecha) AS ano,
         SUM(valor_otorgado)/COUNT(*) AS promedio_banco,
         (SELECT SUM(valor_otorgado)/COUNT(*) 
          FROM prestamo p2 
          WHERE EXTRACT(YEAR FROM p2.fecha) = EXTRACT(YEAR FROM p1.fecha)
         ) AS promedio_general
  FROM prestamo p1
  GROUP BY idbanco, EXTRACT(YEAR FROM fecha)
) t  
JOIN banco b ON t.idbanco = b.id
WHERE t.promedio_banco > t.promedio_general;


-- 10. Tabla que muestra el valor total de préstamos por año, mes y género del deudor
CREATE VIEW Punto_10 AS
SELECT NVL(TO_CHAR(ano), 'Totales') AS ano,
       NVL(TO_CHAR(mes, 'FM00'), 'Totales') AS mes,
       SUM(CASE WHEN genero = 'F' THEN valor_otorgado ELSE 0 END) AS femenino,
       SUM(CASE WHEN genero = 'M' THEN valor_otorgado ELSE 0 END) AS masculino,
       SUM(valor_otorgado) AS total
FROM (
  SELECT EXTRACT(YEAR FROM p.fecha) AS ano,
         EXTRACT(MONTH FROM p.fecha) AS mes,
         d.genero,
         p.valor_otorgado
  FROM prestamo p
 JOIN deudor d ON p.iddeudor = d.id
)
GROUP BY ROLLUP(ano, mes);

-- 9.Udatear los datos
UPDATE prestamo p
SET pagado = 'si'
WHERE valor_otorgado <= (
  SELECT NVL(SUM(a.valor_abono),0)
  FROM abono a
  WHERE a.idprestamo = p.id
);
