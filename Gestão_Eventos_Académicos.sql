-- 1. CRIAÇÃO DA BASE DE DADOS

CREATE DATABASE gestao_eventos;
USE gestao_eventos;

-- 2. DDL - CRIAÇÃO DAS TABELAS (com todas as restrições)

-- Tabela Evento
CREATE TABLE Evento (
    id_evento          INT AUTO_INCREMENT PRIMARY KEY,
    nome               VARCHAR(100) NOT NULL,
    data_inicio        DATETIME     NOT NULL,
    data_fim           DATETIME     NOT NULL,
    cidade             VARCHAR(100) NOT NULL,
    capacidade         INT          NOT NULL,
    preco_inscricao    DECIMAL(10,2) NOT NULL,

    CHECK (capacidade > 0),
    CHECK (preco_inscricao >= 0),
    CHECK (data_fim > data_inicio)
);

-- Tabela Participante
CREATE TABLE Participante (
    id_participante    INT AUTO_INCREMENT PRIMARY KEY,
    nome               VARCHAR(100) NOT NULL,
    sexo               CHAR(1),
    numero_telefone    VARCHAR(15),
    nivel_academico    VARCHAR(50)
);

-- Tabela Orador
CREATE TABLE Orador (
    id_orador          INT AUTO_INCREMENT PRIMARY KEY,
    nome               VARCHAR(100) NOT NULL,
    especialidade      VARCHAR(100),
    grau_academico     VARCHAR(50),
    numero_telefone    VARCHAR(15)
);

-- Tabela Sessao
CREATE TABLE Sessao (
    id_sessao          INT AUTO_INCREMENT PRIMARY KEY,
    titulo             VARCHAR(100) NOT NULL,
    data               DATETIME     NOT NULL,
    hora_inicio        DATETIME     NOT NULL,
    hora_fim           DATETIME     NOT NULL,
    sala               VARCHAR(50),
    tema               VARCHAR(100),

    id_evento          INT NOT NULL,
    id_orador          INT NOT NULL,

    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_orador) REFERENCES Orador(id_orador),

    CHECK (hora_fim > hora_inicio)
);

-- Tabela Estado_Inscricao (melhoria de normalização - 3FN)
CREATE TABLE Estado_Inscricao (
    id_estado          INT AUTO_INCREMENT PRIMARY KEY,
    descricao          VARCHAR(20) NOT NULL UNIQUE
);

-- Tabela Forma_Pagamento (melhoria de normalização - 3FN)
CREATE TABLE Forma_Pagamento (
    id_forma           INT AUTO_INCREMENT PRIMARY KEY,
    descricao          VARCHAR(20) NOT NULL UNIQUE
);

-- Tabela Inscricao (entidade associativa)
CREATE TABLE Inscricao (
    id_inscricao       INT AUTO_INCREMENT PRIMARY KEY,
    data_inscricao     DATETIME     NOT NULL,
    valor_pago         DECIMAL(10,2) NOT NULL,

    id_evento          INT NOT NULL,
    id_participante    INT NOT NULL,
    id_estado          INT NOT NULL,
    id_forma           INT NOT NULL,

    FOREIGN KEY (id_evento)       REFERENCES Evento(id_evento),
    FOREIGN KEY (id_participante) REFERENCES Participante(id_participante),
    FOREIGN KEY (id_estado)       REFERENCES Estado_Inscricao(id_estado),
    FOREIGN KEY (id_forma)        REFERENCES Forma_Pagamento(id_forma),

    CHECK (valor_pago >= 0)
    );


-- 3. DML - POPULAÇÃO DA BASE DE DADOS

-- Estados de Inscrição
INSERT INTO Estado_Inscricao (descricao) VALUES
('Confirmada'), ('Pendente'), ('Cancelada');

-- Formas de Pagamento
INSERT INTO Forma_Pagamento (descricao) VALUES
('Dinheiro'), ('Transferencia'), ('Cartao');

-- 5 Eventos (com diferentes cidades)
INSERT INTO Evento (nome, data_inicio, data_fim, cidade, capacidade, preco_inscricao) VALUES
('Workshop IA',          '2025-06-01 00:00:00', '2025-06-02 00:00:00', 'Luanda',   100, 15000.00),
('Conferencia Tech',     '2025-07-10 00:00:00', '2025-07-12 00:00:00', 'Benguela', 200, 20000.00),
('Seminario Dados',      '2025-08-05 00:00:00', '2025-08-06 00:00:00', 'Uige',     150, 12000.00),
('Palestra Cyber',       '2025-09-01 00:00:00', '2025-09-01 23:59:59', 'Lubango',   80, 10000.00),
('Workshop Web',         '2025-10-15 00:00:00', '2025-10-16 00:00:00', 'Luanda',   120, 18000.00);

