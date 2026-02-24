CREATE TABLE materias (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nome_materia VARCHAR(100),
    dia_de_aula VARCHAR(20),
    quantidade_aulas INT
);


CREATE TABLE professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(100)
);


CREATE TABLE atribuicao_aulas (
    id_atribuicao INT PRIMARY KEY AUTO_INCREMENT,
    fk_professor INT,
    fk_materia INT,
    FOREIGN KEY (fk_professor) REFERENCES professores(id_professor),
    FOREIGN KEY (fk_materia) REFERENCES materias(id_materia)
    )
    ;
    
    INSERT INTO materias (id_materia, nome_materia, dia_de_aula, quantidade_aulas)
VALUES
(1, 'ALGORITMOS E ESTRUTURA DE DADOS 1', NULL, NULL),
(2, 'COMPORTAMENTO ORGANIZACIONAL', NULL, NULL),
(3, 'LINGUA PORTUGUESA E LITERATURA', NULL, NULL),
(4, 'NEGOCIOS E ORGANIZACOES', NULL, NULL),
(5, 'MATEMATICA', NULL, NULL),
(6, 'EMPREENDEDORISMO', NULL, NULL),
(7, 'MARKETING DIGITAL', NULL, NULL),
(8, 'LOGICA COMPUTACIONAL', NULL, NULL),
(9, 'ALGORITMOS E ESTRUTURA DE DADOS 2', NULL, NULL),
(10, 'ESTATISTICA 1', NULL, NULL),
(11, 'TECNICAS DE PROGRAMACAO', 'SEGUNDA-FEIRA', 4),
(12, 'LINGUA INGLESA 1', 'TERCA-FEIRA', 4),
(13, 'ALGEBRA LINEAR', 'QUARTA-FEIRA', 4),
(14, 'ESTATISTICA 2', 'QUINTA-FEIRA', 4),
(15, 'BANCO DE DADOS 1', 'SEXTA-FEIRA' , 4);

INSERT INTO professores (id_professor, nome_professor) 
VALUES
(1, 'JOSENYR'),
(2, 'ALEXANDER HOMENKO'),
(3, 'MONICA'),
(4, 'LELIA'),
(5, 'LILIAN'),
(6, 'CAIO'),
(7, 'PADILHA'),
(8, 'CARLOS'),
(9, 'ROMULO'),
(10, 'SEBASTIAO'),
(11, 'MAURICIO'),
(12, 'LEVI'),
(13, 'JOSE');

INSERT INTO atribuicao_aulas (fk_professor, fk_materia) 
VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(3, 12),
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8),  
(9, 9),  
(10, 10),
(10, 14),
(11, 11),
(12, 13),
(13, 15);

CREATE VIEW v_grade_semanal AS
SELECT 
    m.dia_de_aula AS 'Dia',
    m.nome_materia AS 'Disciplina',
    p.nome_professor AS 'Professor',
    m.quantidade_aulas AS 'Aulas'
FROM atribuicao_aulas a
JOIN professores p ON a.fk_professor = p.id_professor
JOIN materias m ON a.fk_materia = m.id_materia
WHERE m.dia_de_aula IS NOT NULL
ORDER BY FIELD(m.dia_de_aula, 'SEGUNDA-FEIRA', 'TERCA-FEIRA', 'QUARTA-FEIRA', 'QUINTA-FEIRA', 'SEXTA-FEIRA');