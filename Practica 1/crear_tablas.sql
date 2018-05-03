DROP TABLE Resultado;
DROP TABLE Partido;
DROP TABLE Jornada;
DROP TABLE Liga;
DROP TABLE Nombre;
DROP TABLE Equipo;
DROP TABLE Estadio;

CREATE TABLE Estadio (
    nombreEstadio varchar(60) PRIMARY KEY,
    anyo number(4),
    capacidad number(6) NOT NULL,
    ciudad varchar(60) NOT NULL
);

CREATE TABLE Equipo (
    nombreOficial varchar(60) PRIMARY KEY,
    nombreCorto char(3) NOT NULL,
    nombreHistorico varchar(60),
    fundacion number(4) NOT NULL,
    estadio varchar(60),
    FOREIGN KEY (estadio) REFERENCES Estadio(nombreEstadio)
);

CREATE TABLE Nombre (
    aliasEquipo varchar(60) PRIMARY KEY,
    nombreOficial varchar(60) NOT NULL,
    FOREIGN KEY (nombreOficial) REFERENCES Equipo(nombreOficial)
);

CREATE TABLE Liga (
    division varchar(30) PRIMARY KEY,
    nombre varchar(30),
    temporadas varchar(60)
);

CREATE TABLE Jornada (
    anyo number(4),
    numero number(2),
    division varchar(30),
    PRIMARY KEY (anyo, numero, division),
    FOREIGN KEY (division) REFERENCES Liga(division)
);

CREATE TABLE Partido (
    codigo number(5) PRIMARY KEY,
    golesLocal number(2) NOT NULL,
    golesVisitante number(2) NOT NULL,
    equipoLocal varchar(60) NOT NULL,
    equipoVisitante varchar(60) NOT NULL,
    anyoJornada number(4),
    numeroJornada number(2),
    divisionJornada varchar(30),
    FOREIGN KEY (equipoLocal) REFERENCES Equipo(nombreOficial),
    FOREIGN KEY (equipoVisitante) REFERENCES Equipo(nombreOficial),
    FOREIGN KEY (anyoJornada,numeroJornada,divisionJornada) REFERENCES Jornada(anyo,numero,division)
);

CREATE TABLE Resultado (
    nombreEquipo varchar(60),
    anyoJornada number(4),
    numeroJornada number(2),
    divisionJornada varchar(30),
    puntos number(3) NOT NULL,
    puesto number(2) NOT NULL,
    accion varchar(30),
    golesFavor number(5),
    golesContra number(5),
    PRIMARY KEY (nombreEquipo, anyoJornada, numeroJornada, divisionJornada),
    FOREIGN KEY (nombreEquipo) REFERENCES Equipo(nombreOficial),
    FOREIGN KEY (anyoJornada,numeroJornada,divisionJornada) REFERENCES Jornada(anyo,numero,division)
);



