# Sistema de registro de reservas hoteleras

## Descripción

Creación de procedimientos, funciones y paquetes en Oracle.

## Objetivo

Reafirmar los conocimientos adquiridos para la creación y uso correcto de procedimientos, funciones y paquetes en Oracle. 

## Puntos a entregar

1. El usuario dueño de los objetos (owner) debe crear paquetes para la gestión de las tablas (insertar, actualizar y eliminar), y revocar los permisos que sobre ellas haya para otros usuarios. 
El usuario dueño de los objetos eliminará los trigger de generación de autonumericos para las llaves primarias de las tablas, se deben mostrar estas sentencias. El proceso de asignación de valores a las llaves primarias se debe hacer en los paquetes.
Creará sinónimos para las vistas y paquetes creados y debe otorgar permisos a 3 roles creados, se deben mostrar estas sentencias.

2. El usuario de auditoria creará tablas para almacenar la información que se modifique y elimine de las tablas del usuario propietario, registrando fecha, hora y usuario que realiza la operación, pero no debe dar acceso sobre sus tablas, todo se debe hacer con uno o varios paquetes y debe mostrar
como revocar los permisos que sobre ellas haya para otros usuarios. De igual forma creará sinónimos para estos paquetes y otorgar permisos como corresponda. No debe haber permisos sobre las tablas de este usuario.

3. Desarrollar un algoritmo que impida reservar más habitaciones de las que posee el hotel.

## Observaciones

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