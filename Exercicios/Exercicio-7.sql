SELECT
    h.diasemestre as "Dia_da_Semana", h.horainicio as "Hora_Inicio", SUM(h.numerohoras) as "Horas_Ministradas"
FROM
    HORARIO h
INNER JOIN
    TURMA T
ON
    (h.anosemestre = t.anosem AND h.coddepartamento = t.coddepto AND h.numdisciplina = t.numdisc AND h.siglaturma = t.siglatur)
    INNER JOIN
        ProfTurma pt
    ON
        (t.anosem = pt.anosemestre AND t.coddepto = pt.coddepto AND t.numdisc = pt.numdisciplina AND t.siglatur = pt.siglaturma)
        INNER JOIN 
            Professor p
        ON
            (pt.codprofessor = p.codigoprofessor AND UPPER(p.nomeprofessor) = UPPER('antunes'))
WHERE
    h.anosemestre = 20021 AND h.numsala = 101 AND h.codpredio = 43423
GROUP BY
    h.diasemestre, h.horainicio
;
