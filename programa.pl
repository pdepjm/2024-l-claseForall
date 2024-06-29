%fuente indec
%inflacion(mes, porcentaje).
inflación(agosto, 12).
inflacion(septiembre, 12).
inflacion(octubre, 8).
inflacion(noviembre, 12).
inflacion(diciembre, 25).
inflacion(enero, 20).
inflacion(febrero, 13).
inflacion(marzo, 11).
inflacion(abril, 8).

% aumento(????????, mes, porcentaje)
aumento(docente, agosto, 11).
aumento(docente, septiembre, 10).
aumento(docente, octubre, 12).
aumento(docente, noviembre, 9).
aumento(docente, diciembre, 6).
aumento(docente, enero, 0).
aumento(docente, febrero, 16).
aumento(docente, marzo, 12).
aumento(docente, abril, 8).
aumento(docente, mayo, 9).

aumento(informático, noviembre, 201).
aumento(informático, diciembre, 301).
aumento(informático, enero, 1).
aumento(informático, febrero, 501).
aumento(informático, marzo, 304).





aumento(empresaFalsa,noviembre, 100).
aumento(empresaFalsa,diciembre, 200).
aumento(empresaFalsa,enero, 50).
aumento(empresaFalsa,febrero, 30).

rubro(docente).
rubro(informático).
%rubro(jubilado).

mes(noviembre).
mes(diciembre).
mes(enero).
mes(diciembre).

% queremos saber si un rubro perdió ante la inflación
perdio(Rubro, Mes):-
     inflacion(Mes, Inflacion),
     aumento(Rubro, Mes, Aumento),
     Inflacion > Aumento.

% existe algún mes en el que perdieron los docentes
% si existe algún rubro que perdió en agosto


unRubroQueNuncaPerdio(Rubro):-
    rubro(Rubro),
    not(perdio(Rubro, _)).

siemprePerdio(Rubro):-
     rubro(Rubro),
     forall(mes(Mes), perdio(Rubro, Mes)).

 % un mes es nefasto si ningún aumento superó la inflación
nefasto(Mes):-
    mes(Mes),
    forall(rubro(Rubro), perdio(Rubro, Mes)).

 % Un ejemplo mas de inversibilidad.
digito(1).
digito(2).
digito(3).
digito(4).   


claveValida(A,B,C):-
    digito(A),
    digito(B),
    digito(C),
    A<B,
    B<C.
