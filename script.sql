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