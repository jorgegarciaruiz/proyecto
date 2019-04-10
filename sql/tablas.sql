create table profesores(
  id_profesor int(3),
  constraint profesores_pk primary key (id_profesor),
  nombre varchar(25),
  apellido1 varchar(25),
  apellido2 varchar(25)
);

create table cursos(
  id_curso int(3),
  constraint cursos_pk primary key (id_curso),
  nombre varchar(10) not null ,
  constraint cursos_nombre unique (nombre)
);

create table modulos(
  id_modulo int(3),
  constraint modulos_pk primary key(id_modulo),
  nombre varchar(10) not null ,
  constraint nombre_modulos_uk1 unique (nombre),
  id_curso int(3) not null ,
  constraint id_curso_modulos_fk1 foreign key (id_curso) references cursos(id_curso),
  id_profesor int(3) not null ,
  constraint id_profesor_modulos_fk2 foreign key (id_profesor) references profesores(id_profesor)

);

create table tareas(
  id_tarea int(3),
  nombre_tarea varchar(25),
  id_modulo int(3) not null ,
  constraint tareas_pk primary key (id_tarea),
    constraint tareas_fk1 foreign key (id_modulo) references modulos(id_modulo)
);
create table alumnos(
  id_alumno int(3),
  constraint alumnos_pk primary key (id_alumno),
  nombre varchar(25),
  DNI CHAR(9) NOT NULL ,
  CONSTRAINT dni_alumnos_uk1 unique (DNI),
  apellido1 varchar(25),
  apellido2 varchar(25)
);


create table realizar(
  id_alumno int(3),
  id_tarea int(3),
  constraint realizar_pk primary key (id_alumno,id_tarea),
  constraint realizar_id_alumno_fk1 foreign key (id_alumno) references alumnos(id_alumno),
  constraint realizar_id_modulo_fk2 foreign key (id_tarea) references tareas(id_tarea),
  nota decimal(4,2)
);

create table estudiar(
  id_modulo int(3),
  constraint estudiar_id_modulo_fk1 foreign key (id_modulo) references modulos(id_modulo),
  id_alumno int(3),
  constraint estudiar_id_alumno_fk2 foreign key (id_alumno) references alumnos(id_alumno),
  constraint estudiar_pk primary key (id_alumno,id_modulo)
);

create table aulas(
  id_aula int(3),
  tipo_aula char(3),
  constraint aulas_pk primary key (id_aula,tipo_aula),
  descripcion varchar(150),
  materiales varchar(150)
);

create table horario(
  id_modulo int(3),
  hora_inicio time,
  hora_fin time,
  dia varchar(10),
  id_aula int(3),
  tipo_aula char(3),
  constraint horario_pk1 primary key (id_modulo,dia,hora_inicio),
  constraint horario_fk1 foreign key (id_aula,tipo_aula) references aulas(id_aula, tipo_aula),
  constraint horario_fk2 foreign key (id_modulo) references modulos(id_modulo)

);
