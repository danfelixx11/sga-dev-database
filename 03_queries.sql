-- Script de Consultas (DQL) - Projeto SGA-DEV
-- Autor: Daniel Félix
-- Data: 28/11/2025

-- 1. Consulta Simples com WHERE e ORDER BY
-- Objetivo: Listar todos os alunos ordenados por nome
SELECT * FROM aluno 
ORDER BY nome ASC;

-- 2. Consulta com INNER JOIN (Relatório de Turmas)
-- Objetivo: Mostrar qual professor está dando qual disciplina, o horário e a sala.
SELECT 
    d.nome_disciplina,
    p.nome AS nome_professor,
    t.semestre,
    t.horario,
    t.sala
FROM turma t
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
JOIN professor p ON t.id_professor = p.id_professor
ORDER BY t.semestre DESC;

-- 3. Consulta Complexa (Histórico Escolar de um Aluno)
-- Objetivo: Mostrar as matérias, notas e frequência do aluno 'Daniel Félix'
SELECT 
    a.nome AS aluno,
    d.nome_disciplina,
    m.nota,
    m.frequencia,
    m.data_matricula
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN turma t ON m.id_turma = t.id_turma
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
WHERE a.nome = 'Daniel Félix';

-- 4. Consulta com Agregação (GROUP BY e AVG)
-- Objetivo: Calcular a média de notas de cada disciplina ofertada
SELECT 
    d.nome_disciplina,
    COUNT(m.id_aluno) AS total_alunos,
    ROUND(AVG(m.nota), 2) AS media_notas
FROM matricula m
JOIN turma t ON m.id_turma = t.id_turma
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY d.nome_disciplina;

-- 5. Consulta com Filtro de Aprovação (WHERE e LIMIT)
-- Objetivo: Listar os Top 3 alunos com maiores notas (Aprovados)
SELECT 
    a.nome,
    d.nome_disciplina,
    m.nota
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN turma t ON m.id_turma = t.id_turma
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
WHERE m.nota >= 7.0
ORDER BY m.nota DESC
LIMIT 3;