 create database Averia_Fix;
use Averia_Fix;

#TABLAS PRINCIPALES
CREATE TABLE IF NOT EXISTS Usuario (
	no_Trabajador INT NOT NULL,
    nombre VARCHAR(100),
    contrasena VARCHAR(15),
		PRIMARY KEY(no_Trabajador)
);

CREATE TABLE IF NOT EXISTS Averia (
	no_Averia INT NOT NULL,
    descripcion TEXT,
    reparacion TEXT,
		PRIMARY KEY(no_Averia)
);

CREATE TABLE IF NOT EXISTS Observacion (
	id_Observacion INT NOT NULL,
    descripcion TEXT,
    fecha DATE,
		PRIMARY KEY(id_Observacion)
);

CREATE TABLE IF NOT EXISTS Horario (
	id_Horario INT NOT NULL,
    horario DATETIME,
		PRIMARY KEY (id_Horario)
);

CREATE TABLE IF NOT EXISTS Estaciones (
	id_Estacion VARCHAR(3) NOT NULL,
    nom_Estacion VARCHAR(30),
    url_Imagen TEXT,
		PRIMARY KEY(id_Estacion)
);

CREATE TABLE IF NOT EXISTS Lineas (
	id_Linea VARCHAR(3) NOT NULL,
    nom_Linea VARCHAR(8),
		PRIMARY KEY (id_Linea)
);



#CATÁLOGOS
CREATE TABLE IF NOT EXISTS TipoAveria (
	id_Tipo_Averia VARCHAR(2) NOT NULL,
    tipo_Averia TINYTEXT,
		PRIMARY KEY (id_Tipo_Averia)
);

CREATE TABLE IF NOT EXISTS CodigoCausa (
	id_Codigo_Causa VARCHAR(2) NOT NULL,
    codigo_Causa TINYTEXT,
		PRIMARY KEY (id_Codigo_Causa)
);

CREATE TABLE IF NOT EXISTS Subsistema (
	id_Subsistema VARCHAR(2) NOT NULL,
    subsistema TINYTEXT,
		PRIMARY KEY (id_Subsistema)
);

CREATE TABLE IF NOT EXISTS IntervencionUbicacion (
	id_Intervencion_Ubicacion VARCHAR(2) NOT NULL,
    intervencion_Ubicacion TINYTEXT,
		PRIMARY KEY (id_Intervencion_Ubicacion)
);

CREATE TABLE IF NOT EXISTS TipoHorario (
	id_Tipo_Horario INT NOT NULL,
    tipo_Horario TINYTEXT,
		PRIMARY KEY (id_Tipo_Horario)
);

CREATE TABLE IF NOT EXISTS RolReporte (
	id_Rol_Reporte INT NOT NULL,
    rol_Reporte TINYTEXT,
		PRIMARY KEY (id_Rol_Reporte)
);

CREATE TABLE IF NOT EXISTS TipoReporte (
	id_Tipo_Reporte INT NOT NULL,
    tipo_Reporte TINYTEXT,
		PRIMARY KEY (id_Tipo_Reporte)
);

CREATE TABLE IF NOT EXISTS Estado (
	id_Estado INT NOT NULL,
    estado TINYTEXT,
		PRIMARY KEY (id_Estado)
);

CREATE TABLE IF NOT EXISTS TipoUsuarios (
	id_Tipo_Usr INT NOT NULL,
    tipo_Usr TINYTEXT,
		PRIMARY KEY (id_Tipo_Usr)
);


#TABLAS RELACIONALES
CREATE TABLE IF NOT EXISTS RelUsrTipo (
	id_Rel_Usr_Tipo VARCHAR(7) NOT NULL,
    id_Tipo_Usr INT,
    no_Trabajador INT,
		PRIMARY KEY (id_Rel_Usr_Tipo),
        FOREIGN KEY (id_Tipo_Usr) 
			REFERENCES TipoUsuarios(id_Tipo_Usr),
		FOREIGN KEY (no_Trabajador) 
			REFERENCES Usuario(no_Trabajador)
);

CREATE TABLE IF NOT EXISTS RelUsrAveria (
	id_Rel_Usr_Averia INT NOT NULL,
    no_Trabajador INT,
    no_Averia INT,
    id_Rol_Reporte INT,
    id_Tipo_Reporte INT,
		PRIMARY KEY (id_Rel_Usr_Averia),
		FOREIGN KEY (no_Trabajador) 
			REFERENCES Usuario(no_Trabajador),
        FOREIGN KEY (no_Averia) 
			REFERENCES Averia(no_Averia),
        FOREIGN KEY (id_Rol_Reporte) 
			REFERENCES RolReporte(id_Rol_Reporte),
        FOREIGN KEY (id_Tipo_Reporte) 
			REFERENCES TipoReporte(id_Tipo_Reporte)
);

CREATE TABLE IF NOT EXISTS Calificacion (
	id_Calificacion VARCHAR(7) NOT NULL,
    id_Subsistema VARCHAR(2),
    id_Tipo_Averia VARCHAR(2),
    id_Codigo_Causa VARCHAR(2),
    id_Intervencion_Ubicacion VARCHAR(2),
		PRIMARY KEY (id_Calificacion),
		FOREIGN KEY (id_Subsistema) 
			REFERENCES Subsistema(id_Subsistema),
        FOREIGN KEY (id_Tipo_Averia) 
			REFERENCES TipoAveria(id_Tipo_Averia),
        FOREIGN KEY (id_Codigo_Causa) 
			REFERENCES CodigoCausa(id_Codigo_Causa),
        FOREIGN KEY (id_Intervencion_Ubicacion) 
			REFERENCES IntervencionUbicacion(id_Intervencion_Ubicacion)
);

