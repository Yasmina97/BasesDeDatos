
CREATE TABLE Persona (
    idPersona  		NUMBER(11) PRIMARY KEY,
    nombrePersona   VARCHAR(80),
    generoP         VARCHAR(4),
    lugarOrigen     VARCHAR(80)
);

CREATE TABLE Produccion (
    idProduccion 	NUMBER(11) PRIMARY KEY,
    nombre       	VARCHAR(80),
    anyo         	NUMBER(4),
    genero          VARCHAR(80)
);

CREATE TABLE Empleado (
    idProduccion 	NUMBER(11),
    idPersona       NUMBER(11),
    puesto          VARCHAR(80),
	PRIMARY KEY (idProduccion, idPersona, puesto),
    FOREIGN KEY (idPersona) REFERENCES Persona(idPersona),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(idProduccion)
);

CREATE TABLE Personaje (
    idProduccion 	NUMBER(11),
    idPersona       NUMBER(11),
    nombrePersonaje          VARCHAR(80),
    descripcion          VARCHAR(80),
	PRIMARY KEY (idProduccion, idPersona, nombrePersonaje),
    FOREIGN KEY (idPersona) REFERENCES Persona(idPersona),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(idProduccion)
);

CREATE TABLE Pelicula (
    idProduccion 	NUMBER(11),
	PRIMARY KEY (idProduccion),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(idProduccion)
);

CREATE TABLE Keyword (
    idPalabra 	NUMBER(11) PRIMARY KEY,
	palabra 	VARCHAR(80)
);

CREATE TABLE Tiene (
	idPalabra 	NUMBER(11),
    idProduccion 	NUMBER(11),
	PRIMARY KEY (idProduccion,idPalabra),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(idProduccion),
    FOREIGN KEY (idPalabra) REFERENCES Keyword(idPalabra)
);

CREATE TABLE Serie (
    idProduccion 	NUMBER(11),
    anyoFin			NUMBER(4),
	PRIMARY KEY (idProduccion),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(idProduccion)
);
