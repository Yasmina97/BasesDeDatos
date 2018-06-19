
--Crea un nuevo modelo de avion al insertar un avión con modelo inedito

CREATE OR REPLACE TRIGGER modelonuevo
	BEFORE INSERT ON ModeloAvion
	FOR EACH ROW
BEGIN
	
	if :NEW.idModelo NOT EXISTS (SELECT * FROM Modelo)  then
			INSERT INTO Modelo(empresa, idModelo, tipo, motor, anyo) VALUES ('0',:NEW.idModelo,'0','0','0');
	end if;
	
end;