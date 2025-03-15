
/*


--Creacion de tablas
CREATE TABLE banco (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL UNIQUE -- Se mantiene la unicidad sin CONSTRAINT
);

CREATE TABLE deudor (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  tipo_doc VARCHAR2(20) NOT NULL,
  numero_doc VARCHAR2(20) NOT NULL,
  genero CHAR(1) NOT NULL,
  UNIQUE (tipo_doc, numero_doc) -- Se mantiene la clave natural sin CONSTRAINT
);

CREATE TABLE prestamo (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  iddeudor NUMBER(10,0) NOT NULL,
  idbanco NUMBER(10,0) NOT NULL,
  fecha DATE DEFAULT SYSDATE NOT NULL,
  valor_otorgado NUMBER(10,2) DEFAULT 0 NOT NULL,
  pagado VARCHAR2(2) DEFAULT 'no' NOT NULL,
  FOREIGN KEY (iddeudor) REFERENCES deudor(id), -- Se mantiene la relación sin CONSTRAINT
  FOREIGN KEY (idbanco) REFERENCES banco(id), -- Se mantiene la relación sin CONSTRAINT
  UNIQUE (idbanco, iddeudor, fecha) -- Se mantiene la unicidad sin CONSTRAINT
);

CREATE TABLE abono (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  idprestamo NUMBER(10,0) NOT NULL,
  fecha DATE NOT NULL,
  valor_abono NUMBER(10,2) NOT NULL,
  FOREIGN KEY (idprestamo) REFERENCES prestamo(id), -- Se mantiene la relación sin CONSTRAINT
  UNIQUE (idprestamo, fecha) -- Se mantiene la unicidad sin CONSTRAINT
);

--Insertar Bancos
INSERT INTO banco (nombre) VALUES ('Bancolombia');
INSERT INTO banco (nombre) VALUES ('Banco de Bogota');
INSERT INTO banco (nombre) VALUES ('Davivienda');
INSERT INTO banco (nombre) VALUES ('Banco de Occidente');
INSERT INTO banco (nombre) VALUES ('Banco Popular');
INSERT INTO banco (nombre) VALUES ('Banco Caja Social');
INSERT INTO banco (nombre) VALUES ('Banco Av Villas');
INSERT INTO banco (nombre) VALUES ('Banco BBVA ');
INSERT INTO banco (nombre) VALUES ('Banco Santander ');
INSERT INTO banco (nombre) VALUES ('Banco Pichincha');

--Insertar deudores
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Miguel Angel Acuña', 'DNI', '1014871621', 'M');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Samuel Felipe Manrique', 'DNI', '102863718', 'M');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Juan Pablo Mota', 'DNI', '1073846371', 'M');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Carolina Rincon', 'DNI', '7382658495', 'F');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Andres Molina', 'DNI', '7265484563', 'M');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Catalina Perez', 'DNI', '2739163528', 'F');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Jorge Gomez', 'DNI', '95684567646', 'M');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Sofía Hernandez', 'DNI', '7689561122', 'F');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Daniela Restrepo', 'DNI', '9271628367', 'F');
INSERT INTO deudor (nombre, tipo_doc, numero_doc, genero) VALUES ('Alejandro Cruz', 'DNI', '3831527123', 'M');




--INSERTAR PRESTAMOS Y ABONOS

INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 3, TO_DATE('2017-03-14','YYYY-MM-DD'), 7358421);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 8, TO_DATE('2013-11-22','YYYY-MM-DD'), 9245687);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 1, TO_DATE('2015-06-05','YYYY-MM-DD'), 5832147);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 10, TO_DATE('2020-01-30','YYYY-MM-DD'), 6578943);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 6, TO_DATE('2011-09-15','YYYY-MM-DD'), 8723410);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 4, TO_DATE('2024-12-02','YYYY-MM-DD'), 5001234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 7, TO_DATE('2010-04-18','YYYY-MM-DD'), 9432100);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 2, TO_DATE('2018-03-22','YYYY-MM-DD'), 6789451);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 5, TO_DATE('2019-08-09','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 9, TO_DATE('2023-12-25','YYYY-MM-DD'), 7345890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 6, TO_DATE('2012-05-10','YYYY-MM-DD'), 6894321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 2, TO_DATE('2014-07-19','YYYY-MM-DD'), 9554321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 8, TO_DATE('2016-08-08','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 7, TO_DATE('2022-10-30','YYYY-MM-DD'), 6456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 5, TO_DATE('2013-11-11','YYYY-MM-DD'), 7890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 4, TO_DATE('2011-02-27','YYYY-MM-DD'), 5123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 10, TO_DATE('2017-07-14','YYYY-MM-DD'), 9786543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 1, TO_DATE('2010-05-03','YYYY-MM-DD'), 6453210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 3, TO_DATE('2025-10-22','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 9, TO_DATE('2019-09-15','YYYY-MM-DD'), 8675321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 8, TO_DATE('2014-04-01','YYYY-MM-DD'), 9345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 4, TO_DATE('2016-11-02','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 5, TO_DATE('2018-06-12','YYYY-MM-DD'), 6871234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 7, TO_DATE('2010-03-03','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 6, TO_DATE('2023-12-12','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 2, TO_DATE('2017-01-25','YYYY-MM-DD'), 9432178);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 8, TO_DATE('2012-09-09','YYYY-MM-DD'), 6789012);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 10, TO_DATE('2024-04-04','YYYY-MM-DD'), 7234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 4, TO_DATE('2013-11-30','YYYY-MM-DD'), 8345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 1, TO_DATE('2015-06-06','YYYY-MM-DD'), 9123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 9, TO_DATE('2011-08-20','YYYY-MM-DD'), 6457890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 7, TO_DATE('2014-10-10','YYYY-MM-DD'), 7561234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 3, TO_DATE('2018-07-07','YYYY-MM-DD'), 8672345);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 5, TO_DATE('2012-02-15','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 8, TO_DATE('2020-05-25','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 10, TO_DATE('2013-07-30','YYYY-MM-DD'), 7543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 2, TO_DATE('2016-10-05','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 6, TO_DATE('2019-08-22','YYYY-MM-DD'), 9786543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 9, TO_DATE('2017-03-18','YYYY-MM-DD'), 6345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 4, TO_DATE('2025-11-11','YYYY-MM-DD'), 7894321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 5, TO_DATE('2011-06-16','YYYY-MM-DD'), 6543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 9, TO_DATE('2015-03-27','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 8, TO_DATE('2013-12-03','YYYY-MM-DD'), 8234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 1, TO_DATE('2022-01-18','YYYY-MM-DD'), 9345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 10, TO_DATE('2010-09-29','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 7, TO_DATE('2018-04-05','YYYY-MM-DD'), 6876543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 3, TO_DATE('2016-08-08','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 5, TO_DATE('2024-05-20','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 8, TO_DATE('2011-11-11','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 2, TO_DATE('2017-06-15','YYYY-MM-DD'), 6789012);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 4, TO_DATE('2012-07-14','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 10, TO_DATE('2018-09-09','YYYY-MM-DD'), 8345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 6, TO_DATE('2013-10-19','YYYY-MM-DD'), 9234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 9, TO_DATE('2015-02-28','YYYY-MM-DD'), 6456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 3, TO_DATE('2020-05-07','YYYY-MM-DD'), 7561234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 8, TO_DATE('2011-03-11','YYYY-MM-DD'), 8672345);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 7, TO_DATE('2014-08-21','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 2, TO_DATE('2017-11-30','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 5, TO_DATE('2019-03-15','YYYY-MM-DD'), 7543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 6, TO_DATE('2024-10-23','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 1, TO_DATE('2016-06-01','YYYY-MM-DD'), 9786543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 5, TO_DATE('2010-07-17','YYYY-MM-DD'), 6345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 10, TO_DATE('2025-09-25','YYYY-MM-DD'), 7894321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 8, TO_DATE('2013-01-12','YYYY-MM-DD'), 6543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 2, TO_DATE('2018-12-30','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 9, TO_DATE('2012-04-27','YYYY-MM-DD'), 8234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 4, TO_DATE('2014-11-05','YYYY-MM-DD'), 9345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 7, TO_DATE('2016-02-20','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 3, TO_DATE('2019-07-22','YYYY-MM-DD'), 6876543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 8, TO_DATE('2020-03-15','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 6, TO_DATE('2011-07-19','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 1, TO_DATE('2017-09-04','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 2, TO_DATE('2015-08-12','YYYY-MM-DD'), 6789012);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 7, TO_DATE('2013-10-16','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 5, TO_DATE('2022-04-09','YYYY-MM-DD'), 8345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 4, TO_DATE('2010-07-13','YYYY-MM-DD'), 9234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 8, TO_DATE('2014-08-21','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 10, TO_DATE('2016-11-30','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 5, TO_DATE('2018-04-14','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 6, TO_DATE('2025-07-03','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 2, TO_DATE('2012-09-07','YYYY-MM-DD'), 8345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 6, TO_DATE('2014-03-09','YYYY-MM-DD'), 9234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 7, TO_DATE('2011-11-29','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 5, TO_DATE('2020-04-12','YYYY-MM-DD'), 6876543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 8, TO_DATE('2018-07-03','YYYY-MM-DD'), 6345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 10, TO_DATE('2013-02-17','YYYY-MM-DD'), 7894321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 1, TO_DATE('2015-09-25','YYYY-MM-DD'), 6543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 9, TO_DATE('2022-07-11','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 4, TO_DATE('2010-10-06','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 3, TO_DATE('2017-04-07','YYYY-MM-DD'), 6789012);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 8, TO_DATE('2011-08-31','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 7, TO_DATE('2014-03-16','YYYY-MM-DD'), 8234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 5, TO_DATE('2016-12-23','YYYY-MM-DD'), 9345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 2, TO_DATE('2010-01-02','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 6, TO_DATE('2023-07-08','YYYY-MM-DD'), 6876543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 4, TO_DATE('2012-03-03','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 10, TO_DATE('2015-09-03','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 1, TO_DATE('2018-04-14','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 8, TO_DATE('2011-10-21','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 9, TO_DATE('2020-06-10','YYYY-MM-DD'), 6456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 3, TO_DATE('2013-08-22','YYYY-MM-DD'), 7561234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 5, TO_DATE('2016-05-18','YYYY-MM-DD'), 8672345);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 6, TO_DATE('2010-12-15','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 7, TO_DATE('2022-01-07','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 2, TO_DATE('2014-07-20','YYYY-MM-DD'), 7543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 8, TO_DATE('2017-03-30','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 4, TO_DATE('2011-10-07','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 9, TO_DATE('2015-06-22','YYYY-MM-DD'), 6789012);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 1, TO_DATE('2013-09-26','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 10, TO_DATE('2018-03-11','YYYY-MM-DD'), 8234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 7, TO_DATE('2012-08-04','YYYY-MM-DD'), 7561728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 3, TO_DATE('2014-05-18','YYYY-MM-DD'), 8672345);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 2, TO_DATE('2010-11-07','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 8, TO_DATE('2025-01-20','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 5, TO_DATE('2011-07-20','YYYY-MM-DD'), 7543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 9, TO_DATE('2013-03-09','YYYY-MM-DD'), 3783945);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 1, TO_DATE('2016-10-30','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 4, TO_DATE('2019-07-11','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 6, TO_DATE('2017-09-16','YYYY-MM-DD'), 6876543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 3, TO_DATE('2012-04-29','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 2, TO_DATE('2018-07-31','YYYY-MM-DD'), 8345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 8, TO_DATE('2015-02-18','YYYY-MM-DD'), 9234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 10, TO_DATE('2010-12-07','YYYY-MM-DD'), 6456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 7, TO_DATE('2024-03-20','YYYY-MM-DD'), 7561234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 9, TO_DATE('2013-08-05','YYYY-MM-DD'), 8672345);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 5, TO_DATE('2011-01-29','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 4, TO_DATE('2017-06-11','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 8, TO_DATE('2010-03-14','YYYY-MM-DD'), 7543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 3, TO_DATE('2022-02-12','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 6, TO_DATE('2016-07-01','YYYY-MM-DD'), 9786543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 1, TO_DATE('2014-09-23','YYYY-MM-DD'), 6345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 10, TO_DATE('2011-02-22','YYYY-MM-DD'), 7894321);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 7, TO_DATE('2023-08-14','YYYY-MM-DD'), 6543210);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 2, TO_DATE('2015-08-14','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 8, TO_DATE('2010-11-15','YYYY-MM-DD'), 8234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 9, TO_DATE('2012-06-11','YYYY-MM-DD'), 9345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 5, TO_DATE('2017-03-16','YYYY-MM-DD'), 5236789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 4, TO_DATE('2019-07-22','YYYY-MM-DD'), 6876543);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 2, TO_DATE('2016-10-09','YYYY-MM-DD'), 7567890);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 7, TO_DATE('2025-05-09','YYYY-MM-DD'), 8123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 8, TO_DATE('2013-08-30','YYYY-MM-DD'), 9456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 6, TO_DATE('2011-03-16','YYYY-MM-DD'), 6789012);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 10, TO_DATE('2014-12-23','YYYY-MM-DD'), 7123456);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 8, TO_DATE('2016-11-16','YYYY-MM-DD'), 8345678);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 1, TO_DATE('2010-09-30','YYYY-MM-DD'), 9234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 5, TO_DATE('2022-03-27','YYYY-MM-DD'), 6456789);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 9, TO_DATE('2017-06-23','YYYY-MM-DD'), 7561234);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 2, TO_DATE('2013-08-29','YYYY-MM-DD'), 8672345);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 7, TO_DATE('2015-11-08','YYYY-MM-DD'), 5234567);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 4, TO_DATE('2020-04-03','YYYY-MM-DD'), 6890123);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 8, TO_DATE('2011-08-25','YYYY-MM-DD'), 3771605);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 3, TO_DATE('2014-05-01','YYYY-MM-DD'), 4061728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 6, TO_DATE('2010-10-18','YYYY-MM-DD'), 4893272);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 10, TO_DATE('2021-02-25','YYYY-MM-DD'), 3172839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 9, TO_DATE('2013-08-29','YYYY-MM-DD'), 3947161);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 7, TO_DATE('2016-06-03','YYYY-MM-DD'), 3271605);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 2, TO_DATE('2018-12-01','YYYY-MM-DD'), 3561728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 8, TO_DATE('2012-03-08','YYYY-MM-DD'), 4117284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 5, TO_DATE('2015-07-30','YYYY-MM-DD'), 4672839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 3, TO_DATE('2011-09-01','YYYY-MM-DD'), 3780617);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 10, TO_DATE('2014-04-03','YYYY-MM-DD'), 4336173);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 7, TO_DATE('2016-12-20','YYYY-MM-DD'), 2617284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 1, TO_DATE('2010-01-27','YYYY-MM-DD'), 3445062);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 5, TO_DATE('2023-07-24','YYYY-MM-DD'), 3771605);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 9, TO_DATE('2017-03-31','YYYY-MM-DD'), 4061728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 6, TO_DATE('2012-10-11','YYYY-MM-DD'), 4893272);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 4, TO_DATE('2015-06-16','YYYY-MM-DD'), 3172839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 2, TO_DATE('2018-09-07','YYYY-MM-DD'), 3947161);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 8, TO_DATE('2020-03-12','YYYY-MM-DD'), 3271605);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 7, TO_DATE('2013-08-13','YYYY-MM-DD'), 3561728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 3, TO_DATE('2015-04-09','YYYY-MM-DD'), 4117284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 5, TO_DATE('2010-11-19','YYYY-MM-DD'), 4672839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 8, TO_DATE('2022-02-28','YYYY-MM-DD'), 2618395);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 10, TO_DATE('2011-07-15','YYYY-MM-DD'), 3438272);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 9, TO_DATE('2014-03-21','YYYY-MM-DD'), 3783945);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 4, TO_DATE('2016-10-25','YYYY-MM-DD'), 4061728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 2, TO_DATE('2019-07-06','YYYY-MM-DD'), 4728395);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 8, TO_DATE('2013-09-11','YYYY-MM-DD'), 3394506);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 7, TO_DATE('2021-03-16','YYYY-MM-DD'), 3561728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 2, TO_DATE('2010-11-10','YYYY-MM-DD'), 4172839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 6, TO_DATE('2015-04-15','YYYY-MM-DD'), 4617284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 7, TO_DATE('2012-07-23','YYYY-MM-DD'), 3228395);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 10, TO_DATE('2023-03-03','YYYY-MM-DD'), 3780617);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 3, TO_DATE('2014-08-01','YYYY-MM-DD'), 4336173);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 4, TO_DATE('2016-02-13','YYYY-MM-DD'), 4893272);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 2, TO_DATE('2011-10-25','YYYY-MM-DD'), 3947161);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 9, TO_DATE('2018-07-22','YYYY-MM-DD'), 3561728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 7, TO_DATE('2020-08-20','YYYY-MM-DD'), 4172839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 8, TO_DATE('2013-03-23','YYYY-MM-DD'), 4617284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (7, 10, TO_DATE('2015-12-06','YYYY-MM-DD'), 3172839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (2, 6, TO_DATE('2010-01-19','YYYY-MM-DD'), 3947161);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (9, 3, TO_DATE('2012-10-22','YYYY-MM-DD'), 3271605);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (4, 7, TO_DATE('2024-05-01','YYYY-MM-DD'), 3561728);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (1, 5, TO_DATE('2011-07-29','YYYY-MM-DD'), 4117284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (3, 9, TO_DATE('2013-02-08','YYYY-MM-DD'), 4672839);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (6, 4, TO_DATE('2016-11-11','YYYY-MM-DD'), 2617284);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (8, 2, TO_DATE('2018-04-23','YYYY-MM-DD'), 3445062);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (10, 8, TO_DATE('2020-09-02','YYYY-MM-DD'), 3771605);
INSERT INTO prestamo (iddeudor, idbanco, fecha, valor_otorgado) VALUES (5, 7, TO_DATE('2014-06-21','YYYY-MM-DD'), 3172839);

--100 ABONOS PARA LOS PRIMEROS 100 PRESTAMOS

INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (1, TO_DATE('2017-03-19','YYYY-MM-DD'), 3679211);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (2, TO_DATE('2013-11-27','YYYY-MM-DD'), 4622844);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (3, TO_DATE('2015-06-10','YYYY-MM-DD'), 2916074);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (4, TO_DATE('2020-01-04','YYYY-MM-DD'), 3289472);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (5, TO_DATE('2011-09-20','YYYY-MM-DD'), 4361705);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (6, TO_DATE('2024-12-07','YYYY-MM-DD'), 2500617);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (7, TO_DATE('2010-04-23','YYYY-MM-DD'), 4716050);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (8, TO_DATE('2018-03-27','YYYY-MM-DD'), 3394726);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (9, TO_DATE('2019-08-14','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (10, TO_DATE('2023-12-30','YYYY-MM-DD'), 3672945);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (11, TO_DATE('2012-05-15','YYYY-MM-DD'), 3447161);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (12, TO_DATE('2014-07-24','YYYY-MM-DD'), 4777161);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (13, TO_DATE('2016-08-13','YYYY-MM-DD'), 2617284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (14, TO_DATE('2022-10-35','YYYY-MM-DD'), 3228395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (15, TO_DATE('2013-11-16','YYYY-MM-DD'), 3945062);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (16, TO_DATE('2011-02-04','YYYY-MM-DD'), 2561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (17, TO_DATE('2017-07-19','YYYY-MM-DD'), 4893272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (18, TO_DATE('2010-05-08','YYYY-MM-DD'), 3226605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (19, TO_DATE('2025-10-27','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (20, TO_DATE('2019-09-20','YYYY-MM-DD'), 4337661);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (21, TO_DATE('2014-04-06','YYYY-MM-DD'), 4672839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (22, TO_DATE('2016-11-07','YYYY-MM-DD'), 2618395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (23, TO_DATE('2018-06-17','YYYY-MM-DD'), 3435617);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (24, TO_DATE('2010-03-08','YYYY-MM-DD'), 3783945);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (25, TO_DATE('2023-12-17','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (26, TO_DATE('2017-01-30','YYYY-MM-DD'), 4716089);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (27, TO_DATE('2012-09-14','YYYY-MM-DD'), 3394506);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (28, TO_DATE('2024-04-09','YYYY-MM-DD'), 3617283);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (29, TO_DATE('2013-11-05','YYYY-MM-DD'), 4172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (30, TO_DATE('2015-06-11','YYYY-MM-DD'), 4561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (31, TO_DATE('2011-08-26','YYYY-MM-DD'), 3228945);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (32, TO_DATE('2014-10-15','YYYY-MM-DD'), 3780617);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (33, TO_DATE('2018-07-12','YYYY-MM-DD'), 4336173);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (34, TO_DATE('2012-02-20','YYYY-MM-DD'), 2617284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (35, TO_DATE('2020-05-31','YYYY-MM-DD'), 3445062);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (36, TO_DATE('2011-08-04','YYYY-MM-DD'), 3771605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (37, TO_DATE('2014-10-10','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (38, TO_DATE('2018-08-27','YYYY-MM-DD'), 4893272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (39, TO_DATE('2012-03-23','YYYY-MM-DD'), 3172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (40, TO_DATE('2020-11-16','YYYY-MM-DD'), 3947161);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (41, TO_DATE('2011-06-21','YYYY-MM-DD'), 3271605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (42, TO_DATE('2014-03-04','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (43, TO_DATE('2018-12-09','YYYY-MM-DD'), 4117284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (44, TO_DATE('2022-01-23','YYYY-MM-DD'), 4672839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (45, TO_DATE('2010-10-04','YYYY-MM-DD'), 2618395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (46, TO_DATE('2017-04-10','YYYY-MM-DD'), 3438272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (47, TO_DATE('2011-08-13','YYYY-MM-DD'), 3783945);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (48, TO_DATE('2015-05-25','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (49, TO_DATE('2013-11-16','YYYY-MM-DD'), 4728395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (50, TO_DATE('2020-06-20','YYYY-MM-DD'), 3394506);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (51, TO_DATE('2010-07-20','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (52, TO_DATE('2017-09-14','YYYY-MM-DD'), 4172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (53, TO_DATE('2012-10-24','YYYY-MM-DD'), 4617284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (54, TO_DATE('2021-03-05','YYYY-MM-DD'), 3228395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (55, TO_DATE('2014-05-12','YYYY-MM-DD'), 3780617);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (56, TO_DATE('2010-03-08','YYYY-MM-DD'), 4336173);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (57, TO_DATE('2018-08-26','YYYY-MM-DD'), 2617284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (58, TO_DATE('2015-12-05','YYYY-MM-DD'), 3445062);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (59, TO_DATE('2012-04-19','YYYY-MM-DD'), 3771605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (60, TO_DATE('2020-10-28','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (61, TO_DATE('2016-06-06','YYYY-MM-DD'), 4893272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (62, TO_DATE('2010-11-22','YYYY-MM-DD'), 3172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (63, TO_DATE('2014-09-30','YYYY-MM-DD'), 3947161);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (64, TO_DATE('2022-01-01','YYYY-MM-DD'), 3271605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (65, TO_DATE('2011-12-05','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (66, TO_DATE('2017-04-02','YYYY-MM-DD'), 4117284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (67, TO_DATE('2012-11-10','YYYY-MM-DD'), 4672839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (68, TO_DATE('2015-02-25','YYYY-MM-DD'), 3394506);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (69, TO_DATE('2018-07-27','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (70, TO_DATE('2010-10-07','YYYY-MM-DD'), 3228395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (71, TO_DATE('2016-09-01','YYYY-MM-DD'), 3780617);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (72, TO_DATE('2010-04-03','YYYY-MM-DD'), 4336173);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (73, TO_DATE('2014-12-20','YYYY-MM-DD'), 2617284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (74, TO_DATE('2021-01-27','YYYY-MM-DD'), 3445062);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (75, TO_DATE('2013-07-24','YYYY-MM-DD'), 3771605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (76, TO_DATE('2017-03-31','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (77, TO_DATE('2010-10-11','YYYY-MM-DD'), 4893272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (78, TO_DATE('2015-06-16','YYYY-MM-DD'), 3172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (79, TO_DATE('2012-09-07','YYYY-MM-DD'), 3947161);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (80, TO_DATE('2020-03-16','YYYY-MM-DD'), 3271605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (81, TO_DATE('2014-08-12','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (82, TO_DATE('2016-04-15','YYYY-MM-DD'), 4117284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (83, TO_DATE('2010-11-04','YYYY-MM-DD'), 4672839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (84, TO_DATE('2025-03-03','YYYY-MM-DD'), 2618395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (85, TO_DATE('2011-08-01','YYYY-MM-DD'), 3438272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (86, TO_DATE('2013-02-13','YYYY-MM-DD'), 3783945);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (87, TO_DATE('2017-10-25','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (88, TO_DATE('2010-07-22','YYYY-MM-DD'), 4728395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (89, TO_DATE('2015-03-11','YYYY-MM-DD'), 3394506);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (90, TO_DATE('2012-04-07','YYYY-MM-DD'), 3561728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (91, TO_DATE('2014-11-31','YYYY-MM-DD'), 4172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (92, TO_DATE('2016-03-16','YYYY-MM-DD'), 4617284);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (93, TO_DATE('2010-12-23','YYYY-MM-DD'), 3228395);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (94, TO_DATE('2021-01-02','YYYY-MM-DD'), 3445062);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (95, TO_DATE('2013-07-08','YYYY-MM-DD'), 3771605);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (96, TO_DATE('2015-03-03','YYYY-MM-DD'), 4061728);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (97, TO_DATE('2011-09-03','YYYY-MM-DD'), 4893272);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (98, TO_DATE('2017-04-14','YYYY-MM-DD'), 3172839);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (99, TO_DATE('2012-09-26','YYYY-MM-DD'), 3947161);
INSERT INTO abono (idprestamo, fecha, valor_abono) VALUES (100, TO_DATE('2014-06-10','YYYY-MM-DD'), 3228395


-- 1. Valor total de préstamos por año
CREATE VIEW vw_total_prestamos_por_ano AS
SELECT EXTRACT(YEAR FROM fecha) AS ano,
       SUM(valor_otorgado) AS total_prestamos
FROM prestamo
GROUP BY EXTRACT(YEAR FROM fecha)


-- 2. Valor total de los préstamos de un año, mes para los bancos
CREATE OR REPLACE VIEW vw_total_prestamos_banco_ano_mes AS
SELECT b.nombre AS banco,
       EXTRACT(YEAR FROM p.fecha) AS anio,
       EXTRACT(MONTH FROM p.fecha) AS mes,
       SUM(p.valor_otorgado) AS totalprestamos
FROM prestamo p
INNER JOIN banco b ON p.idbanco = b.id
GROUP BY b.nombre, EXTRACT(YEAR FROM p.fecha), EXTRACT(MONTH FROM p.fecha)


-- 3. Saldo de cada prEstamo
CREATE  VIEW vw_saldo_prestamo AS
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
CREATE VIEW vw_listado_detallado AS
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
CREATE OR REPLACE VIEW vw_prestamos_por_deudor AS
SELECT d.nombre AS deudor,
NVL(COUNT(p.id),0) AS totalprestamos
FROM deudor d
LEFT JOIN prestamo p ON d.id = p.iddeudor
GROUP BY d.nombre

-- 6. Total de prestamos por año con fila extra de totales 
CREATE VIEW vw_total_prestamos_ano_con_totales AS
SELECT NVL(TO_CHAR(EXTRACT(YEAR FROM fecha)), 'Total') AS ano,
       SUM(valor_otorgado) AS total_prestamos
FROM prestamo
GROUP BY ROLLUP(EXTRACT(YEAR FROM fecha))

-- 7. Deudor que ha tenido prestamos en todos los bancos existentes
CREATE VIEW vw_deudor_todos_bancos AS
SELECT d.nombre AS deudor
FROM deudor d
JOIN prestamo p ON d.id = p.iddeudor
GROUP BY d.nombre
HAVING COUNT(DISTINCT p.idbanco) = (
SELECT COUNT(*) 
FROM banco
) 

-- 8. Bancos con promedio de prestamos por año mayor al promedio general 

CREATE VIEW vw_bancos_promedio_anual AS
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
INNER JOIN banco b ON t.idbanco = b.id
WHERE t.promedio_banco > t.promedio_general;


-- 10. Tabla que muestra el valor total de préstamos por año, mes y género del deudor
CREATE VIEW vw_totales_por_ano_mes_genero AS
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


*/


