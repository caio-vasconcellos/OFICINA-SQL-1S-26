CREATE DATABASE Empresa;
USE Empresa;

CREATE TABLE Clientes (
    CodCli INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50)
);

CREATE TABLE Categorias (
    CodCategoria INT PRIMARY KEY AUTO_INCREMENT,
    NomeCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE Produtos (
    CodProd INT PRIMARY KEY AUTO_INCREMENT,
    Descr VARCHAR(100) NOT NULL,
    CodCategoria INT,
    Preco DECIMAL(10, 2) NOT NULL,
    Unidades INT NOT NULL,
    FOREIGN KEY (CodCategoria) REFERENCES Categorias(CodCategoria)
);

CREATE TABLE Fornecedores (
    CodFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50)
);

CREATE TABLE Pedidos (
    NumPed INT PRIMARY KEY AUTO_INCREMENT,
    CodCli INT,
    DataPed DATE NOT NULL,
    Frete DECIMAL(10, 2),
    FOREIGN KEY (CodCli) REFERENCES Clientes(CodCli)
);

INSERT INTO Clientes (Nome, Pais, Cidade) VALUES
('Hans Mueller', 'Alemanha', 'Berlim'),
('Franz Weber', 'Alemanha', 'Munique'),
('Klaus Schmidt', 'Alemanha', 'Hamburgo'),
('Pierre Dubois', 'França', 'Paris'),
('Jean Martin', 'França', 'Lyon'),
('Marie Laurent', 'França', 'Marselha'),
('Antonio Silva', 'Portugal', 'Lisboa'),
('Maria Santos', 'Portugal', 'Porto'),
('Carlos Costa', 'Brasil', 'São Paulo'),
('Ana Oliveira', 'Brasil', 'Rio de Janeiro');

INSERT INTO Categorias (NomeCategoria) VALUES
('Eletrônicos'),
('Alimentos'),
('Bebidas'),
('Móveis'),
('Roupas');

INSERT INTO Produtos (Descr, CodCategoria, Preco, Unidades) VALUES
('Notebook Dell', 1, 3500.00, 15),
('Mouse Logitech', 1, 80.00, 50),
('Teclado Mecânico', 1, 450.00, 30),
('Arroz Integral 1kg', 2, 12.50, 200),
('Feijão Preto 1kg', 2, 8.00, 150),
('Suco de Laranja 1L', 3, 6.50, 100),
('Refrigerante Cola 2L', 3, 7.00, 120),
('Mesa de Escritório', 4, 850.00, 10),
('Cadeira Ergonômica', 4, 650.00, 25),
('Camiseta Básica', 5, 45.00, 80),
('Calça Jeans', 5, 120.00, 60),
('Monitor LG 24"', 1, 900.00, 20),
('Webcam HD', 1, 250.00, 40),
('Café Premium 500g', 2, 25.00, 90),
('Chá Verde 100g', 3, 15.00, 70);

INSERT INTO Fornecedores (Nome, Pais, Cidade) VALUES
('Tech Supply GmbH', 'Alemanha', 'Berlim'),
('Electronic Parts AG', 'Alemanha', 'Frankfurt'),
('Alimentos Franceses SA', 'França', 'Paris'),
('Bebidas Lyon LTDA', 'França', 'Lyon'),
('Móveis Portugal', 'Portugal', 'Lisboa'),
('Fornecedor Porto', 'Portugal', 'Porto'),
('Brasil Distribuidora', 'Brasil', 'São Paulo'),
('Importadora RJ', 'Brasil', 'Rio de Janeiro'),
('Tech Brasil', 'Brasil', 'Curitiba'),
('Alimentos Itália SRL', 'Itália', 'Roma');

INSERT INTO Pedidos (CodCli, DataPed, Frete) VALUES
(1, '2024-01-15', 25.00),
(1, '2024-01-20', 30.00),
(2, '2024-01-18', 28.00),
(3, '2024-01-22', 22.00),
(4, '2024-01-25', 35.00),
(4, '2024-02-01', 40.00),
(5, '2024-02-05', 38.00),
(6, '2024-02-10', 42.00),
(7, '2024-02-12', 50.00),
(8, '2024-02-15', 48.00),
(9, '2024-02-18', 20.00),
(9, '2024-02-20', 25.00),
(10, '2024-02-22', 30.00);
