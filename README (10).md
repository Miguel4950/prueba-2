# Sistema de Gestión de Alquiler de Propiedades

## Descripción

Este repositorio contiene el **diseño e implementación** de la base de datos para un sistema de alquiler y administración de propiedades inmobiliarias. Incluye:

- Modelo Entidad-Relación (E-R) detallado.
- Diccionario de datos completo.
- Scripts *one-shot* (DDL, DML, permisos y limpieza).
- Guía para desplegar la solución en Oracle SQL.

---

## Tabla de contenido

1. [Estructura del repositorio](#estructura-del-repositorio)
2. [Modelo Entidad-Relación](#modelo-entidad-relación)
3. [Diccionario de datos](#diccionario-de-datos)
4. [Scripts SQL](#scripts-sql)
5. [Integrantes](#integrantes)

---

## Estructura del repositorio

```text
Proyecto 2/
├── docs/
│   ├── Diccionario final.pdf
│   ├── Modelo.er.png
│   └── Notas Acerca del modelo Er.txt
├── prototypes/
│   └── entrega_2/
│       ├── ddl/
│       │   ├── Eliminar_objetos.sql
│       │   ├── Insertar datos.sql
│       │   ├── Permisos.sql
│       │   └── crear_tabla.sql
│       └── dml/
│           └── prueba.txt
```

Archivos clave y acceso directo:
- [Diccionario final.pdf](docs/Diccionario%20final.pdf)
- [Modelo.er.png](docs/Modelo.er.png)
- [Notas Acerca del modelo Er.txt](docs/Notas%20Acerca%20del%20modelo%20Er.txt)
- [Eliminar_objetos.sql](prototypes/entrega_2/ddl/Eliminar_objetos.sql)
- [Insertar datos.sql](prototypes/entrega_2/ddl/Insertar%20datos.sql)
- [Permisos.sql](prototypes/entrega_2/ddl/Permisos.sql)
- [crear_tabla.sql](prototypes/entrega_2/ddl/crear_tabla.sql)
- [prueba.txt](prototypes/entrega_2/dml/prueba.txt)

> **Nota:** Respeta exactamente esta estructura y nombres para evitar errores de links en el repositorio.

---

## Modelo Entidad-Relación

🔗 **[Ver modelo entidad-relación en Canva](https://www.canva.com/design/DAGl-oL30ao/FoqAeF8UiuVoGc95kQF6jQ/edit?utm_content=DAGl-oL30ao&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)**

- El modelo fue diseñado en **dbdiagram.io** y exportado a PNG usando Canva, donde se añadieron restricciones visuales (`CHECK`, `DEFAULT`) que la herramienta no soporta nativamente.
- Las restricciones adicionales, reglas de negocio y comentarios están en el archivo `Notas Acerca del modelo Er.txt`.
- El modelo incluye entidades clave, relaciones 1:N y M:N con tablas intermedias, llaves primarias sustitutas y naturales, además de restricciones explícitas.

### Vista rápida del diagrama

![Modelo ER](docs/Modelo.er.png)

---

## Diccionario de datos

Archivo completo disponible en [`docs/Diccionario final.pdf`](docs/Diccionario%20final.pdf).

Incluye, por cada atributo:
- Nombre
- Tipo de dato
- Restricciones: `PK`, `NOT NULL`, `UNIQUE`, `CHECK`
- Descripción de uso y propósito

| Tabla   | Campo        | Tipo           | Restricciones | Descripción breve           |
|---------|--------------|----------------|---------------|-----------------------------|
| agencia | agencia_id   | INT            | PK, NOT NULL  | Identificador de la agencia |
| agencia | nombre       | VARCHAR(100)   | NOT NULL, UNIQUE | Nombre de la agencia      |
| …       | …            | …              | …             | …                           |

> Consulta el archivo PDF para la versión completa.

---

## Scripts SQL

| Script                      | Ruta                                                                                   | Propósito                                                  |
|-----------------------------|----------------------------------------------------------------------------------------|------------------------------------------------------------|
| **Eliminar objetos**        | [prototypes/entrega_2/ddl/Eliminar_objetos.sql](prototypes/entrega_2/ddl/Eliminar_objetos.sql) | Elimina tablas si existen                                  |
| **Crear tablas**            | [prototypes/entrega_2/ddl/crear_tabla.sql](prototypes/entrega_2/ddl/crear_tabla.sql)           | Crea todas las tablas y restricciones del modelo           |
| **Insertar datos**          | [prototypes/entrega_2/ddl/Insertar datos.sql](prototypes/entrega_2/ddl/Insertar%20datos.sql)   | Inserta registros de prueba                                |
| **Permisos**                | [prototypes/entrega_2/ddl/Permisos.sql](prototypes/entrega_2/ddl/Permisos.sql)                 | Otorga privilegios en el esquema actual                    |
| **Prueba DML**              | [prototypes/entrega_2/dml/prueba.txt](prototypes/entrega_2/dml/prueba.txt)                     | Archivo de prueba o consultas para validar inserciones     |

- Todos los scripts están comentados y respetan la dependencia lógica de claves foráneas.
- El orden recomendado de ejecución es: Eliminar_objetos.sql → crear_tabla.sql → Insertar datos.sql → Permisos.sql → pruebas.

---

## Integrantes

- samypipe470
- Miguel4950
- moutt-t

---

_Proyecto académico — uso libre con atribución._
