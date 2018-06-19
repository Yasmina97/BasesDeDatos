--Controla que no se inserte un avion en el momento en el que está en vuelo
CREATE OR REPLACE TRIGGER primero
before INSERT OR UPDATE ON planV
FOR EACH ROW
DECLARE
    new NUMBER;
BEGIN
	select count(*) into new from ejecuccion where fecha=:New.fecha AND idavion=:NEW.idavion 
										and ((horaSalida>:New.horaSalida and horaSalida<:New.horaLlegada)
										or (horaLlegada>:New.horaSalida and horaLlegada<:New.horaLlegada));
	if (new != 0) then
			RAISE_APPLICATION_ERROR (-20000, 'El avion esta en vuelo');
	end if;
	
END;
/