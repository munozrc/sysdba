# Sistema de registro de reservas hoteleras

## Requisitos

1. Registrar información de los hoteles indicando su ubicación (dirección, ciudad, etc).

2. Es importante registrar los servicios del hotel como: piscina, jacuzzi, saunas, masajes, turco, juegos infantiles, playa, bar, discoteca, etc. y las amenidades de las habitaciones como: ***WiFi, servicios de TV, aire acondicionado, nevera, tina, jacuzzi, camas.***

3. Cada hotel maneja 3 temporadas: ***alta, media y baja***, pero es diferente el inicio y final en cada uno de ellos, es importante almacenar está información.

4. Las Reservas llevan información del cliente, fecha, temporada, valor.

## Puntos a entregar

La entrega es para la segunda nota y debe contener estos puntos:

1. Crear un usuario propietario de los objetos y otro para auditoria. Crear tablespace para cada uno de ellos donde puedan crear sus tablas. No usar el usuario SYS y SYSTEM para crear tablas.

2. Crear las restricciones necesarias para cada tabla (llaves primarias, llaves foráneas, uniques, not null, check). Para las llaves primarias de cada tabla debe usar secuencias y se debe implementar usando trigger.

3. Crear vistas que presenten datos de tablas que se puedan combinar, es decir, cada vista debe tener mínimo 2 tablas base.

4. Crear vistas para cada tabla y trigger en cada vista para permitir la inserción, modificación y eliminación a través de ella.

5. Crear trigger para guardar los datos históricos de las tablas del propietario cuando se modifican o eliminan registros. Crear el esquema auditoria para estas tablas.

6. Las filas de la auditoria deben tener la fecha en la cual se ejecutó la instrucción y que usuario lo hizo.

7. Cada grupo debe crear al menos 5 consultas que presenten diferentes datos, por ejemplo: cuantas cuotas pagadas por cliente, total de productos vendidos por sucursal, etc.

(NO PUEDE HABER CONSULTAS REPETIDAS ENTRE GRUPOS)

## Recomendaciones

No usar el esquema SYSTEM ni SYS.
1.  Para crear las tablas, vistas y triggers cree un usuario especial para ello, no usar el DBA.

2. Crear un usuario para el esquema de auditoria.

3. Crear al menos tres usuarios y usando roles, de permisos sobre las vistas creadas. No de
permisos sobre las tablas.

4. No usar el tablespace SYSTEM, se debe crear uno para el usuario dueño (propietario) de los objetos operativos y otro para el usuario de auditoria.

5. Se deben entregar las sentencias en archivos txt así:

    - Un archivo con las sentencias ejecutadas por el dba o usuario system. El nombre del archivo será **DBA.txt**

    - Un archivo para el usuario dueño de los objetos. El nombre del archivo ser **Owner.txt**

    - Un archivo para el usuario de auditoria. El nombre del archivo ser **Audit.txt**