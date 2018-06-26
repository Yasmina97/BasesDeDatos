DROP TABLE IF EXISTS AEROPUERTO;
DROP TABLE IF EXISTS MODELO;
DROP TABLE IF EXISTS AVION;
DROP TABLE IF EXISTS VUELO;
DROP TABLE IF EXISTS INCIDENCIA;
DROP TABLE IF EXISTS DESVIO;

CREATE TABLE AEROPUERTO (
	iata	varchar(8) PRIMARY KEY,
	estado	varchar(80),
	ciudad	varchar(80),
	nombre	varchar(80)
)

CREATE TABLE MODELO(
	id			varchar(80) PRIMARY KEY,
	empresa		varchar(80),
	nave		varchar(80),
	tipo		varchar(80),
	motor		varchar(80),
	anyo		varchar(80)
)

CREATE TABLE AVION (
	matricula	varchar(10) PRIMARY KEY,
	modelo		varchar(20),
	FOREIGN KEY (modelo) REFERENCES MODELO(id)
)

CREATE TABLE VUELO (
	id			number(7) PRIMARY KEY,
	companyia	varchar(80),
	fecha 		date,
	duracion	number(7),
	salida  	number(7),
	llegada  	number(7),
	aeroOrigen	varchar(8),
	aeroDestino	varchar(8),
	avion 		varchar(10),
	FOREIGN KEY (aeroOrigen) REFERENCES AEROPUERTO(iata),
	FOREIGN KEY (aeroDestino) REFERENCES AEROPUERTO(iata),
	FOREIGN KEY (avion) REFERENCES AVION(matricula)
)

CREATE TABLE INCIDENCIA (
	tipo			varchar(80),
	retraso			number(7),
	vueloAfectado  	number(7),
	PRIMARY KEY (tipo, vueloAfectado),
	FOREIGN KEY (vueloAfectado) REFERENCES VUELO(id)
)

CREATE TABLE DESVIO (
	id				number(7),
	salida  		number(7),
	llegada  		number(7),
	aeroDestino		varchar(8),
	vueloAfectado  	number(7),
	avionAfectado	varchar(10),
	PRIMARY KEY (id, vueloAfectado),
	FOREIGN KEY (aeroDestino) REFERENCES AEROPUERTO(iata),
	FOREIGN KEY (avionAfectado) REFERENCES AVION(matricula),
	FOREIGN KEY (vueloAfectado) REFERENCES VUELO(id)
)