CREATE TABLE IF NOT EXISTS RelCalAveria (
	id_Rel_Cal_Averia INT NOT NULL,
    id_Calificacion VARCHAR(7),
    no_Averia INT,
		PRIMARY KEY (id_Rel_Cal_Averia),
        FOREIGN KEY (id_Calificacion) 
			REFERENCES Calificacion(id_Calificacion),
		FOREIGN KEY (no_Averia) 
			REFERENCES Averia(no_Averia)
);

CREATE TABLE IF NOT EXISTS RelObsUsr (
	id_Rel_Obs_Usr INT NOT NULL,
    no_Trabajador INT,
    id_Observacion INT,
		PRIMARY KEY (id_Rel_Obs_Usr),
        FOREIGN KEY (no_Trabajador) 
			REFERENCES Usuario(no_Trabajador),
		FOREIGN KEY (id_Observacion) 
			REFERENCES Observacion(id_Observacion)
);

CREATE TABLE IF NOT EXISTS RelObsAveria (
	id_Rel_Obs_Averia INT NOT NULL,
    no_Averia INT,
    id_Observacion INT,
		PRIMARY KEY (id_Rel_Obs_Averia),
        FOREIGN KEY (no_Averia) 
			REFERENCES Averia(no_Averia),
		FOREIGN KEY (id_Observacion) 
			REFERENCES Observacion(id_Observacion)
);

CREATE TABLE IF NOT EXISTS RelHorarioAveria (
	id_Rel_Horario_Averia INT NOT NULL,
    no_Averia INT,
    id_Tipo_Horario INT,
    id_Horario INT,
		PRIMARY KEY (id_Rel_Horario_Averia),
        FOREIGN KEY (no_Averia) 
			REFERENCES Averia(no_Averia),
		FOREIGN KEY (id_Tipo_Horario) 
			REFERENCES TipoHorario(id_Tipo_Horario),
		FOREIGN KEY (id_Horario) 
			REFERENCES Horario(id_Horario)
);

CREATE TABLE IF NOT EXISTS RelLineaEstacion (
	id_Rel_Linea_Estacion VARCHAR(8) NOT NULL,
    id_Linea VARCHAR(3),
    id_Estacion VARCHAR(3),
		PRIMARY KEY (id_Rel_Linea_Estacion),
        FOREIGN KEY (id_Linea) 
			REFERENCES Lineas(id_Linea),
		FOREIGN KEY (id_Estacion) 
			REFERENCES Estaciones(id_Estacion)
);

CREATE TABLE IF NOT EXISTS UbAveria (
	id_Ub_Averia INT NOT NULL,
    no_Averia INT,
    id_Rel_Linea_Estacion VARCHAR(8),
		PRIMARY KEY (id_Ub_Averia),
        FOREIGN KEY (no_Averia) 
			REFERENCES Averia(no_Averia),
		FOREIGN KEY (id_Rel_Linea_Estacion) 
			REFERENCES RelLineaEstacion(id_Rel_Linea_Estacion)
);

CREATE TABLE IF NOT EXISTS RelUsrLinea (
	id_Rel_Usr_Linea INT NOT NULL,
    no_Trabajador INT,
    id_Linea VARCHAR(3),
		PRIMARY KEY (id_Rel_Usr_Linea),
        FOREIGN KEY (no_Trabajador) 
			REFERENCES Usuario(no_Trabajador),
		FOREIGN KEY (id_Linea) 
			REFERENCES Lineas(id_Linea)
);

CREATE TABLE IF NOT EXISTS RelEstadoUsr (
	id_Rel_Estado_Usr INT NOT NULL,
    id_Estado INT,
    no_Trabajador INT,
		PRIMARY KEY (id_Rel_Estado_Usr),
        FOREIGN KEY (no_Trabajador) 
			REFERENCES Usuario(no_Trabajador),
		FOREIGN KEY (id_Estado) 
			REFERENCES Estado(id_Estado)
);

CREATE TABLE IF NOT EXISTS RelEstadoAveria (
	id_Rel_Estado_Averia INT NOT NULL,
    id_Estado INT,
    no_Averia INT,
		PRIMARY KEY (id_Rel_Estado_Averia),
        FOREIGN KEY (id_Estado) 
			REFERENCES Estado(id_Estado),
		FOREIGN KEY (no_Averia) 
			REFERENCES Averia(no_Averia)
);

CREATE TABLE IF NOT EXISTS RelCalLinea (
	id_Rel_Cal_Linea INT NOT NULL,
    id_Calificacion VARCHAR(7),
    id_Linea VARCHAR(3),
		PRIMARY KEY (id_Rel_Cal_Linea),
        FOREIGN KEY (id_Calificacion) 
			REFERENCES Calificacion(id_Calificacion),
		FOREIGN KEY (id_Linea) 
			REFERENCES Lineas(id_Linea)
);
