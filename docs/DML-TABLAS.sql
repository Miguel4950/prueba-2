--Creacion de tablas
CREATE TABLE banco (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL UNIQUE 
);

CREATE TABLE deudor (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  tipo_doc VARCHAR2(20) NOT NULL,
  numero_doc VARCHAR2(20) NOT NULL,
  genero CHAR(1) NOT NULL,
  UNIQUE (tipo_doc, numero_doc) 
);

CREATE TABLE prestamo (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  iddeudor NUMBER(10,0) NOT NULL,
  idbanco NUMBER(10,0) NOT NULL,
  fecha DATE DEFAULT SYSDATE NOT NULL,
  valor_otorgado NUMBER(10,2) DEFAULT 0 NOT NULL,
  pagado VARCHAR2(2) DEFAULT 'no' NOT NULL,
  FOREIGN KEY (iddeudor) REFERENCES deudor(id),
  FOREIGN KEY (idbanco) REFERENCES banco(id),
  UNIQUE (idbanco, iddeudor, fecha)
);

CREATE TABLE abono (
  id NUMBER(10,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  idprestamo NUMBER(10,0) NOT NULL,
  fecha DATE NOT NULL,
  valor_abono NUMBER(10,2) NOT NULL,
  FOREIGN KEY (idprestamo) REFERENCES prestamo(id), 
  UNIQUE (idprestamo, fecha)
);
