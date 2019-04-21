/**Alter Tables**/

/**Table Predio **/
alter table Predio add PRIMARY KEY (CodPredio);

/** Table Sala **/
alter table Sala add FOREIGN KEY (CodPred) references Predio(CodPredio);
alter table Sala add PRIMARY KEY (CodPred, NumSala);

/** Table Titulacao **/
alter table Titulacao add PRIMARY key (CodigoTitulacao);

/** Table Depto **/
alter table Depto add PRIMARY key (CodDepto);

/** Table Professor **/
alter table Professor add PRIMARY key (CodigoProfessor);
alter table Professor add FOREIGN key (CodDepto) references Depto(CodDepto);
alter table Professor add FOREIGN key (CodTitulacao) references Titulacao (CodigoTitulacao);

/** Table Disciplina **/
alter table Disciplina add FOREIGN key (CodDepartamento) references Depto (CodDepto);
alter table Disciplina add PRIMARY key (CodDepartamento, NumDisciplina);

/** Table Turma **/
alter table Turma add FOREIGN key (CodDepto, NumDisc) references Disciplina (CodDepartamento, NumDisciplina);
alter table Turma add PRIMARY key (AnoSem, CodDepto, NumDisc, SiglaTur);

/** Table ProfTurma **/
alter table ProfTurma add FOREIGN key (AnoSemestre, CodDepto, NumDisciplina, SiglaTurma) references Turma (AnoSem, CodDepto, NumDisc, SiglaTur);
alter table ProfTurma add FOREIGN key (CodProfessor) references Professor (CodigoProfessor);
alter table ProfTurma add PRIMARY key (AnoSemestre, CodDepto, NumDisciplina, SiglaTurma, CodProfessor);

/** Table Horario **/
alter table Horario add FOREIGN key (AnoSemestre, CodDepartamento, NumDisciplina, SiglaTurma) references Turma (AnoSem, CodDepto, NumDisc, SiglaTur);
alter table Horario add FOREIGN key (CodPredio, NumSala) references Sala (CodPred, NumSala);
alter table Horario add PRIMARY key (AnoSemestre, CodDepartamento, NumDisciplina, SiglaTurma, DiaSemestre, HoraInicio);

alter table horario drop primary key;


/** Table PreRequesito **/
alter table PreRequesito RENAME COLUMN NumDisciplinaPreRequeisito TO NumDisciplinaPreRequesito;
alter table PreRequesito add FOREIGN key (CodDepto, NumDisciplina) references Disciplina (CodDepartamento, NumDisciplina);
alter table PreRequesito add FOREIGN key (CodDeptoPreRequesito, NumDisciplinaPreRequesito) references Disciplina (CodDepartamento, NumDisciplina);
alter table PreRequesito add PRIMARY key (CodDeptoPreRequesito, NumDisciplinaPreRequesito, CodDepto, NumDisciplina);

/** INSERTS **/
BEGIN
    Insert into Predio (codpredio, nomepredio)
    values
        (43423, 'Informática - aulas');
    
    Insert into Predio (codpredio, nomepredio)
    values
        (43529, 'Polimeros - aulas');
    
    Insert into Predio (codpredio, nomepredio)
    values  
        (43981, 'Comex - aulas');
END;


CREATE OR REPLACE PROCEDURE insert_Sala(p_CodPred IN INT, p_NumSala IN INT, p_DescricaoSala IN VARCHAR2, p_CapacSala IN INT)
AS
BEGIN
    Insert into Sala (CodPred, NumSala, DescricaoSala, CapacSala)
    values
        (p_CodPred, p_NumSala, p_DescricaoSala, p_CapacSala);
END;


CREATE OR REPLACE PROCEDURE insert_Depto(p_CodDepto IN CHAR, p_NomeDepto VARCHAR2)
AS
BEGIN
    Insert into Depto (CodDepto, NomeDepto)
    values
        (p_CodDepto, p_NomeDepto);
END;


CREATE OR REPLACE PROCEDURE insert_Disciplina(p_CodDepartamento IN VARCHAR2, p_numdisciplina IN INT, p_nomedisciplina VARCHAR2, p_creditodisciplina IN INT)
AS
BEGIN
    Insert into Disciplina (CodDepartamento, numdisciplina, nomedisciplina, creditodisciplina)
    values
        (p_CodDepartamento, p_numdisciplina, p_nomedisciplina, p_creditodisciplina);
