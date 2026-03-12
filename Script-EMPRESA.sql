-- ======================================================
-- SCRIPT EMPRESA BRASIL - SQL SERVER
-- ======================================================

-- Criação e seleção do banco de dados
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'EmpresaBrasil')
    DROP DATABASE EmpresaBrasil;
GO

CREATE DATABASE EmpresaBrasil;
GO

USE EmpresaBrasil;
GO

-- ======================================================
-- CRIAÇÃO DAS TABELAS
-- ======================================================

-- 1. TABELA CATEGORIAS
CREATE TABLE Categorias (
    CodCategoria    INT IDENTITY(1,1) NOT NULL,
    Descr           VARCHAR(25) NOT NULL,
    PRIMARY KEY (CodCategoria)
);
GO

-- 2. TABELA FORNECEDORES
CREATE TABLE Fornecedores (
    CodFor      INT IDENTITY(1,1) NOT NULL,
    Empresa     VARCHAR(40) NOT NULL,
    Contato     VARCHAR(30),
    Endereco    VARCHAR(60),
    Cidade      VARCHAR(25),
    Estado      CHAR(2),
    CEP         CHAR(9),
    Pais        VARCHAR(15),
    Telefone    VARCHAR(20),
    Email       VARCHAR(50),
    PRIMARY KEY (CodFor)
);
GO

-- 3. TABELA CLIENTES
CREATE TABLE Clientes (
    CodCli      CHAR(5) NOT NULL,
    Nome        VARCHAR(40) NOT NULL,
    Endereco    VARCHAR(60),
    Cidade      VARCHAR(25) NOT NULL,
    Regiao      CHAR(2) NOT NULL,  -- UF
    CEP         CHAR(9),
    Pais        VARCHAR(15) DEFAULT 'Brasil',
    Telefone    VARCHAR(20),
    Email       VARCHAR(50),
    DataCadastro DATE DEFAULT GETDATE(),
    PRIMARY KEY (CodCli)
);
GO

-- 4. TABELA FUNCIONARIOS
CREATE TABLE Funcionarios (
    CodFun      INT IDENTITY(1,1) NOT NULL,
    Nome        VARCHAR(40) NOT NULL,
    Sobrenome   VARCHAR(40),
    Cargo       VARCHAR(30),
    Departamento VARCHAR(30),
    Salario     DECIMAL(10,2) DEFAULT 0.00,
    DataAdmissao DATE,
    Telefone    VARCHAR(20),
    Email       VARCHAR(50),
    PRIMARY KEY (CodFun)
);
GO

-- 5. TABELA PRODUTOS
CREATE TABLE Produtos (
    CodProd         INT IDENTITY(1,1) NOT NULL,
    Descr           VARCHAR(40) NOT NULL,
    CodFor          INT,
    CodCategoria    INT,
    Preco           DECIMAL(10,2) DEFAULT 0.00,
    Unidades        SMALLINT DEFAULT 0,
    UnidadesMedida  VARCHAR(15),
    Descontinuado   BIT DEFAULT 0,
    PRIMARY KEY (CodProd),
    FOREIGN KEY (CodCategoria) REFERENCES Categorias(CodCategoria),
    FOREIGN KEY (CodFor) REFERENCES Fornecedores(CodFor)
);
GO

-- 6. TABELA PEDIDOS
CREATE TABLE Pedidos (
    NumPed      INT NOT NULL,
    CodCli      CHAR(5),
    CodFun      INT,
    DataPed     DATE,
    DataEntrega DATE,
    Frete       DECIMAL(10,2) DEFAULT 0.00,
    Status      VARCHAR(20) DEFAULT 'Pendente',
    PRIMARY KEY (NumPed),
    FOREIGN KEY (CodCli) REFERENCES Clientes(CodCli),
    FOREIGN KEY (CodFun) REFERENCES Funcionarios(CodFun)
);
GO

-- ======================================================
-- CARGA DE DADOS
-- ======================================================

-- CATEGORIAS
INSERT INTO Categorias (Descr) VALUES 
('Bebidas'),
('Mercearia'),
('Hortifruti'),
('Laticínios'),
('Padaria'),
('Carnes'),
('Doces'),
('Grãos');
GO

