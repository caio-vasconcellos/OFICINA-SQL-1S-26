-- Oficina SQL Essencial 2026/1
-- Aula 03 - Manipulação de Banco de Dados


-- Hora da Prática


-- Banco de Dados

USE master

CREATE DATABASE Oficina

GO

USE Oficina


-- Tabelas

CREATE TABLE Alunos (
	id INT IDENTITY(1,1) NOT NULL, 
	nome VARCHAR(100) NOT NULL,
	idade INT,
	telefone VARCHAR(20),
	genero CHAR(1)
)

CREATE TABLE Aulas (
	id INT IDENTITY(1,1) NOT NULL, 
	numero INT NOT NULL,
	dia DATE,
	conteudo VARCHAR(300),
	sala INT
)

CREATE TABLE Faltas (
	id INT IDENTITY(1,1) NOT NULL, 
	id_aula INT NOT NULL,
	id_aluno INT NOT NULL
)



-- Cadastrar as aulas da oficina

INSERT INTO Aulas
(numero, dia, conteudo, sala)
VALUES 
(1, '2026-03-12', 'Introdução', 210),
(2, '2026-03-19', 'Consultas com Operadores', 210),
(3, '2026-03-26', 'Manipulação de Banco de Dados', 210),
(4, '2026-04-02', 'Funções de Agregação', 210),
(5, '2026-04-23', 'Funções Associativas', 210)

SELECT * FROM Aulas



-- Inserir alunos matriculados

INSERT INTO Alunos
(nome, idade, telefone, genero)
VALUES 
('Luan', 18, '1190000-0000', 'M'),
('Maria', 20, '1190000-1234', 'F'),
('João', 26, '1590001-0060', 'M'),
('Rosa', 37, '1290000-5001', 'F'),
('Pablo', 19, '1197000-0000', 'M'),
('Caio', 25, '1197000-0000', 'M'),
('Filipe', 29, '1195000-0000', 'M'),
('Aline', 21, '1190006-0000', 'F'),
('Helena', 19, '1190003-0000', 'F')


SELECT * FROM Alunos





-- DIA 01


-- Adicionar alunos matriculados posteriormente na oficina

INSERT INTO Alunos
(nome, idade, telefone, genero)
VALUES 
('Giovana', 19, '1190000-2000', 'F'),
('Gabriel', 18, '1190000-3000', 'M')


SELECT * FROM Alunos



-- Registrar Faltas


INSERT INTO Faltas
(id_aula, id_aluno)
VALUES 
(1, 2),
(1, 4),
(1, 7),
(1, 9)

SELECT * FROM Faltas


-- Checar faltas específicas

SELECT * FROM Faltas WHERE id_aluno = 2

SELECT * FROM Faltas WHERE id_aula = 1