END;


CREATE OR REPLACE PROCEDURE insert_Titulacao(p_codigotitulacao IN INT, p_nometitulacao IN VARCHAR2)
AS
BEGIN
    Insert into titulacao (codigotitulacao, nometitulacao)
    values
        (p_codigotitulacao, p_nometitulacao);
END;


CREATE OR REPLACE PROCEDURE insert_Professor(p_codigoprofessor IN INT, p_coddepto IN VARCHAR2, p_codtitulacao IN INT, p_nomeprofessor IN VARCHAR2)
AS
BEGIN
    Insert into Professor (codigoprofessor, coddepto, codtitulacao, nomeprofessor)
    values
        (p_codigoprofessor, p_coddepto, p_codtitulacao, p_nomeprofessor);
END;


CREATE OR REPLACE PROCEDURE insert_Turma(p_anosem IN INT, p_coddepto IN VARCHAR2, p_numdisc IN INT, p_siglatur IN VARCHAR2, p_capactur IN INT)
AS
BEGIN
    Insert into Turma (anosem, coddepto, numdisc, siglatur, capactur)
    values
        (p_anosem, p_coddepto, p_numdisc, p_siglatur, p_capactur);
END;


CREATE OR REPLACE PROCEDURE insert_profturma(p_anosemestre IN INT, p_coddepto IN VARCHAR2, p_numdisciplina IN INT, p_siglaturma IN VARCHAR2, p_codprofessor IN INT)
AS
BEGIN
    Insert into profturma (anosemestre, coddepto, numdisciplina, siglaturma, codprofessor)
    values
        (p_anosemestre, p_coddepto, p_numdisciplina, p_siglaturma, p_codprofessor);
END;


CREATE OR REPLACE PROCEDURE insert_Horario(p_anosemestre IN INT, p_coddepartamento IN VARCHAR2, p_numdisciplina IN INT,
                                                p_siglaturma IN VARCHAR2, p_diasemestre IN INT, p_horainicio IN INT,
                                                    p_numsala IN INT, p_codpredio IN INT, p_numerohoras IN INT)
AS
BEGIN
    Insert into horario (anosemestre, coddepartamento, numdisciplina, siglaturma, diasemestre, horainicio, numsala, codpredio, numerohoras)
    values
        (p_anosemestre, p_coddepartamento, p_numdisciplina, p_siglaturma, p_diasemestre, p_horainicio, p_numsala, p_codpredio, p_numerohoras);
END;


CREATE OR REPLACE PROCEDURE insert_PreRequesito(p_coddeptoprerequesito IN VARCHAR2, p_numdisciplinaprerequesito IN INT,
                                                    p_coddepto IN VARCHAR2, p_numdisciplina IN INT)
AS
BEGIN
    Insert into PreRequesito (coddeptoprerequesito, numdisciplinaprerequesito, coddepto, numdisciplina)
    values(
        p_coddeptoprerequesito, p_numdisciplinaprerequesito, p_coddepto, p_numdisciplina
    );
END;


/** Chamada Inserts **/

/** Insert Sala **/
EXEC insert_Sala(43423, 101, 'Sala Comum', 20);
EXEC insert_Sala(43423,102,'Sala Comum',20); 
EXEC insert_Sala(43423,103,'Laboratorio',30);
EXEC insert_Sala(43423,104,'Laboratorio',50);

EXEC insert_Sala(43529,10,'Sala Comum',30);
EXEC insert_Sala(43529,11,'Sala Comum',30);
EXEC insert_Sala(43529,20,'Laboratorio',60);
EXEC insert_Sala(43529,21,'Laboratorio',60);

EXEC insert_Sala(43981,1,'Sala Comum',30);
EXEC insert_Sala(43981,2,'Sala Comum',30);
EXEC insert_Sala(43981,3,'Sala Comum',30);
EXEC insert_Sala(43981,4,'Laboratorio',60);

Select * From Sala Order By NumSala ASC;

