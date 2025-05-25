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
.
├── README.md                          # Este documento
├── docs/                              # Documentación y recursos
│   ├── ModeloER.png                   # Imagen del diagrama E-R (exportada y editada en Canva)
│   └── Diccionario_Datos_2.md         # Diccionario de datos detallado
├── prototypes/
│   └── entrega_2/
│       ├── ddl/
│       │   └── 1_ddl_proyecto2.sql    # Script DDL: creación/eliminación de tablas y restricciones
│       └── dml/
│           └── 1_dml_proyecto2.sql    # Script DML: inserción de datos de ejemplo
└── utils/
    └── permisos.sql                   # Otorga privilegios a usuarios/aplicación
```

> **Nota:** Todos los scripts DDL y DML se ubican bajo `prototypes/entrega_2/` según la etapa del proyecto.  
> Documentos y recursos de referencia, como el diagrama y el diccionario, se encuentran en `docs/`.

---

## Modelo Entidad-Relación

🔗 **[Ver modelo entidad-relación en Canva](https://www.canva.com/design/DAGl-oL30ao/FoqAeF8UiuVoGc95kQF6jQ/edit?utm_content=DAGl-oL30ao&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)**

- El modelo fue diseñado en **dbdiagram.io** y exportado a PNG usando Canva, donde se añadieron restricciones visuales (`CHECK`, `DEFAULT`) que la herramienta no soporta nativamente.
- Las restricciones adicionales, reglas de negocio y comentarios están en el archivo `diagram.io.txt` (disponible bajo pedido o en el repo si tu profesor lo exige).
- El modelo incluye entidades clave, relaciones 1:N y M:N con tablas intermedias, llaves primarias sustitutas y naturales, además de restricciones explícitas.

### Vista rápida del diagrama

![Modelo ER](docs/ModeloER.png)

---

## Diccionario de datos

Archivo completo disponible en [`docs/Diccionario_Datos_2.md`](docs/Diccionario_Datos_2.md).

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

> Consulta el archivo para la versión extendida.

---

## Scripts SQL

| Script                      | Ruta                                      | Propósito                                                  |
|-----------------------------|-------------------------------------------|------------------------------------------------------------|
| **Eliminar y crear objetos** | `prototypes/entrega_2/ddl/1_ddl_proyecto2.sql` | Elimina tablas si existen y crea todo el modelo E-R con restricciones |
| **Insertar datos**           | `prototypes/entrega_2/dml/1_dml_proyecto2.sql` | Inserta al menos 10 registros en cada tabla, respetando relaciones    |
| **Permisos**                 | `utils/permisos.sql`                     | Otorga privilegios a los usuarios de la base de datos               |

- Todos los scripts están comentados y respetan la dependencia lógica de claves foráneas.
- El orden recomendado de ejecución es: DDL → DML → Permisos.

---

## Integrantes

| Usuario GitHub   | Rol principal              |
|------------------|---------------------------|
| **samypipe470**  | Modelado E/R              |
| **Miguel4950**   | Scripts DDL & DML         |
| **moutt-t**      | Documentación & QA        |

---

### Referencias y recursos

- [Markdown Guide Cheat-Sheet](https://www.markdownguide.org/cheat-sheet/)
- El código y la documentación siguen las buenas prácticas recomendadas para Markdown y proyectos colaborativos en GitHub.

---

_Proyecto académico — uso libre con atribución._
