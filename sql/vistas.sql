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

create view ver_horario_1ASIR_bien as

select concat(h1.hora_inicio,'-',h1.hora_fin) as hora,concat(m.nombre,' ',concat(h.tipo_aula,' ',h.id_aula)) AS Lunes,concat(m1.nombre,' ',concat(h1.tipo_aula,' ',h1.id_aula)) AS Martes,
       concat(m2.nombre,' ',concat(h2.tipo_aula,' ',h2.id_aula)) AS Miercoles,concat(m3.nombre,' ',concat(h3.tipo_aula,' ',h3.id_aula)) AS Jueves,
       concat(m4.nombre,' ',concat(h4.tipo_aula,' ',h4.id_aula)) AS Viernes
from horario h
cross join modulos m
cross join horario h1
cross join modulos m1
cross join horario h2
cross join modulos m2
cross join horario h3
cross join modulos m3
cross join horario h4
cross join modulos m4

where m.id_modulo>=1 and m.id_modulo<=6 and m1.id_modulo>=1 and m1.id_modulo<=6 and m2.id_modulo>=1 and m2.id_modulo<=6 and m3.id_modulo>=1 and m3.id_modulo<=6 and m4.id_modulo>=1 and m4.id_modulo<=6 and
      (h.dia='Lunes'  and h.id_modulo=m.id_modulo and h1.dia='Martes'and h1.id_modulo=m1.id_modulo and h.hora_inicio=h1.hora_inicio and
       h2.dia='Miercoles'  and h2.id_modulo=m2.id_modulo and h3.dia='Jueves'and h3.id_modulo=m3.id_modulo and h2.hora_inicio=h3.hora_inicio and
       h4.dia='Viernes' and h4.id_modulo=m4.id_modulo and h4.hora_inicio=h3.hora_inicio and h4.hora_inicio=h2.hora_inicio and h4.hora_inicio=h1.hora_inicio
         and h4.hora_inicio=h.hora_inicio and h3.hora_inicio=h1.hora_inicio and h3.hora_inicio=h.hora_inicio and h2.hora_inicio=h1.hora_inicio and h2.hora_inicio=h.hora_inicio)
order by h.hora_inicio;


create view ver_horario_2ASIR_bien as

select concat(h1.hora_inicio,'-',h1.hora_fin) as hora,concat(m.nombre,' ',concat(h.tipo_aula,' ',h.id_aula)) AS Lunes,concat(m1.nombre,' ',concat(h1.tipo_aula,' ',h1.id_aula)) AS Martes,
       concat(m2.nombre,' ',concat(h2.tipo_aula,' ',h2.id_aula)) AS Miercoles,concat(m3.nombre,' ',concat(h3.tipo_aula,' ',h3.id_aula)) AS Jueves,
       concat(m4.nombre,' ',concat(h4.tipo_aula,' ',h4.id_aula)) AS Viernes
from horario h
cross join modulos m
cross join horario h1
cross join modulos m1
cross join horario h2
cross join modulos m2
cross join horario h3
cross join modulos m3
cross join horario h4
cross join modulos m4

where m.id_modulo>=7 and m.id_modulo<=12 and m1.id_modulo>=7 and m1.id_modulo<=12 and m2.id_modulo>=7 and m2.id_modulo<=12 and m3.id_modulo>=7 and m3.id_modulo<=12 and m4.id_modulo>=7 and m4.id_modulo<=12 and
      (h.dia='Lunes'  and h.id_modulo=m.id_modulo and h1.dia='Martes'and h1.id_modulo=m1.id_modulo and h.hora_inicio=h1.hora_inicio and
       h2.dia='Miercoles'  and h2.id_modulo=m2.id_modulo and h3.dia='Jueves'and h3.id_modulo=m3.id_modulo and h2.hora_inicio=h3.hora_inicio and
       h4.dia='Viernes' and h4.id_modulo=m4.id_modulo and h4.hora_inicio=h3.hora_inicio and h4.hora_inicio=h2.hora_inicio and h4.hora_inicio=h1.hora_inicio
         and h4.hora_inicio=h.hora_inicio and h3.hora_inicio=h1.hora_inicio and h3.hora_inicio=h.hora_inicio and h2.hora_inicio=h1.hora_inicio and h2.hora_inicio=h.hora_inicio)
order by h.hora_inicio;
