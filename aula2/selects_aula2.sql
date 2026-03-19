-- Operadores de Comparação
-- Usados para filtrar registros com base em condições diretas.

-- Igual (=)

-- Seleciona clientes que moram especificamente em 'Marabá'
SELECT Nome, Cidade, Regiao 
FROM Clientes 
WHERE Cidade = 'Marabá';
Maior ou igual (>=) / Menor ou igual (<=)

-- Maior ou igual (>=) / Menor ou igual (<=)

-- Produtos com estoque baixo (menor ou igual a 30 unidades)
SELECT Descr, Unidades 
FROM Produtos 
WHERE Unidades <= 30;
Diferente (<> ou !=)

-- Diferente (<> ou !=)

-- Funcionários que NÃO pertencem ao departamento 'Comercial'
SELECT Nome, Departamento 
FROM Funcionarios 
WHERE Departamento <> 'Comercial';

-- Operadores Lógicos
-- Servem para criar filtros mais inteligentes combinando condições.

-- AND (E): Ambas as condições devem ser verdadeiras.

-- Produtos caros (Preço > 20) da categoria 1 (Bebidas)

SELECT Descr, Preco, CodCategoria 
FROM Produtos 
WHERE Preco > 20.00 AND CodCategoria = 1;


-- OR (OU): Pelo menos uma condição deve ser verdadeira.

-- Clientes de regiões específicas (PE ou BA)

SELECT Nome, Cidade, Regiao 
FROM Clientes 
WHERE Regiao = 'PE' OR Regiao = 'BA';


-- NOT (NÃO): Inverte a regra do filtro.
-- Pedidos que NÃO estão com status 'Entregue'

SELECT NumPed, Status 
FROM Pedidos 
WHERE NOT Status = 'Entregue';

/* 3. Operadores de Faixa e Conjunto
Ideais para simplificar a leitura do código quando lidamos com listas ou períodos. */

-- BETWEEN (Entre): Define um intervalo inclusivo.

-- Funcionários com salário entre 2000 e 4000 reais
SELECT Nome, Salario 
FROM Funcionarios 
WHERE Salario BETWEEN 2000 AND 4000;

-- IN (Em): Substitui vários "OR" por uma lista.

-- Funcionários que atuam em departamentos de suporte/gestão
SELECT Nome, Departamento 
FROM Funcionarios 
WHERE Departamento IN ('RH', 'Financeiro', 'Gestão');


/* 4. Operador de Busca de Padrão (LIKE)
O SQL Server usa o % para representar qualquer quantidade de caracteres. */

-- Busca por Início:
-- Clientes cujo nome começa com 'Ana'
SELECT Nome 
FROM Clientes 
WHERE Nome LIKE 'Ana%';


-- Busca por Conteúdo:
-- Produtos que contenham a palavra 'Artesanal' em qualquer parte do nome
SELECT Descr 
FROM Produtos 
WHERE Descr LIKE '%Artesanal%';



/* Dica para SQL Server: Precedência de Operadores
Quando você mistura AND e OR, o SQL Server sempre processa o AND primeiro. Para evitar erros de lógica, use parênteses.

Exemplo prático de erro comum:*/

-- Errado: Pode trazer gente de TI com salário baixo
SELECT * FROM Funcionarios 
WHERE Departamento = 'TI' OR Departamento = 'RH' AND Salario > 5000;

-- Correto: Garante que o salário alto se aplica a ambos os depts
SELECT * FROM Funcionarios 
WHERE (Departamento = 'TI' OR Departamento = 'RH') AND Salario > 5000;
