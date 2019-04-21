
SELECT 
    p.codigoprofessor, p.nomeprofessor, dp.NOMEDEPTO AS "Dpto_Professor", dpto.NOMEDEPTO AS "Dpto_Ministrado"
FROM
    professor p
INNER JOIN
    ProfTurma pt
ON
    (p.codigoprofessor = pt.codprofessor AND p.coddepto != pt.coddepto)
INNER JOIN
    Depto dp
ON
    (p.coddepto = dp.CODDEPTO)
INNER JOIN
    Depto dpto
ON
    (pt.coddepto  = dpto.coddepto)
;