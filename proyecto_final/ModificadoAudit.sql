-- Crear tablas para almacenar datos para las auditorias de la tabla CLIENTES
CREATE OR REPLACE TABLE AUDIT_CLIENTES AS SELECT * from OWNER.CLIENTES WHERE 1=0;
ALTER TABLE AUDIT_CLIENTES ADD ACCION_REALIZADA varchar2(20);
ALTER TABLE AUDIT_CLIENTES ADD FECHA_ACCION Date;
ALTER TABLE AUDIT_CLIENTES ADD NOMBRE_USUARIO varchar2(20);

-- Creamos un paquete para la gestion de las auditorias de la tabla clientes de OWNER
CREATE OR REPLACE PACKAGE GESTION_CLIENTES
AS
PROCEDURE INSERTAR(ANOMBRES VARCHAR2, ACEDULA VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY AUDI_CLIENTES
AS
    -- Metodo para insertar en la tabla de auditorias.
    PROCEDURE INSERTAR(AID NUMBER, ANOMBRES VARCHAR2, ACEDULA VARCHAR2, AACCION VARCHAR2, ASYSDATE DATE, AUSER VARCHAR2) AS
    BEGIN
        INSERT INTO CLIENTES VALUES(AID, ANOMBRES, ACEDULA, AACCION, ASYSDATE, AUSER);
        COMMIT;
    END;
END;
/

CREATE OR REPLACE TRIGGER TGR_AUDIT_CLIENTES
AFTER UPDATE OR DELETE ON OWNER.CLIENTES
FOR EACH ROW
DECLARE
  ACCION varchar2(20);
BEGIN
    IF UPDATING THEN
        ACCION:='UPDATE'; 
    ELSIF DELETING THEN
        ACCION:='DELETE'; 
    END IF;
    --
    AUDI_CLIENTES.INSERTAR(:OLD.ID, :OLD.NOMBRES, :OLD.CEDULA, ACCION, SYSDATE, USER);
END;
/