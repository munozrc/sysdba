/*
    Archivo para el usuario de Auditoria.

    Nombre estudiantes:
    - 
    - 

    Tabla de contenido del Archivo: 
    - 
*/

-- 5.1 Crear tablas para almacenar datos para las auditorias
CREATE TABLE AUDIT_HOTELES AS SELECT * from OWNER.HOTELES WHERE 1=0;
ALTER TABLE AUDIT_HOTELES ADD ACCION_REALIZADA varchar2(20);
ALTER TABLE AUDIT_HOTELES ADD FECHA_ACCION Date;
ALTER TABLE AUDIT_HOTELES ADD NOMBRE_USUARIO varchar2(20);

CREATE OR REPLACE TRIGGER TGR_AUDIT_HOTELES
AFTER INSERT OR UPDATE OR DELETE ON OWNER.HOTELES
FOR EACH ROW
BEGIN
    IF UPDATING THEN
        INSERT INTO AUDIT_HOTELES VALUES
        (:OLD.ID,:OLD.DIRECCION,:OLD.CIUDAD,:OLD.PISCINA,:OLD.JACUZZI,:OLD.SAUNA,:OLD.MASAJES,:OLD.TURCO,:OLD.JUEGOS,:OLD.PLAYA,:OLD.BAR,:OLD.DISCOTECA, 'UPDATE', SYSDATE, USER);
    ELSIF DELETING THEN
        INSERT INTO AUDIT_HOTELES VALUES
        (:OLD.ID,:OLD.DIRECCION,:OLD.CIUDAD,:OLD.PISCINA,:OLD.JACUZZI,:OLD.SAUNA,:OLD.MASAJES,:OLD.TURCO,:OLD.JUEGOS,:OLD.PLAYA,:OLD.BAR,:OLD.DISCOTECA, 'DELETE', SYSDATE, USER);
    ELSE
        INSERT INTO AUDIT_HOTELES VALUES
        (:NEW.ID,:NEW.DIRECCION,:NEW.CIUDAD,:NEW.PISCINA,:NEW.JACUZZI,:NEW.SAUNA,:NEW.MASAJES,:NEW.TURCO,:NEW.JUEGOS,:NEW.PLAYA,:NEW.BAR,:OLD.DISCOTECA, 'INSERT', SYSDATE, USER);
    END IF;
    --
END;
/