-- FORNECEDORES 
INSERT INTO Fornecedores (Empresa, Contato, Endereco, Cidade, Estado, CEP, Pais, Telefone, Email) VALUES 
('Distribuidora Vale',       'Jorge Silva',      'Rua das Palmeiras, 120',       'Petrolina',        'PE', '56304-000', 'Brasil', '(87) 3861-1200', 'jorge@distvale.com.br'),
('Agro do Cerrado',          'Maria Oliveira',   'Av. do Cerrado, 500',          'Rio Verde',        'GO', '75901-000', 'Brasil', '(64) 3611-4000', 'maria@agrocerrado.com.br'),
('Laticínios da Serra',      'Antônio Santos',   'Estrada da Serra, km 12',      'Aiuruoca',         'MG', '37455-000', 'Brasil', '(35) 3245-1000', 'antonio@latserra.com.br'),
('Exportadora Grão de Ouro', 'Luís Pereira',     'Rua do Comércio, 88',          'Patos de Minas',   'MG', '38700-000', 'Brasil', '(34) 3821-3300', 'luis@graodeouro.com.br'),
('Frigorífico Sul Mineiro',  'Carla Medeiros',   'Rod. MG-050, km 35',           'Formiga',          'MG', '35570-000', 'Brasil', '(37) 3322-5500', 'carla@frigsulmineiro.com.br'),
('Padaria Industrial Pão & Arte', 'Roberto Lima','Av. Industrial, 1500',         'Contagem',         'MG', '32010-000', 'Brasil', '(31) 3359-8800', 'roberto@paoearte.com.br'),
('Hortifruti Verdão',        'Simone Nascimento','Mercado Central, Box 14',      'Uberlândia',       'MG', '38400-000', 'Brasil', '(34) 3215-6600', 'simone@verdao.com.br'),
('Bebidas Brasil Premium',   'Fábio Castro',     'Av. das Indústrias, 240',      'Ribeirão Preto',   'SP', '14070-000', 'Brasil', '(16) 3602-4400', 'fabio@bebidasbrasil.com.br');
GO

