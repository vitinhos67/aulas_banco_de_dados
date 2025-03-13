CREATE TABLE alunos (
    id int PRIMARY key GENERATED ALWAYS AS IDENTITY,
    primeiro_nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE tipo_disciplina (
    id int PRIMARY key GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE disciplinas (
    id int PRIMARY key GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(255) NOT NULL,
    tipo_disciplina_id INT NOT NULL,
    FOREIGN KEY (tipo_disciplina_id) REFERENCES tipo_disciplina(id) ON DELETE CASCADE
);

CREATE TABLE aluno_disciplina (
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    PRIMARY KEY (aluno_id, disciplina_id),
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) ON DELETE CASCADE
);

INSERT INTO alunos (primeiro_nome, sobrenome, data_nascimento) VALUES
('Leonardo Nascimento Souza Cruz', 'Cruz', '2002-05-30'),
('Guilherme Riguiti de Oliveira', 'Oliveira', '1997-04-03'),
('Pedro Henrique Carlos de Souza Machado', 'Machado', '1999-03-12'),
('Marcos Tarcisio Buettel Mota', 'Mota', '1991-04-04');
.

INSERT INTO alunos (primeiro_nome, sobrenome, data_nascimento) VALUES
('Lucas dos Santos Narciso', 'Narciso', '2001-07-31'),
('Luiz Octavio Barros Rodrigues', 'Rodrigues', '1996-12-12'),
('João Marcus da Silva Sousa', 'Sousa', '1999-09-17'),
('Flávia Aparecida Ferrari Toscano', 'Toscano', '2001-10-03');

INSERT INTO tipo_disciplina (nome) VALUES
('Formação Básica'),
('Práticas Profissionais'),
('Formação Complementar'),
('Projeto Aplicado à Comunidade'),
('Optativa');


INSERT INTO disciplinas (nome, tipo_disciplina_id) VALUES
('Laboratório de Banco de Dados', (SELECT id FROM tipo_disciplina WHERE nome = 'Práticas Profissionais')),
('Optativa I', (SELECT id FROM tipo_disciplina WHERE nome = 'Optativa')),
('Governança em Tecnologia da Informação', (SELECT id FROM tipo_disciplina WHERE nome = 'Formação Complementar')),
('Linguagem de Programação I', (SELECT id FROM tipo_disciplina WHERE nome = 'Práticas Profissionais'));

INSERT INTO disciplinas (nome, tipo_disciplina_id) VALUES
('Algoritmos', (SELECT id FROM tipo_disciplina WHERE nome = 'Formação Básica')),
('Engenharia de Software', (SELECT id FROM tipo_disciplina WHERE nome = 'Práticas Profissionais')),
('Gestão de Projetos', (SELECT id FROM tipo_disciplina WHERE nome = 'Formação Complementar')),
('Projeto Aplicado à Comunidade IV', (SELECT id FROM tipo_disciplina WHERE nome = 'Projeto Aplicado à Comunidade')),
('Estruturas de Dados', (SELECT id FROM tipo_disciplina WHERE nome = 'Formação Básica'));

select * from alunos;

INSERT INTO aluno_disciplina (aluno_id, disciplina_id) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 6),
(2, 2),
(2, 3),
(2, 7),
(2, 6),
(3, 2),
(3, 4),
(3, 7),
(3, 6);

INSERT INTO aluno_disciplina (aluno_id, disciplina_id) VALUES
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 1),
(5, 2),
(5, 6),
(5, 7),
(5, 8);

INSERT INTO aluno_disciplina (aluno_id, disciplina_id) VALUES
(6, 3),
(6, 6),
(6, 8),
(7, 3),
(7, 4),
(7, 8),
(8, 1),
(8, 4),
(8, 5),
(8, 7),
(8, 8);

SELECT * FROM disciplinas;


SELECT primeiro_nome AS Nome, sobrenome AS Sobrenome, data_nascimento AS "Data de nascimento" FROM alunos;

SELECT a.primeiro_nome AS Nome, a.sobrenome AS Sobrenome, a.data_nascimento AS "Data de nascimento"
FROM alunos a
JOIN aluno_disciplina ad ON a.id = ad.aluno_id
WHERE ad.disciplina_id = 1;


SELECT primeiro_nome AS Nome, sobrenome AS Sobrenome, data_nascimento AS "Data de nascimento"
FROM alunos
ORDER BY data_nascimento ASC;

