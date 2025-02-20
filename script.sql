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
('Leonardo', 'Nascimento Souza Cruz', '2002-05-30'),
('Guilherme', 'Riguiti de Oliveira', '1997-04-03'),
('Pedro Henrique', 'Carlos de Souza Machado', '1999-03-12'),
('Marcos Tarcisio', 'Buettel Mota', '1991-04-04');


INSERT INTO alunos (primeiro_nome, sobrenome, data_nascimento) VALUES
('Lucas', 'dos Santos Narciso', '2001-07-31'),
('Luiz Octavio', 'Barros Rodrigues', '1996-12-12'),
('João Marcus', 'da Silva Sousa', '1999-09-17'),
('Flávia Aparecida', 'Ferrari Toscano', '2001-10-03');

select * from alunos;

INSERT INTO tipo_disciplina (nome)
VALUES 
    ('Formação Básica'), 
    ('Práticas Profissionais'),
    ('Formação Complementar'),
    ('Projeto Aplicado à Comunidade'),
    ('Optativa');

INSERT INTO disciplinas (nome, tipo_disciplina_id)
VALUES 
    ('Laboratório de Banco de Dados', (SELECT id FROM tipo_disciplina WHERE nome = 'Práticas Profissionais')),
    ('Optativa I', (SELECT id FROM tipo_disciplina WHERE nome = 'Optativa')),
    ('Governança em Tecnologia da Informação', (SELECT id FROM tipo_disciplina WHERE nome = 'Formação Complementar')),
    ('Linguagem de Programação I', (SELECT id FROM tipo_disciplina WHERE nome = 'Práticas Profissionais'));



