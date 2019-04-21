SELECT DISTINCT
    h.diaSemestre, h.HoraInicio, h.NumeroHoras
FROM
    Horario h
INNER JOIN
    Turma t
ON 
    (h.anosemestre = t.anosem AND h.codDepartamento = t.codDepto AND h.numdisciplina = t.numDisc AND h.siglaturma = t.siglaTur)
    INNER JOIN
        ProfTurma pt
    ON
        (t.anosem = pt.anoSemestre AND t.codDepto = pt.codDepto AND t.numdisc = pt.numDisciplina AND t.siglaTur = pt.siglaTurma)
        INNER JOIN
            Professor p
        ON
           (pt.codProfessor = p.codigoprofessor)
        WHERE
            UPPER(p.nomeprofessor) = 'Antunes'
AND
    h.anosemestre = 20021;