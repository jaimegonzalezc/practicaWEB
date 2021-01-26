# Práctica Final Arquitectura WEB

En este repositorio se encuentran todas las carpetas y archivos del proyecto, así como scripts sql, modelos UML del proyecto, etc.

## Código del Proyecto

Todos los archivos relacionados con el código del proyecto se encuentran [en la carpeta IngenierosPeso](./IngenierosPeso)

En esta carpeta, se encuentran los siguientes elementos:
```
IngenierosPeso/
  |
  |___ .settings/
  |___ WebContent/
  |___ build/
  |___ src/
  |___ .DS_Store
  |___ .classpath
  |___ .project
```

De estos documentos, lo más importante se encuentran en las carpetas [`WebContent/`](./IngenierosPeso/WebContent) y [`src/`](./IngenierosPeso/src).

En `WebContent/` se encuentran todos los archivos y carpetas, relacionadas con las Vistas .Siendo más específicos, con los archivos de tipo JSP, así como código
Javascript y CSS utilizados.

En `src/` se encuentran todos los parquetes y archivos relacionados con los Controladores. Siendo más específicos, con los paquetes y archivos Java encargados de
las clases de los distintos controladores, así como el código de los WebServlets empleados.

## Casos de Uso

Los documentos e imágenes relacionadas con los Casos de Uso se encuentran [en la carpeta UML](./UML)

Contiene los siguientes elementos:
```
UML/
 |
 |__ Ingenieros_peso/
 |__ RRHHUseCase.png
 |__ empleadosUseCase.png
```

La carpeta `Ingenieros_peso/` contiene todo el paquete UML

Los archivos `RRHHUseCase.png` y `empleadosUseCase.png` son las imágenes correspondientes a los Casos de Uso, diseñados a partir de los requisitos que piden que 
cumpla la Aplicación Web.

## Base de Datos

Todos los documentos relacionados con la Base de Datos se encuentran [en la carpeta database](./database).

Esta carpeta contiene los siguientes elementos:
```
database/
  |
  |____ Ingenieros.sql
  |____ Modelo.png
  |____ ModeloSQL.mwb
  |____ ModeloSQL.mwb.bak
```

El documento `Ingenieros.sql` es el script _SQL_ que se encarga de inicializar la base de datos, las tablas y los disparadores, así como instanciar los datos de prueba
creados.

El archivo `Modelo.png` es una imagen que muestra el diseño E/R empleado para el modelado de la Base de Datos.

Los archivos `ModeloSQ.mwb` y `ModeloSQL.mwb.bak` son los archivos correspondientes al diseño de la base de datos, el cual se puede abrir y modificar con _MySQL Workbench_


