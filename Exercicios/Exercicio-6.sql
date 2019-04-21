/**
    6 - Obter os identificadores das salas (código do prédio e número da sala) que, em
    2002/1:
    
    - nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do
        departamento 'Informática', e
    
    - nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma
        ministrada pelo professor denominado 'Antunes'. 
**/

SELECT
    numSala, codPredio
FROM
    Horario h
WHERE
    ((h.coddepartamento = 'INF01' and h.anosemestre = 20021 AND h.diasemestre = 2) AND (contem_Professor('antunes', 4) = 1 and h.anosemestre = 20021))
;
