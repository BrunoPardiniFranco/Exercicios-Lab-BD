
SELECT DISTINCT
    d.NomeDepto
FROM
    Depto d
INNER JOIN
    Professor P
ON
    (d.coddepto = p.coddepto)
    INNER JOIN
        ProfTurma pt
    ON
        (p.coddepto = pt.coddepto)
        INNER JOIN
            Turma t
        ON
            (pt.anosemestre = t.anoSem AND pt.coddepto = t.codDepto)
            INNER JOIN
                Horario h
            ON
                (t.anosem = h.anosemestre AND t.coddepto = h.coddepartamento AND h.anosemestre = 20021)
                INNER JOIN
                    Sala s
                ON
                    (h.numsala = s.numsala AND h.codpredio = s.codpred AND s.numsala = 101)
                    INNER JOIN
                        Predio
                    ON
                        (s.codpred = Predio.codpredio AND UPPER(Predio.NomePredio) = 'INFORMÁTICA - AULAS')
        
;
commit;