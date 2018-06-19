
--Crea un nuevo modelo de avion al insertar un avión con modelo inedito

CREATE OR REPLACE TRIGGER segundo
	BEFORE INSERT ON Modelo
	FOR EACH ROW
BEGIN
	
	if :NEW.id NOT EXISTS (SELECT * FROM Modelo)  then
			INSERT INTO Modelo(id,empresa,nave, tipo, motor, anyo) VALUES (:NEW.id,'0','0','0','0','0');
	end if;
	
end;