-- 10 Oradores
INSERT INTO Orador (nome, especialidade, grau_academico, numero_telefone) VALUES
('Joao Silva',   'IA',          'Mestre',   '923000001'),
('Maria Costa',  'Cyber',       'Doutora',  '923000002'),
('Pedro Alves',  'Web',         'Licenciado','923000003'),
('Ana Santos',   'Dados',       'Mestre',   '923000004'),
('Carlos Lima',  'Seguranca',   'Doutor',   '923000005'),
('Rita Gomes',   'Cloud',       'Mestre',   '923000006'),
('Luis Pinto',   'Redes',       'Licenciado','923000007'),
('Sara Dias',    'DevOps',      'Mestre',   '923000008'),
('Miguel Rocha', 'IA',          'Doutor',   '923000009'),
('Paula Nunes',  'Dados',       'Mestre',   '923000010');

-- 20 Participantes
INSERT INTO Participante (nome, sexo, numero_telefone, nivel_academico) VALUES
('P1','M','923111001','Licenciatura'),('P2','F','923111002','Mestrado'),
('P3','M','923111003','Licenciatura'),('P4','F','923111004','Doutoramento'),
('P5','M','923111005','Licenciatura'),('P6','F','923111006','Mestrado'),
('P7','M','923111007','Licenciatura'),('P8','F','923111008','Licenciatura'),
('P9','M','923111009','Mestrado'),('P10','F','923111010','Licenciatura'),
('P11','M','923111011','Licenciatura'),('P12','F','923111012','Mestrado'),
('P13','M','923111013','Licenciatura'),('P14','F','923111014','Doutoramento'),
('P15','M','923111015','Licenciatura'),('P16','F','923111016','Mestrado'),
('P17','M','923111017','Licenciatura'),('P18','F','923111018','Licenciatura'),
('P19','M','923111019','Mestrado'),('P20','F','923111020','Licenciatura');

-- sessoes
INSERT INTO Sessao (titulo, data, hora_inicio, hora_fim, sala, tema, id_evento, id_orador) VALUES
-- Evento 1 - Workshop IA (Luanda)
('Introdução à Inteligência Artificial', '2025-06-01 00:00:00', '2025-06-01 08:00:00', '2025-06-01 10:00:00', 'Sala A1', 'IA', 1, 1),
('Machine Learning Básico',              '2025-06-01 00:00:00', '2025-06-01 10:30:00', '2025-06-01 12:30:00', 'Sala A2', 'IA', 1, 10),
('Redes Neurais',                        '2025-06-02 00:00:00', '2025-06-02 09:00:00', '2025-06-02 11:00:00', 'Sala A1', 'IA', 1, 9),
('Aplicações Práticas de IA',            '2025-06-02 00:00:00', '2025-06-02 14:00:00', '2025-06-02 16:00:00', 'Sala A2', 'IA', 1, 1),

-- Evento 2 - Conferencia Tech (Benguela)
('Tendências Tecnológicas 2025',         '2025-07-10 00:00:00', '2025-07-10 09:00:00', '2025-07-10 10:30:00', 'Auditório', 'Tech', 2, 3),
('Cloud Computing',                      '2025-07-10 00:00:00', '2025-07-10 11:00:00', '2025-07-10 13:00:00', 'Sala B1', 'Cloud', 2, 6),
('Inteligência Artificial',              '2025-07-11 00:00:00', '2025-07-11 09:00:00', '2025-07-11 11:00:00', 'Sala B2', 'IA', 2, 1),   -- Joao Silva em Benguela

-- Evento 3 - Seminario Dados (Uige)
('Introdução a Big Data',                '2025-08-05 00:00:00', '2025-08-05 08:00:00', '2025-08-05 10:00:00', 'Sala C1', 'Dados', 3, 4),
('Python para Análise de Dados',         '2025-08-05 00:00:00', '2025-08-05 11:00:00', '2025-08-05 13:00:00', 'Sala C2', 'Dados', 3, 4),
('Visualização de Dados',                '2025-08-06 00:00:00', '2025-08-06 09:00:00', '2025-08-06 11:00:00', 'Sala C1', 'Dados', 3, 10),

-- Evento 4 - Palestra Cyber (Lubango)
('Cibersegurança Básica',                '2025-09-01 00:00:00', '2025-09-01 09:00:00', '2025-09-01 11:00:00', 'Auditório', 'Cyber', 4, 2),
('Proteção contra Ataques',              '2025-09-01 00:00:00', '2025-09-01 14:00:00', '2025-09-01 16:00:00', 'Sala D1', 'Cyber', 4, 5),
('Segurança em IA',                      '2025-09-01 00:00:00', '2025-09-01 17:00:00', '2025-09-01 18:30:00', 'Sala D2', 'Cyber', 4, 2),   -- Maria Costa em Lubango

