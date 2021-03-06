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

-- Modificar trigger para usar el paquete AUDI_CLIENTES
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