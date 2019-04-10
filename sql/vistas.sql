create view ver_horario_1ASIR as

select dia,hora_inicio,hora_fin,m.nombre,concat(tipo_aula,' ',id_aula) AS aula
from horario
natural join modulos m
where id_modulo>=1 and id_modulo<=6
ORDER BY case when dia='Lunes' then '1'
            when dia='Martes' then '2'
            when dia='Miercoles' then '3'
            when dia='Jueves' then '4'
            when dia='Viernes' then '5'
        end,hora_inicio;


create view ver_horario_2ASIR as

select dia,hora_inicio,hora_fin,m.nombre,concat(tipo_aula,' ',id_aula) as aula
from horario
natural join modulos m
where id_modulo>=7 and id_modulo<=12
ORDER BY case when dia='Lunes' then '1'
            when dia='Martes' then '2'
            when dia='Miercoles' then '3'
            when dia='Jueves' then '4'
            when dia='Viernes' then '5'
        end,hora_inicio;


create view ver_notas_tareas as

select t.nombre_tarea,m.nombre as asignatura,a.nombre,a.apellido1,r.nota
from alumnos a
join realizar r on a.id_alumno = r.id_alumno
join tareas t on r.id_tarea = t.id_tarea
join modulos m on t.id_modulo = m.id_modulo;


create view media_tareas as

SELECT a.nombre,a.apellido1,count(r.nota) as "tareas realizadas",format(avg(r.nota),'2') as"nota media"
from alumnos a
join realizar r on a.id_alumno = r.id_alumno
join tareas t on r.id_tarea = t.id_tarea
group by a.nombre,a.apellido1

