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
