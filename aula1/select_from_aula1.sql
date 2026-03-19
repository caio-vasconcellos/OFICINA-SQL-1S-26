/* Nas consultas em Banco de Dados usamos letras maíusculas para palavras
reservadas da linguagem (SELECT, FROM, WHERE, ETC...), assim, a declaração pode ser visualizada mais facilmente */

USE EmpresaBrasil; -- Define qual banco de dados estaremos utilizando

-- Seleciona todas as colunas e linhas da tabela Clientes
SELECT * FROM Clientes;

-- Seleciona todas as colunas e linhas da tabela Pedidos
SELECT * FROM Pedidos;

-- Seleciona as colunas Nome, Cidade e Regiao da tabela Clientes
-- (Substituímos Endereço por Região, que contém o Estado)
SELECT Nome, Cidade, Regiao FROM Clientes;

-- Seleciona as colunas NumPed e Frete da tabela Pedidos
SELECT NumPed, Frete FROM Pedidos;

-- Seleciona as colunas Nome e Regiao da tabela Clientes onde a coluna Regiao for igual a 'SP'
-- (Como todos são do Brasil agora, filtrar por estado fica mais interessante para a aula)
SELECT Nome, Regiao FROM Clientes
WHERE Regiao = 'SP';