-- CLIENTES 
INSERT INTO Clientes (CodCli, Nome, Endereco, Cidade, Regiao, CEP, Pais, Telefone, Email, DataCadastro) VALUES 
('ALFKI', 'Lucas Silva',              'Rua da Esperança, 45',     'Japaratuba',               'SE', '49170-000', 'Brasil', '(79) 99801-1234', 'lucas.silva@email.com',        '2022-03-10'),
('ANATR', 'Ana Paula Oliveira',       'Av. dos Imigrantes, 300',  'Uiramutã',                 'RR', '69340-000', 'Brasil', '(95) 99712-5678', 'anapaula@email.com',           '2022-05-22'),
('BERGS', 'Marcos dos Santos',        'Travessa da Saudade, 12',  'Afogados da Ingazeira',    'PE', '56800-000', 'Brasil', '(87) 99623-9101', 'marcos.santos@email.com',      '2022-06-15'),
('BLONP', 'Pedro Henrique Souza',     'Rua das Flores, 88',       'Xique-Xique',              'BA', '47400-000', 'Brasil', '(74) 99534-1121', 'pedrohenrique@email.com',      '2022-07-01'),
('BOLID', 'Juliana Ferreira',         'Av. Central, 550',         'Guaraciaba do Norte',      'CE', '62380-000', 'Brasil', '(88) 99445-3141', 'juliana.ferreira@email.com',   '2022-07-18'),
('BONAP', 'Rafael Almeida',           'Rua do Sol, 77',           'Ipixuna do Pará',          'PA', '68450-000', 'Brasil', '(91) 99356-5161', 'rafael.almeida@email.com',     '2022-08-05'),
('BOTTM', 'Aline Costa',              'Rua da Paz, 190',          'Ponte Alta do Bom Jesus',  'TO', '77870-000', 'Brasil', '(63) 99267-7181', 'aline.costa@email.com',        '2022-09-12'),
('COMMI', 'Fernando Pereira',         'Estrada Real, 230',        'Gonçalves',                'MG', '37530-000', 'Brasil', '(35) 99178-9201', 'fernando.pereira@email.com',   '2022-10-01'),
('ERNSH', 'Bárbara Rodrigues',        'Rua das Araucárias, 64',   'Doutor Pedrinho',          'SC', '89196-000', 'Brasil', '(47) 99089-1211', 'barbara.rodrigues@email.com',  '2022-10-20'),
('FAMIA', 'Ricardo Gomes',            'Av. da Uva, 415',          'Antônio Prado',            'RS', '95225-000', 'Brasil', '(54) 98990-3231', 'ricardo.gomes@email.com',      '2022-11-08'),
('FISSA', 'Felipe Martins',           'Rua do Garimpo, 321',      'Ribeirão Cascalheira',     'MT', '78698-000', 'Brasil', '(66) 98901-5251', 'felipe.martins@email.com',     '2022-11-25'),
('FOLIG', 'Camila Rocha',             'Av. da Floresta, 870',     'Cruzeiro do Sul',          'AC', '69980-000', 'Brasil', '(68) 98812-7271', 'camila.rocha@email.com',       '2022-12-10'),
('GOURL', 'Gabriel Lima',             'Rua do Café, 55',          'Bento de Abreu',           'SP', '16350-000', 'Brasil', '(18) 98723-9291', 'gabriel.lima@email.com',       '2023-01-05'),
('HANAR', 'Patrícia Barbosa',         'Estrada dos Lagos, 190',   'Itaperuna',                'RJ', '28300-000', 'Brasil', '(22) 98634-1221', 'patricia.barbosa@email.com',   '2023-01-22'),
('HILAA', 'Rodrigo Cardoso',          'Rua do Agronegócio, 600',  'Anicuns',                  'GO', '76160-000', 'Brasil', '(62) 98545-3441', 'rodrigo.cardoso@email.com',    '2023-02-08'),
('HUNGO', 'Letícia Teixeira',         'Av. Esperança, 100',       'Pio IX',                   'PI', '64770-000', 'Brasil', '(89) 98456-5461', 'leticia.teixeira@email.com',   '2023-02-25'),
('QUEDE', 'Bruno Araújo',             'Rua do Pantanal, 430',     'Mundo Novo',               'MS', '79980-000', 'Brasil', '(67) 98367-7481', 'bruno.araujo@email.com',       '2023-03-14'),
('RATTC', 'Amanda Machado',           'Av. da Amazônia, 215',     'Ouro Preto do Oeste',      'RO', '76920-000', 'Brasil', '(69) 98278-9501', 'amanda.machado@email.com',     '2023-03-31'),
('ROMEY', 'Vitor Cavalcanti',         'Rua das Cachoeiras, 78',   'Vargem Alta',              'ES', '29390-000', 'Brasil', '(28) 98189-1521', 'vitor.cavalcanti@email.com',   '2023-04-18'),
('VINET', 'Larissa Mendes',           'Av. das Araucárias, 560',  'Laranjeiras do Sul',       'PR', '85301-000', 'Brasil', '(42) 98090-3541', 'larissa.mendes@email.com',     '2023-05-05'),
('AROSA', 'Alexandre Rosa',           'Rua das Palmeiras, 320',   'Campina Grande',           'PB', '58400-000', 'Brasil', '(83) 97901-2233', 'alexandre.rosa@email.com',     '2023-06-01'),
('BRCOS', 'Bruna Campos',             'Av. Beira Rio, 145',       'Parintins',                'AM', '69151-000', 'Brasil', '(92) 97812-4455', 'bruna.campos@email.com',       '2023-06-18'),
('CAFER', 'Carlos Fernandes',         'Rua das Mangueiras, 88',   'Barreiras',                'BA', '47808-000', 'Brasil', '(77) 97723-6677', 'carlos.fernandes@email.com',   '2023-07-05'),
('DMOUR', 'Diana Moura',              'Travessa do Mercado, 22',  'Marabá',                   'PA', '68507-000', 'Brasil', '(94) 97634-8899', 'diana.moura@email.com',        '2023-07-22'),
('EVCAR', 'Eduardo Vargas',           'Av. do Progresso, 790',    'Sinop',                    'MT', '78550-000', 'Brasil', '(66) 97545-0011', 'eduardo.vargas@email.com',     '2023-08-08'),
('FLBAS', 'Flávio Bastos',            'Rua da Serra, 410',        'Diamantina',               'MG', '39100-000', 'Brasil', '(38) 97456-2233', 'flavio.bastos@email.com',      '2023-08-25'),
('GCAST', 'Giovana Castro',           'Estrada da Praia, 60',     'Maragogi',                 'AL', '57955-000', 'Brasil', '(82) 97367-4455', 'giovana.castro@email.com',     '2023-09-11'),
('HNETO', 'Henrique Neto',            'Av. das Indústrias, 1200', 'Caruaru',                  'PE', '55014-000', 'Brasil', '(81) 97278-6677', 'henrique.neto@email.com',      '2023-09-28'),
('ICAET', 'Isabela Caetano',          'Rua das Flores, 33',       'Petrolândia',              'SC', '88900-000', 'Brasil', '(49) 97189-8899', 'isabela.caetano@email.com',    '2023-10-15'),
('JRAMO', 'José Ramos',               'Av. Central, 880',         'Ji-Paraná',                'RO', '76900-000', 'Brasil', '(69) 97090-0011', 'jose.ramos@email.com',         '2023-11-01');
GO

