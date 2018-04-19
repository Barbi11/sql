INSERT INTO persona(dni, nombre, apellido, fecha_nac) VALUES(17945351,'Carlos','Fernandez','1963-05-14');

INSERT INTO contacto(dni, direccion,telefono, email) VALUES(17945351,'Pichincha 1985','1598467530','carlos_f_63@hotmail.com');

INSERT INTO docente(cuil, dni, fecha_contratac, honorarios) VALUES('20-3524-4',17945351,'2014-06-22',150);

INSERT INTO es_docente_de(cuil, codigo) VALUES('20-3524-4',1);
