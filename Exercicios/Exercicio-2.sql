/** 
    2 - Obter os códigos dos professores que são do departamento de código 'INF01' e
    que ministraram ao menos uma turma em 2002/1. 
**/

SELECT DISTINCT
    CodProfessor
FROM
    ProfTurma pt
WHERE
    (pt.coddepto = 'INF01' AND pt.anosemestre = 20021)
;
