-- Script de Inserção de Dados (DML) - Projeto SGA-DEV
-- Autor: Daniel Félix
-- Data: 18/11/2025
-- 1. Inserindo CURSOS
INSERT INTO curso (nome_curso, duracao_semestres)
VALUES ('Ciência da Computação', 8),
    ('Engenharia de Software', 8),
    ('Sistemas de Informação', 8);
-- 2. Inserindo PROFESSORES
INSERT INTO professor (nome, especialidade, email, telefone)
VALUES (
        'Dr. Claudio Silva',
        'Banco de Dados',
        'claudio@faculdade.edu.br',
        '11999990001'
    ),
    (
        'Dra. Ana Paula',
        'Algoritmos',
        'ana@faculdade.edu.br',
        '11999990002'
    ),
    (
        'Msc. Roberto Lima',
        'Engenharia de Software',
        'roberto@faculdade.edu.br',
        '11999990003'
    );
-- 3. Inserindo ALUNOS
INSERT INTO aluno (nome, cpf, email, telefone, data_nascimento)
VALUES (
        'Daniel Félix',
        '11122233344',
        'daniel@email.com',
        '13999991111',
        '1985-05-20'
    ),
    (
        'Lorenzo Oliveira',
        '22233344455',
        'lorenzo@email.com',
        '13999992222',
        '2014-10-10'
    ),
    (
        'Marina Oliveira',
        '33344455566',
        'marina@email.com',
        '13999993333',
        '2014-10-10'
    ),
    (
        'Clara Oliveira',
        '44455566677',
        'clara@email.com',
        '13999994444',
        '2009-01-15'
    ),
    (
        'João da Silva',
        '55566677788',
        'joao@email.com',
        '11988887777',
        '2000-12-25'
    );
-- 4. Inserindo DISCIPLINAS (Vinculadas aos Cursos - IDs assumidos: 1, 2, 3)
INSERT INTO disciplina (nome_disciplina, carga_horaria, ementa, id_curso)
VALUES (
        'Lógica de Programação',
        80,
        'Fundamentos de algoritmos e lógica.',
        1
    ),
    -- ID 1
    (
        'Banco de Dados I',
        80,
        'Modelagem relacional e SQL.',
        1
    ),
    -- ID 2
    (
        'Estrutura de Dados',
        80,
        'Listas, Pilhas, Filas e Árvores.',
        1
    ),
    -- ID 3
    (
        'Engenharia de Requisitos',
        60,
        'Levantamento e análise de requisitos.',
        2
    ),
    -- ID 4
    (
        'Gestão de Projetos',
        40,
        'Metodologias ágeis e tradicionais.',
        3
    );
-- ID 5
-- 5. Inserindo PRÉ-REQUISITOS (Disciplina -> Disciplina)
-- Ex: Para fazer Banco de Dados (2), precisa de Lógica (1)
-- Ex: Para fazer Estrutura de Dados (3), precisa de Lógica (1)
INSERT INTO pre_requisito (id_disciplina, id_requisito)
VALUES (2, 1),
    (3, 1);
-- 6. Inserindo TURMAS (Vinculando Disciplina e Professor)
INSERT INTO turma (
        semestre,
        horario,
        sala,
        id_disciplina,
        id_professor
    )
VALUES ('2025.1', 'Segunda 19:00', 'Lab 1', 1, 2),
    -- Turma 1: Lógica com Ana
    ('2025.1', 'Terça 19:00', 'Lab 2', 2, 1),
    -- Turma 2: BD com Claudio
    ('2025.1', 'Quarta 21:00', 'Sala 10', 5, 3);
-- Turma 3: Gestão com Roberto
-- 7. Inserindo MATRÍCULAS (Vinculando Aluno e Turma)
-- Aluno 1 (Daniel) nas turmas 1 (Lógica) e 2 (BD)
INSERT INTO matricula (
        id_aluno,
        id_turma,
        nota,
        frequencia,
        data_matricula
    )
VALUES (1, 1, 9.5, 100.00, '2025-01-10'),
    (1, 2, 8.0, 90.00, '2025-01-11'),
    (2, 1, 7.0, 85.00, '2025-01-10'),
    -- Lorenzo em Lógica
    (3, 1, 10.0, 100.00, '2025-01-10'),
    -- Marina em Lógica
    (4, 3, 8.5, 95.00, '2025-01-12');
-- Clara em Gestão