SELECT d.nome AS "Nome da disciplina", td.nome AS "Unidade de ensino"
FROM disciplinas d
JOIN tipo_disciplina td ON d.tipo_disciplina_id = td.id
ORDER BY td.nome DESC;

SELECT primeiro_nome AS "Primeiro nome do aluno", sobrenome AS "Sobrenome do aluno", data_nascimento AS "Data de nascimento do aluno"
FROM alunos
WHERE data_nascimento > '2000-01-01'
ORDER BY data_nascimento ASC;

SELECT primeiro_nome AS Nome, sobrenome AS Sobrenome, data_nascimento AS "Data de nascimento"
FROM alunos
WHERE primeiro_nome LIKE '%o';

SELECT *
FROM alunos
WHERE id = 6
OR id IN (SELECT aluno_id FROM aluno_disciplina WHERE disciplina_id = 1);

SELECT d.nome AS Disciplina, td.nome AS Area
FROM disciplinas d
JOIN tipo_disciplina td ON d.tipo_disciplina_id = td.id
WHERE d.nome LIKE 'L%' OR d.nome LIKE 'G%'
ORDER BY d.nome;


SELECT 
  primeiro_nome AS "Nome do cliente", 
  sobrenome AS "Sobrenome do cliente", 
  data_nascimento AS "Data de nascimento do cliente"
FROM alunos
WHERE sobrenome LIKE '%a' AND primeiro_nome ~* 'm.*a'
ORDER BY data_nascimento DESC;

SELECT * FROM alunos
WHERE data_nascimento BETWEEN '1998-01-01' AND '2001-12-31';

select * from alunos where primeiro_nome in ('Rafael', 'Leonardo', 'Pedro', 'Lucas', 'Maria', 'Aparecida');

SELECT DISTINCT a.id, a.primeiro_nome, a.sobrenome, a.data_nascimento
FROM alunos a
JOIN aluno_disciplina ad ON a.id = ad.aluno_id;


SELECT *
FROM tipo_disciplina
WHERE nome IN ('Formação Básica', 'Formação acadêmica', 'Opcional', 'Optativa', 'Optimus Prime')
AND (nome LIKE 'F%' OR nome LIKE 'O%');

select nome from disciplinas d where nome between 'Algoritmos' and 'Gestão de projetos' order by nome desc; 

select * from alunos;

SELECT primeiro_nome AS "Primeiro Nome", sobrenome AS "Sobrenome", data_nascimento AS "Data Nascimento"
FROM alunos
WHERE primeiro_nome LIKE 'o%' AND sobrenome BETWEEN 'Anubis' AND 'Xerxes'
ORDER BY primeiro_nome;

ALTER TABLE aluno_disciplina
ADD COLUMN p1 FLOAT DEFAULT 0 CHECK (p1 >= 0 AND p1 <= 50);

ALTER TABLE aluno_disciplina
ADD COLUMN p2 FLOAT DEFAULT 0 CHECK (p2 >= 0 AND p2 <= 50);

ALTER TABLE aluno_disciplina
ADD COLUMN falta int;

select * from alunos;

select * from disciplinas;
select * from aluno_disciplina where aluno_id = 1;

--Leonardo
UPDATE aluno_disciplina
SET p1 = 28.3, p2 = 41.0, falta = 1
WHERE disciplina_id = 1 AND aluno_id = 1;

UPDATE aluno_disciplina
SET p1 = 18.7, p2 = 40.2, falta = 6
WHERE disciplina_id = 3 AND aluno_id = 1;

UPDATE aluno_disciplina
SET p1 = 17.0, p2 = 14.5, falta = 10
WHERE disciplina_id = 6 AND aluno_id = 1;

UPDATE aluno_disciplina
SET p1 = 38.1, p2 = 10.5, falta = 7
WHERE disciplina_id = 8 AND aluno_id = 1;

--Guilherme
UPDATE aluno_disciplina
SET p1 = 49.0, p2 = 35.5, falta = 14
WHERE disciplina_id = 2 AND aluno_id = 2;

UPDATE aluno_disciplina
SET p1 = 18.8, p2 = 25.7, falta = 2
WHERE disciplina_id = 3 AND aluno_id = 2;

