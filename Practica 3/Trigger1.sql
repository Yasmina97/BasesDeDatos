--Controla que no se inserte un avion en el momento en el que está en vuelo
CREATE OR REPLACE TRIGGER primero
before INSERT OR UPDATE ON Vuelo
FOR EACH ROW
DECLARE
    new NUMBER;
BEGIN
	select count(*) into new from vuelo where fecha=:New.fecha AND id=:NEW.id 
										and ((Salida>:New.Salida and Salida<:New.Llegada)
										or (Llegada>:New.Salida and Llegada<:New.Llegada));
	if (new != 0) then
			RAISE_APPLICATION_ERROR (-20000, 'El avion esta en vuelo');
	end if;
	
END;
/
