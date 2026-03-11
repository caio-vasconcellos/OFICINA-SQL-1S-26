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


/* Exercícios para praticar */

-- 1: Selecione Nome e Cidade dos clientes que moram no estado de Sergipe ('SE').
-- Dica: SELECT Nome, Cidade FROM Clientes WHERE Regiao = 'SE';

-- 2: Selecione todos os dados do pedido de NumPed igual a 1010.
-- Dica: SELECT * FROM Pedidos WHERE NumPed = 1010;

-- 3: Selecione o Nome e o Cargo de todos os Funcionários.
-- Dica: SELECT Nome, Cargo FROM Funcionarios;

-- 4: Crie uma consulta da sua escolha utilizando a tabela de Produtos para ver itens com preço maior que 20.
-- Dica: SELECT * FROM Produtos WHERE Preco > 20;
