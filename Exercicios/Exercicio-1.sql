/**
    1 - Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre
    2002/1 

**/

SELECT DISTINCT
    CodDepto
FROM
    Turma t
WHERE
    t.anosem = 20021;
    commit;