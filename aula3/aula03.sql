-- Oficina SQL Essencial 2026/1
-- Aula 03 - Manipulação de Banco de Dados


-- 1: Criação do Banco de Dados

USE master

CREATE DATABASE Oficina

GO

USE Oficina


--2: Criação das tabelas

CREATE TABLE Alunos (
	id INT IDENTITY(1,1) NOT NULL, 
	nome VARCHAR(100) NOT NULL,
	idade INT,
	telefone VARCHAR(20),
	genero CHAR(1)
)


-- 3: Inserção de Alunos

-- OBS: Colocar os próprios dados no último aluno
INSERT INTO Alunos
(nome, idade, telefone, genero)
VALUES 
('Luan', 18, '1190000-0000', 'M'),
('Maria', 20, '1190000-1234', 'F'),
('João', 26, '1590001-0060', 'M'),
('Rosa', 37, '1290000-5001', 'F'),
('????', 00, 'Fictício', '?')

SELECT * FROM Alunos


-- 4: Alteração de alunos

UPDATE Alunos
SET idade = 20
WHERE id = 1


-- OBS: Colocar Nome e Idade do colega ao lado
UPDATE Alunos
SET nome = '????',
	 idade = 00
WHERE id = 5

SELECT * FROM Alunos


-- 5: Exclusão de alunos

DELETE FROM Alunos
WHERE id BETWEEN 2 AND 4

SELECT * FROM Alunos


-- OBS: vai deletar todos os alunos
DELETE FROM Alunos

SELECT * FROM Alunos


-- 6: Deletar tabelas e banco de dados

USE Oficina
DROP TABLE Alunos

USE master
DROP DATABASE Oficina