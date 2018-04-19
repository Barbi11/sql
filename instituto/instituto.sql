CREATE TABLE persona (
	dni                           integer PRIMARY KEY,
	nombre                        text NOT NULL,
	apellido                      text NOT NULL,	
	fecha_nac                     date NOT NULL CHECK(fecha_nac < current_date)
);


CREATE TABLE contacto (
	dni                           integer PRIMARY KEY REFERENCES persona(dni),
	direccion                     text NOT NULL,
	telefono                      integer,
	email                         text
);


CREATE TABLE alumno (
	nro_legajo                    serial PRIMARY KEY,
	dni	                          integer UNIQUE NOT NULL REFERENCES persona(dni),
	fecha_inscrip                 date NOT NULL CHECK(fecha_inscrip < current_date)
);


CREATE TABLE docente (
	cuil                          text PRIMARY KEY,
	dni                           integer UNIQUE NOT NULL REFERENCES persona(dni),
	fecha_contratac               date NOT NULL CHECK(fecha_contratac < current_date),
	honorarios                    double precision NOT NULL check(honorarios >= 0)

);


CREATE TABLE curso (
	codigo                        serial PRIMARY KEY,
	nombre                        text  UNIQUE NOT NULL,
	descripcion                   text NOT NULL,
	costo                         double precision NOT NULL CHECK(costo >= 0)
);


CREATE TABLE es_alumno_de (
	nro_legajo                    integer UNIQUE NOT NULL REFERENCES alumno(nro_legajo),
	codigo                        integer UNIQUE NOT NULL REFERENCES curso(codigo),
	PRIMARY KEY                   (nro_legajo, codigo)
);	


CREATE TABLE es_docente_de (
	cuil                          text UNIQUE NOT NULL REFERENCES docente(cuil),
	codigo                        integer UNIQUE NOT NULL REFERENCES curso(codigo),
	PRIMARY KEY                   (cuil, codigo)
); 