-- FUNCIONARIOS 
INSERT INTO Funcionarios (Nome, Sobrenome, Cargo, Departamento, Salario, DataAdmissao, Telefone, Email) VALUES 
('João',    'Silva',        'Vendedor',         'Comercial',    2200.00, '2020-03-01', '(11) 98001-1111', 'joao.silva@empresabrasil.com.br'),
('Maria',   'Santos',       'Gerente',          'Gestão',       4500.00, '2019-01-15', '(11) 98002-2222', 'maria.santos@empresabrasil.com.br'),
('José',    'Oliveira',     'Estoquista',       'Logística',    1800.00, '2021-06-10', '(11) 98003-3333', 'jose.oliveira@empresabrasil.com.br'),
('Ana',     'Souza',        'Vendedora',        'Comercial',    2200.00, '2021-08-22', '(11) 98004-4444', 'ana.souza@empresabrasil.com.br'),
('Carlos',  'Ferreira',     'Supervisor',       'Comercial',    3200.00, '2020-11-05', '(11) 98005-5555', 'carlos.ferreira@empresabrasil.com.br'),
('Patrícia','Monteiro',     'Analista Financeiro','Financeiro',  3800.00, '2021-02-14', '(11) 98006-6666', 'patricia.monteiro@empresabrasil.com.br'),
('Roberto', 'Lima',         'Diretor Comercial', 'Diretoria',   8500.00, '2018-05-20', '(11) 98007-7777', 'roberto.lima@empresabrasil.com.br'),
('Fernanda','Costa',        'Assistente RH',    'RH',           2500.00, '2022-01-10', '(11) 98008-8888', 'fernanda.costa@empresabrasil.com.br'),
('Gustavo', 'Alves',        'Motorista',        'Logística',    2000.00, '2021-09-30', '(11) 98009-9999', 'gustavo.alves@empresabrasil.com.br'),
('Renata',  'Barbosa',      'Compradora',       'Compras',      3500.00, '2020-07-15', '(11) 98010-0000', 'renata.barbosa@empresabrasil.com.br'),
('Diego',   'Carvalho',     'Vendedor',         'Comercial',    2200.00, '2023-03-01', '(11) 98011-1122', 'diego.carvalho@empresabrasil.com.br'),
('Juliana', 'Rocha',        'Contadora',        'Financeiro',   4200.00, '2019-11-22', '(11) 98012-2233', 'juliana.rocha@empresabrasil.com.br');
GO