UPDATE aluno_disciplina
SET p1 = 29.1, p2 = 33.7, falta = 5
WHERE disciplina_id = 7 AND aluno_id = 2;

UPDATE aluno_disciplina
SET p1 = 37.6, p2 = 22.4, falta = 3
WHERE disciplina_id = 8 AND aluno_id = 2;

-- Pedro
UPDATE aluno_disciplina
SET p1 = 17.9, p2 = 44.5, falta = 7
WHERE disciplina_id = 2 AND aluno_id = 3;

UPDATE aluno_disciplina
SET p1 = 12.0, p2 = 32.4, falta = 0
WHERE disciplina_id = 4 AND aluno_id = 3;

UPDATE aluno_disciplina
SET p1 = 9.2, p2 = 27.3, falta = 11
WHERE disciplina_id = 7 AND aluno_id = 3;

UPDATE aluno_disciplina
SET p1 = 28.0, p2 = 36.1, falta = 4
WHERE disciplina_id = 8 AND aluno_id = 3;


-- Marcos Tarcisio Buettel Mota
UPDATE aluno_disciplina
SET p1 = 13.0, p2 = 26.7, falta = 10
WHERE disciplina_id = 1 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 29.4, p2 = 34.1, falta = 1
WHERE disciplina_id = 2 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 45.5, p2 = 16.8, falta = 12
WHERE disciplina_id = 3 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 38.7, p2 = 11.2, falta = 2
WHERE disciplina_id = 4 AND aluno_id = 4;


UPDATE aluno_disciplina
SET p1 = 4.0, p2 = 18.5, falta = 12
WHERE disciplina_id = 5 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 21.6, p2 = 40.8, falta = 6
WHERE disciplina_id = 6 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 35.0, p2 = 12.7, falta = 8
WHERE disciplina_id = 7 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 22.1, p2 = 42.3, falta = 1
WHERE disciplina_id = 8 AND aluno_id = 4;

UPDATE aluno_disciplina
SET p1 = 49.2, p2 = 29.9, falta = 0
WHERE disciplina_id = 9 AND aluno_id = 4;

-- Lucas
UPDATE aluno_disciplina
SET p1 = 7.0, p2 = 44.5, falta = 9
WHERE disciplina_id = 1 AND aluno_id = 5;

UPDATE aluno_disciplina
SET p1 = 41.8, p2 = 36.8, falta = 14
WHERE disciplina_id = 2 AND aluno_id = 5;

UPDATE aluno_disciplina
SET p1 = 12.6, p2 = 40.2, falta = 8
WHERE disciplina_id = 6 AND aluno_id = 5;

UPDATE aluno_disciplina
SET p1 = 26.4, p2 = 18.7, falta = 11
WHERE disciplina_id = 7 AND aluno_id = 5;

UPDATE aluno_disciplina
SET p1 = 47.4, p2 = 32.1, falta = 5
WHERE disciplina_id = 8 AND aluno_id = 5;

-- Luiz

UPDATE aluno_disciplina
SET p1 = 0.0, p2 = 37.5, falta = 12
WHERE disciplina_id = 3 AND aluno_id = 6;

UPDATE aluno_disciplina
SET p1 = 48.5, p2 = 28.9, falta = 4
WHERE disciplina_id = 6 AND aluno_id = 6;

UPDATE aluno_disciplina
SET p1 = 37.3, p2 = 39.1, falta = 13
WHERE disciplina_id = 8 AND aluno_id = 6;

-- Flavia

UPDATE aluno_disciplina
SET p1 = 27.8, p2 = 42.1, falta = 0
WHERE disciplina_id = 1 AND aluno_id = 8;

UPDATE aluno_disciplina
SET p1 = 45.3, p2 = 21.2, falta = 11
WHERE disciplina_id = 4 AND aluno_id = 8;

UPDATE aluno_disciplina
SET p1 = 3.7, p2 = 36.3, falta = 15
WHERE disciplina_id = 5 AND aluno_id = 8;

UPDATE aluno_disciplina
SET p1 = 16.5, p2 = 41.7, falta = 5
WHERE disciplina_id = 7 AND aluno_id = 8;

UPDATE aluno_disciplina
SET p1 = 46.2, p2 = 44.5, falta = 2
WHERE disciplina_id = 8 AND aluno_id = 8;

select * from aluno_disciplina;
