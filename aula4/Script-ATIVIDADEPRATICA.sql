CREATE DATABASE InvestigacaoSQL_Final;

USE InvestigacaoSQL_Final;

-- Tabela 1: Perfil Físico
CREATE TABLE Perfil (
    id_suspeito INT PRIMARY KEY,
    nome VARCHAR(50),
    cor_cabelo VARCHAR(20),
    tamanho_sapato INT
);
-- Tabela 2: Objetos que a pessoa possui (Aqui está o Cartão e o Perfume)
CREATE TABLE Objetos_Pessoais (
    id_suspeito INT,
    nome_objeto VARCHAR(50),
    FOREIGN KEY (id_suspeito) REFERENCES Perfil(id_suspeito)
);
-- Tabela 3: Agenda de Permanência (Entrada e Saída real)
CREATE TABLE Agenda_Presenca (
    id_suspeito INT,
    dia_semana VARCHAR(20),
    setor_local VARCHAR(50),
    hora_entrada TIME,
    hora_saida TIME,
    FOREIGN KEY (id_suspeito) REFERENCES Perfil(id_suspeito)
);
-- Tabela 4: Câmeras (Para confirmar a pista falsa do chapéu)
CREATE TABLE Cameras (
    id_registro INT PRIMARY KEY,
    id_suspeito INT,
    horario TIME,
    descricao_visual VARCHAR(100)
);
-- INSERINDO OS SUSPEITOS
INSERT INTO Perfil VALUES 
(1, 'Adriano Costa', 'Preto', 41),
(2, 'Bruno Ramos', 'Loiro', 39),
(3, 'Carla Meirelles', 'Preto', 37),
(4, 'Daniel Alves', 'Preto', 40),
(5, 'Eduardo Lima', 'Castanho', 42),
(6, 'Fabrício Souza', 'Preto', 41), -- O homem do chapéu
(7, 'Gustavo Henrique', 'Preto', 39), -- O assassino
(8, 'Helena Vitório', 'Ruivo', 38);
-- INSERINDO OS OBJETOS (Onde o aluno filtra o Cartão e o Perfume)
INSERT INTO Objetos_Pessoais VALUES 
(1, 'Cartão Tech'), (1, 'Barra de Cereal'),
(4, 'Cartão Tech'), (4, 'Perfume Importado'),
(6, 'Chapéu Coco'), (6, 'Chave de Fenda'),
(7, 'Cartão Tech'), (7, 'Perfume Importado');
-- AGENDA (O crime foi às 20:00. Fabrício saiu cedo!)
INSERT INTO Agenda_Presenca VALUES 
(1, 'Quarta', 'Lanchonete', '19:00', '21:00'),
(4, 'Quarta', 'Musculação', '19:30', '21:00'),
(6, 'Quarta', 'Entrada/Saída', '14:00', '15:00'), -- Fabrício: entrou as 14 e saiu as 15
(7, 'Quarta', 'Área VIP', '19:00', '21:00');
-- CÂMERAS (Confirmando a saída do Fabrício e a entrada do Gustavo)
INSERT INTO Cameras VALUES 
(101, 6, '14:00:00', 'Entrou no prédio usando Chapéu Coco'),
(102, 6, '15:00:00', 'Saiu do prédio e deixou o chapéu cair no jardim'),
(103, 7, '19:45:00', 'Entrou na Área VIP usando o Cartão Tech'),
(104, 1, '20:00:00', 'Visto na lanchonete comprando água');