/** Insert Depto **/
EXEC insert_Depto('INF01','Informatica');
EXEC insert_Depto('POL01','Polimeros');
EXEC insert_Depto('COM01','COMEX');

Select * from depto;

/** Insert Disciplina**/
EXEC insert_disciplina('INF01', 1 ,'Eng1',2);
EXEC insert_disciplina('INF01', 2 ,'Eng2',2);
EXEC insert_disciplina('INF01', 3 ,'Log1',2);
EXEC insert_disciplina('COM01', 4 ,'Ing1',1);
EXEC insert_disciplina('COM01', 5 ,'Ing2',1);
EXEC insert_disciplina('COM01', 6 ,'Ing3',1);
EXEC insert_disciplina('POL01', 7 ,'Cal1',2);
EXEC insert_disciplina('POL01', 8 ,'Cal2',2);

Select * from disciplina;
    
/**INSERT TITULACAO**/       
EXEC insert_titulacao(1,'Doutor');
EXEC insert_titulacao(2,'Mestre');
EXEC insert_titulacao( 3,'Coordenador');

Select * From Titulacao;
        
/** INSERT Professor **/
EXEC insert_professor(1,'INF01',1,'Antunes');
EXEC insert_professor(2,'INF01',2,'Semaj');
EXEC insert_professor(3,'INF01',3,'Ricardo');
EXEC insert_professor(4,'COM01',1,'Irineu');
EXEC insert_professor(5,'COM01',2,'Jailson');
EXEC insert_professor(6,'COM01',3,'Mario');
EXEC insert_professor(7,'POL01',1,'Joao');
EXEC insert_professor(8,'POL01',2,'Marcelo');
EXEC insert_professor(9,'POL01',3,'Manoel');
EXEC insert_professor(10,'POL01',1,'Maria');

Select * From professor;

/** INSERT Turma **/
EXEC insert_TURMA(20021,'INF01',1,'1D',50);
EXEC insert_TURMA(20021,'INF01',3,'1D',50);
EXEC insert_TURMA(20021,'COM01',4,'1A',30);
EXEC insert_TURMA(20021,'POL01',7,'1B',30);
EXEC insert_TURMA(20022,'INF01',2,'1D',50);
EXEC insert_TURMA(20022,'COM01',5,'1A',30);
EXEC insert_TURMA(20022,'POL01',8,'1B',30);
EXEC insert_TURMA(20031,'COM01',6,'1A',30);

Select * from turma;

/** INSERT profturma**/
EXEC insert_profturma(20021,'INF01',1,'1D',1);
EXEC insert_profturma(20021,'INF01',3,'1D',2);
EXEC insert_profturma(20021,'COM01',4,'1A',4);
EXEC insert_profturma(20022,'COM01',5,'1A',5);
EXEC insert_profturma(20031,'COM01',6,'1A',6);
EXEC insert_profturma(20021,'POL01',7,'1B',7);
EXEC insert_profturma(20022,'POL01',8,'1B',9);
EXEC insert_profturma(20022,'COM01',5,'1A',1);

Select * from profturma;

/** INSERT HORARIO**/
EXEC insert_horario(20021,'INF01',1,'1D',2,19,43423,101,4);
EXEC insert_horario(20021,'INF01',3,'1D',3,19,43423,102,4);
EXEC insert_horario(20021,'COM01',4,'1A',2,19,43981,1,2);
EXEC insert_horario(20022,'COM01',5,'1A',4,19,43981,2,2);
EXEC insert_horario(20031,'COM01',6,'1A',5,19,43981,3,2);
EXEC insert_horario(20021,'POL01',7,'1B',3,19,43529,10,4);
EXEC insert_horario(20022,'POL01',8,'1B',6,19,43529,11,4);
EXEC insert_horario(20022,'COM01',5,'1A',4,21,43981,2,2);

Select * from horario;

/** INSERT PreRequesito **/
EXEC insert_prerequesito('INF01',1,'INF01',2);
EXEC insert_prerequesito('COM01',4,'COM01',5);
EXEC insert_prerequesito('COM01',5,'COM01',6);
EXEC insert_prerequesito('POL01',7,'POL01',8);

Select * from prerequesito;
