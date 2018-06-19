--Controla que la fecha de un avion tenga sentido, no anteriores a 1946, cuando se producen los primeros vuelos comerciales
CREATE OR REPLACE TRIGGER tercero
	BEFORE INSERT OR UPDATE ON Modelo
	FOR EACH ROW
BEGIN
	
	if :NEW.anyo<1946 then
			raise_application_error( -20000, 'Fecha incorrecta');
	end if;
	
end;

/
