-- Script de Criação das Tabelas - Projeto SGA-DEV
-- Autor: Daniel Félix
-- Data: 18/11/2025
-- 1. Tabela CURSO
CREATE TABLE curso (
    id_curso SERIAL PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    duracao_semestres INT NOT NULL
);
-- 2. Tabela PROFESSOR
CREATE TABLE professor (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);
-- 3. Tabela ALUNO
CREATE TABLE aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL
);
-- 4. Tabela DISCIPLINA
CREATE TABLE disciplina (
    id_disciplina SERIAL PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    ementa TEXT,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);
-- 5. Tabela TURMA
CREATE TABLE turma (
    id_turma SERIAL PRIMARY KEY,
    semestre VARCHAR(6) NOT NULL,
    horario VARCHAR(50) NOT NULL,
    sala VARCHAR(20),
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);
-- 6. Tabela MATRICULA
CREATE TABLE matricula (
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    nota DECIMAL(4, 2),
    frequencia DECIMAL(5, 2),
    data_matricula DATE NOT NULL,
    PRIMARY KEY (id_aluno, id_turma),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);
-- 7. Tabela PRE_REQUISITO
CREATE TABLE pre_requisito (
    id_disciplina INT NOT NULL,
    id_requisito INT NOT NULL,
    PRIMARY KEY (id_disciplina, id_requisito),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
    FOREIGN KEY (id_requisito) REFERENCES disciplina(id_disciplina)
);