-- PRODUTOS 
INSERT INTO Produtos (Descr, CodFor, CodCategoria, Preco, Unidades, UnidadesMedida, Descontinuado) VALUES 
-- Bebidas
('Guaraná Antarctica 2L',       1, 1,  8.50,  100, 'un',   0),
('Cachaça Artesanal 700ml',     1, 1, 35.00,   30, 'un',   0),
('Suco de Caju 1L',             8, 1, 12.00,   80, 'un',   0),
('Água Mineral 500ml',          8, 1,  2.50,  300, 'un',   0),
('Refrigerante Cola 2L',        8, 1,  9.00,  150, 'un',   0),
('Cerveja Artesanal 600ml',     8, 1, 16.00,   60, 'un',   0),
-- Mercearia
('Farinha de Mandioca Fina 1kg',2, 2,  6.50,  150, 'kg',   0),
('Azeite de Dendê 500ml',       1, 2, 12.00,   45, 'un',   0),
('Molho de Pimenta 150ml',      2, 2,  8.00,   90, 'un',   0),
('Vinagre de Maçã 500ml',       2, 2,  7.50,   70, 'un',   0),
-- Hortifruti
('Pinhão Cru 1kg',              4, 3, 14.00,   80, 'kg',   0),
('Castanha do Pará 1kg',        2, 3, 55.00,   25, 'kg',   0),
('Banana Prata 1kg',            7, 3,  5.00,  200, 'kg',   0),
('Macaxeira 1kg',               7, 3,  4.50,  120, 'kg',   0),
('Caju Fresco 1kg',             7, 3,  9.00,   50, 'kg',   0),
-- Laticínios
('Queijo Canastra Real 500g',   3, 4, 45.00,   20, 'un',   0),
('Requeijão de Corte 500g',     3, 4, 18.50,   22, 'un',   0),
('Iogurte Natural 200g',        3, 4,  5.50,   80, 'un',   0),
('Manteiga com Sal 200g',       3, 4, 12.00,   60, 'un',   0),
-- Padaria
('Pão de Queijo Congelado 1kg', 6, 5, 22.00,   40, 'kg',   0),
('Tapioca Granulada 500g',      6, 5,  9.00,   90, 'un',   0),
('Broa de Milho',               6, 5,  4.00,  100, 'un',   0),
-- Carnes
('Carne Seca 1kg',              5, 6, 48.00,   30, 'kg',   0),
('Linguiça Defumada 1kg',       5, 6, 32.00,   45, 'kg',   0),
('Frango Inteiro Congelado 1kg',5, 6, 15.00,   80, 'kg',   0),
-- Doces
('Paçoca de Rolha',             2, 7,  1.50,  500, 'un',   0),
('Doce de Leite Viçosa 400g',   3, 7, 22.00,   35, 'un',   0),
('Rapadura de Engenho 500g',    2, 7,  5.00,   60, 'un',   0),
('Goiabada Cascão 400g',        3, 7, 15.00,   40, 'un',   0),
('Cocada de Forno 200g',        2, 7,  8.00,   70, 'un',   0),
-- Grãos
('Café em Grão Gourmet 500g',   4, 8, 28.90,   40, 'un',   0),
('Arroz Agulhinha 5kg',         4, 8, 24.00,  200, 'un',   0),
('Feijão Carioca 1kg',          4, 8,  7.80,  300, 'un',   0),
('Milho para Canjica 500g',     2, 8,  6.00,  120, 'un',   0),
('Lentilha 500g',               4, 8, 11.00,   85, 'un',   0),
('Grão-de-Bico 500g',           4, 8, 13.50,   75, 'un',   0),
('Trigo para Quibe 500g',       2, 8,  7.00,   95, 'un',   0);
GO

