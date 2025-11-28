# Sistema de Gestão Acadêmica (SGA-DEV) - Database

Este repositório contém a implementação física do banco de dados para o projeto **SGA-DEV**, desenvolvido como parte da disciplina de Modelagem de Banco de Dados.

O projeto consiste na modelagem e implementação SQL de um sistema para gerenciar alunos, professores, disciplinas, turmas e matrículas de uma instituição de ensino superior.

## 🛠️ Tecnologias Utilizadas

* **Modelagem:** Modelo Entidade-Relacionamento (MER) e Diagrama Lógico.
* **SGBD:** SQL (Compatível com PostgreSQL e MySQL).
* **Ferramentas:** VS Code, Git, DB Designer.

## 📂 Estrutura do Projeto

Os scripts SQL foram organizados sequencialmente para facilitar a execução:

* `01_create_tables.sql`: Script DDL para criação de todas as tabelas e relacionamentos (PKs e FKs).
* `02_insert_data.sql`: Script DML para povoar o banco com dados fictícios de cursos, professores e alunos.
* `03_queries.sql`: Script DQL contendo consultas complexas (JOINs, Agregações, Filtros).
* `04_update_delete.sql`: Script DML com exemplos de atualização e remoção de dados.

## 🚀 Como Executar

Para rodar este projeto em sua máquina ou ferramenta de banco de dados (como PGAdmin ou MySQL Workbench):

1.  Clone este repositório.
2.  Execute os scripts na **ordem numérica** (01 a 04) para garantir a integridade referencial.
3.  Verifique os outputs de cada consulta.

---
**Autor:** Daniel Félix