-- Evento 5 - Workshop Web (Luanda)
('Desenvolvimento Frontend',             '2025-10-15 00:00:00', '2025-10-15 08:00:00', '2025-10-15 10:00:00', 'Sala E1', 'Web', 5, 3),
('Backend com Node.js',                  '2025-10-15 00:00:00', '2025-10-15 11:00:00', '2025-10-15 13:00:00', 'Sala E2', 'Web', 5, 3),
('Integração de APIs',                   '2025-10-16 00:00:00', '2025-10-16 09:00:00', '2025-10-16 11:00:00', 'Sala E1', 'Web', 5, 7);

-- 30 Inscrições
INSERT INTO Inscricao (data_inscricao, valor_pago, id_evento, id_participante, id_estado, id_forma) VALUES
('2025-05-01',15000,1,1,1,1),('2025-05-02',15000,1,2,1,2),('2025-05-03',15000,1,3,1,3),
('2025-05-04',15000,1,4,1,1),('2025-05-05',15000,1,5,1,2),
('2025-06-15',20000,2,6,1,3),('2025-06-16',20000,2,7,1,1),('2025-06-17',20000,2,8,1,2),
('2025-06-18',20000,2,9,1,3),('2025-06-19',20000,2,10,1,1),
('2025-07-25',12000,3,11,1,2),('2025-07-26',12000,3,12,1,3),('2025-07-27',12000,3,13,1,1),
('2025-07-28',12000,3,14,1,2),('2025-07-29',12000,3,15,1,3),
('2025-08-20',10000,4,16,1,1),('2025-08-21',10000,4,17,1,2),('2025-08-22',10000,4,18,1,3),
('2025-08-23',10000,4,19,1,1),('2025-08-24',10000,4,20,1,2),
('2025-09-10',18000,5,1,1,3),('2025-09-11',18000,5,2,1,1),('2025-09-12',18000,5,3,1,2),
('2025-09-13',18000,5,4,1,3),('2025-09-14',18000,5,5,1,1),
('2025-05-25',15000,1,6,1,2),('2025-05-26',15000,1,7,1,3),('2025-06-20',20000,2,8,1,1),
('2025-07-30',12000,3,9,1,2),('2025-08-25',10000,4,10,1,3);

-- Listar todos os eventos com os seus oradores e o número total de participantes inscritos
SELECT 
    e.nome AS Evento,
    o.nome AS Orador,
    COUNT(i.id_participante) AS Total_Participantes
FROM Evento e
JOIN Sessao s ON e.id_evento = s.id_evento
JOIN Orador o ON s.id_orador = o.id_orador
LEFT JOIN Inscricao i ON e.id_evento = i.id_evento
GROUP BY e.id_evento, o.id_orador
ORDER BY e.nome;

-- Encontrar os participantes que se inscreveram em mais de um evento
SELECT 
    p.nome AS Participante,
    COUNT(DISTINCT i.id_evento) AS Total_Eventos
FROM Participante p
JOIN Inscricao i ON p.id_participante = i.id_participante
GROUP BY p.id_participante
HAVING COUNT(DISTINCT i.id_evento) > 1
ORDER BY Total_Eventos DESC;

-- lista de sessões de um evento específico (exemplo: id_evento = 1)
SELECT 
    titulo AS Titulo,
    data,
    hora_inicio,
    hora_fim,
    sala,
    tema
FROM Sessao
WHERE id_evento = 1
ORDER BY data, hora_inicio;

-- Calcular a receita total gerada por cada evento
SELECT 
    e.nome AS Evento,
    SUM(i.valor_pago) AS Receita_Total
FROM Evento e
JOIN Inscricao i ON e.id_evento = i.id_evento
GROUP BY e.id_evento
ORDER BY Receita_Total DESC;

-- oradores que participam em eventos em mais de uma cidade
SELECT 
    o.nome AS Orador,
    COUNT(DISTINCT e.cidade) AS Total_Cidades_Diferentes,
    GROUP_CONCAT(DISTINCT e.cidade SEPARATOR ', ') AS Cidades
FROM Orador o
JOIN Sessao s ON o.id_orador = s.id_orador
JOIN Evento e ON s.id_evento = e.id_evento
GROUP BY o.id_orador
HAVING COUNT(DISTINCT e.cidade) > 1
ORDER BY Total_Cidades_Diferentes DESC;