-- PEDIDOS
INSERT INTO Pedidos (NumPed, CodCli, CodFun, DataPed, DataEntrega, Frete, Status) VALUES 
(1001,'VINET', 1, '2023-10-01', '2023-10-05', 15.00, 'Entregue'),
(1002,'ALFKI', 2, '2023-10-02', '2023-10-06', 12.50, 'Entregue'),
(1003,'COMMI', 4, '2023-10-05', '2023-10-09', 25.00, 'Entregue'),
(1004,'HANAR', 1, '2023-10-07', '2023-10-11', 18.00, 'Entregue'),
(1005,'GOURL', 3, '2023-10-10', '2023-10-14', 10.00, 'Entregue'),
(1006,'ERNSH', 2, '2023-10-12', '2023-10-16', 35.00, 'Entregue'),
(1007,'FAMIA', 5, '2023-10-15', '2023-10-19', 22.00, 'Entregue'),
(1008,'ANATR', 1, '2023-10-18', '2023-10-22', 14.00, 'Entregue'),
(1009,'QUEDE', 4, '2023-10-20', '2023-10-24', 30.00, 'Entregue'),
(1010,'BERGS', 3, '2023-10-22', '2023-10-26', 40.00, 'Entregue'),
(1011,'VINET', 5, '2023-10-25', '2023-10-29', 15.00, 'Entregue'),
(1012,'HILAA', 1, '2023-10-26', '2023-10-30', 20.00, 'Entregue'),
(1013,'ROMEY', 2, '2023-10-28', '2023-11-01', 12.00, 'Entregue'),
(1014,'RATTC', 4, '2023-10-30', '2023-11-03', 50.00, 'Entregue'),
(1015,'COMMI', 1, '2023-11-01', '2023-11-05', 15.00, 'Entregue'),
(1016,'ALFKI', 3, '2023-11-02', '2023-11-06', 12.00, 'Entregue'),
(1017,'FOLIG', 5, '2023-11-04', '2023-11-08', 60.00, 'Entregue'),
(1018,'BONAP', 2, '2023-11-05', '2023-11-09', 28.00, 'Entregue'),
(1019,'BOTTM', 4, '2023-11-07', '2023-11-11', 32.00, 'Entregue'),
(1020,'BOLID', 1, '2023-11-10', '2023-11-14', 19.00, 'Entregue'),
(1021,'AROSA', 6, '2023-11-12', '2023-11-16', 22.00, 'Entregue'),
(1022,'BRCOS',11, '2023-11-15', '2023-11-19', 45.00, 'Entregue'),
(1023,'CAFER', 7, '2023-11-18', '2023-11-22', 33.00, 'Entregue'),
(1024,'DMOUR', 9, '2023-11-20', '2023-11-24', 27.00, 'Entregue'),
(1025,'EVCAR',10, '2023-11-22', '2023-11-26', 18.00, 'Entregue'),
(1026,'FLBAS', 4, '2023-11-25', '2023-11-29', 14.00, 'Entregue'),
(1027,'GCAST', 1, '2023-11-28', '2023-12-02', 38.00, 'Entregue'),
(1028,'HNETO', 8, '2023-12-01', '2023-12-05', 21.00, 'Entregue'),
(1029,'ICAET',12, '2023-12-04', '2023-12-08', 16.00, 'Entregue'),
(1030,'JRAMO', 3, '2023-12-07', '2023-12-11', 52.00, 'Entregue'),
(1031,'VINET', 2, '2024-01-05', '2024-01-10', 17.00, 'Entregue'),
(1032,'ALFKI', 5, '2024-01-08', '2024-01-13', 23.00, 'Entregue'),
(1033,'AROSA', 1, '2024-01-12', '2024-01-17', 11.00, 'Entregue'),
(1034,'HANAR', 6, '2024-01-15', '2024-01-20', 29.00, 'Entregue'),
(1035,'FAMIA',11, '2024-01-18', '2024-01-23', 36.00, 'Entregue'),
(1036,'COMMI', 4, '2024-01-22', '2024-01-27', 20.00, 'Em Trânsito'),
(1037,'GOURL', 7, '2024-01-25', '2024-01-30', 42.00, 'Em Trânsito'),
(1038,'ERNSH', 2, '2024-01-28', '2024-02-02', 25.00, 'Pendente'),
(1039,'BRCOS', 9, '2024-02-01', '2024-02-06', 55.00, 'Pendente'),
(1040,'CAFER',10, '2024-02-05', '2024-02-10', 31.00, 'Pendente');
GO

