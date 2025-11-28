-- Script de Manipulação (DML) - UPDATE e DELETE - Projeto SGA-DEV
-- Autor: Daniel Félix
-- Data: 28/11/2025
-- =================================================================
-- SEÇÃO 1: UPDATE (Atualização de Dados)
-- =================================================================
-- 1. Atualizar o telefone de um professor (Ex: Mudança de número)
UPDATE professor
SET telefone = '11988889999'
WHERE nome = 'Dr. Claudio Silva';
-- 2. Corrigir a nota e frequência de um aluno (Ex: Erro de digitação ou revisão)
-- Atualizando a nota do Aluno 1 na Turma 2
UPDATE matricula
SET nota = 8.5,
    frequencia = 92.0
WHERE id_aluno = 1
    AND id_turma = 2;
-- 3. Atualizar o e-mail de um aluno
UPDATE aluno
SET email = 'daniel.novo@email.com'
WHERE id_aluno = 1;
-- =================================================================
-- SEÇÃO 2: DELETE (Remoção de Dados)
-- =================================================================
-- 1. Cancelar uma matrícula (Ex: Aluno trancou a matéria)
-- Removendo a matrícula do aluno 4 na turma 3
DELETE FROM matricula
WHERE id_aluno = 4
    AND id_turma = 3;
-- 2. Remover um pré-requisito da grade curricular
-- (Ex: A coordenação decidiu que Estrutura de Dados (3) não exige mais Lógica (1))
DELETE FROM pre_requisito
WHERE id_disciplina = 3
    AND id_requisito = 1;
-- 3. Remover um registro de teste (Ex: Aluno desistente sem vínculos)
-- Primeiro, vamos criar um aluno "fantasma" só para testar o delete com segurança
INSERT INTO aluno (nome, cpf, email, data_nascimento)
VALUES (
        'Aluno Teste',
        '00000000000',
        'teste@email.com',
        '2000-01-01'
    );
-- Agora, deletamos esse aluno específico pelo CPF
DELETE FROM aluno
WHERE cpf = '00000000000';