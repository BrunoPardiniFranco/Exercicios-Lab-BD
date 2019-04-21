/**
    5 - Obter os códigos dos professores com título denominado 'Doutor' que não
    ministraram aulas em 2002/1. 
**/

SELECT
    p.codigoProfessor, p.nomeprofessor
FROM
    Professor p
INNER JOIN
    ProfTurma pt
ON
    (p.codigoprofessor = pt.codprofessor AND pt.anosemestre != 20021)
WHERE
    p.codtitulacao = 1
; 
commit;
