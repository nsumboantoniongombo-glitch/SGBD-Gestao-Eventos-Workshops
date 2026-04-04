-- Criação de base de dados
CREATE DATABASE BD_EVENTO_ACADEMICO ;
USE BD_EVENTO_ACADEMICO ;

CREATE TABLE Funcionario (
Id_Funcionario INTEGER PRIMARY KEY auto_increment ,
Nome VARCHAR(100),
Sexo CHAR(1)
);



CREATE TABLE Endereco_Funcionario (
Id_endereço_Funcionario integer primary key auto_increment,
Id_Funcionario INTEGER,
província  VARCHAR(20),
Municipio VARCHAR(20),
Bairro VARCHAR(20),
Zona VARCHAR(20),
Rua VARCHAR(20),
foreign key (Id_Funcionario) references Funcionario(Id_Funcionario)
);
CREATE TABLE Contacto_funcionario (
Id_contacto_funcionario integer primary key auto_increment,
Id_funcionario INTEGER,
Telefone NUMERIC(9),
Email VARCHAR(50),
FOREIGN KEY(Id_funcionario) REFERENCES Funcionario (Id_funcionario)
);

CREATE TABLE Participante (
Id_participante INTEGER PRIMARY KEY auto_increment,
Nome VARCHAR(100),
Sexo VARCHAR(100)
);
CREATE TABLE Contacto_participante (
Id_contacto_participante integer primary key auto_increment,
Id_participante INTEGER,
Telefone NUMERIC(9),
Email VARCHAR(100),
FOREIGN KEY(Id_participante) REFERENCES Participante (Id_participante)
);
CREATE TABLE  Endereco_participante (
Id_endereço integer primary key auto_increment,
Id_Participante INTEGER,
província  VARCHAR(20),
Municipio VARCHAR(20),
Bairro VARCHAR(20),
Zona VARCHAR(20),
Rua VARCHAR(20),
FOREIGN KEY(Id_Participante) REFERENCES Participante (Id_participante)
);
show tables;
CREATE TABLE Orador (
Id_orador INTEGER PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
Sexo CHAR(10),
Especialidade VARCHAR(50)
);
CREATE TABLE Oradores_Sessao (
Id_orador_sessao INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_sessao INTEGER,
Id_orador INTEGER,	
FOREIGN KEY(Id_sessao) REFERENCES Sessao (Id_Sessao),
FOREIGN KEY(Id_orador) REFERENCES Orador (Id_orador)
);

select *from Oradores_Sessao;


CREATE TABLE Endereco_Orador (
ID_Enderco_funcionario INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_orador INTEGER,
Provincia VARCHAR(50),
Municipio VARCHAR(50),
Bairro VARCHAR(50),
Zona VARCHAR(50),
Rua VARCHAR(50),
FOREIGN KEY(Id_orador) REFERENCES Orador (Id_orador)
);

CREATE TABLE Contacto_orador (
Id_contacto_orador integer primary key auto_increment,
Id_orador INTEGER,
Telefone NUMERIC(9),
Email VARCHAR(50),
Facbook varchar(20),
FOREIGN KEY(Id_orador) REFERENCES Orador (Id_orador)
);


select *from Inscricao;
show tables;
CREATE TABLE  Inscricao(
Id_Inscricao  INTEGER PRIMARY KEY auto_increment,
Id_participante INTEGER,
Id_funcionario INTEGER,
Data_inscreção DATETIME,
Valores DECIMAL(10,2),
Estado VARCHAR(50),
FOREIGN KEY(Id_participante) REFERENCES Participante (Id_participante),
FOREIGN KEY(Id_funcionario) REFERENCES Funcionario (Id_Funcionario)
);

CREATE TABLE Evento_Inscrecao (
Id_evento_Inscricao INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_Inscricao INTEGER,	
Id_evento INTEGER,
FOREIGN KEY(Id_Inscricao) REFERENCES Inscricao (Id_Inscricao),
FOREIGN KEY(Id_evento) REFERENCES Eventos (Id_evento)
);


show tables;
CREATE TABLE SESSAO (
Id_sessao INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_vento INTEGER,
Nome VARCHAR(100),
_Local VARCHAR(20),
Duracao date,
Hora_data DATETIME,
foreign key (Id_vento) references Eventos(Id_evento)
);

CREATE TABLE Eventos (
Id_evento INTEGER PRIMARY KEY auto_increment,
Nome VARCHAR(100),
Numero_vaga INTEGER,
Inicio DATETIME,
Fim datetime,
Preco decimal(10,2)
);


show tables;
CREATE TABLE Departamento (
Id_departamento INTEGER PRIMARY KEY auto_increment,
Nome VARCHAR(100)
);

CREATE TABLE departamento_evento (
Id_dapartamento_evento INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_departamento INTEGER,
Id_evento INTEGER,	
FOREIGN KEY(Id_departamento) REFERENCES Departamento(Id_departamento),
FOREIGN KEY(Id_evento) REFERENCES Eventos (Id_evento)
);
show tables;




CREATE TABLE Contacto_departamento (
Id_contacto_participante INTEGER PRIMARY KEY auto_increment,
Id_departamento INTEGER,
Telefone NUMERIC(9),
Email VARCHAR(100),
FOREIGN KEY(Id_departamento) REFERENCES Departamento (Id_departamento)
);



-- Insertes


INSERT INTO Departamento (Nome) VALUES
(default,'Departamento de Engenharia Informática'),
(default,'Departamento de Ciências Exactas'),
(default,'Departamento de Gestão e Economia'),
(default,'Departamento de Ciências da Saúde'),
(default,'Departamento de Educação');


INSERT INTO Eventos (Nome, Numero_vaga, Inicio, Fim, Preco) VALUES
(default,'Workshop de Inteligência Artificial Aplicada',          60,  '2025-03-10 08:00:00', '2025-03-10 17:00:00', 1500.00),
(default,'Seminário de Segurança de Redes e Cibersegurança',      50,  '2025-04-05 08:30:00', '2025-04-06 16:00:00', 2000.00),
(default,'Workshop de Desenvolvimento Web Full-Stack',            80,  '2025-05-15 09:00:00', '2025-05-16 17:30:00', 1800.00),
(default,'Conferência de Inovação e Empreendedorismo Digital',    100, '2025-06-20 08:00:00', '2025-06-21 18:00:00', 2500.00),
(default,'Workshop de Bases de Dados e SQL Avançado',             40,  '2025-07-08 09:00:00', '2025-07-08 16:00:00', 1200.00);


INSERT INTO SESSAO (Id_vento, Nome, _Local, Duracao, Hora_data) VALUES

(default, 'Introdução ao Machine Learning',          'Sala A1', '2025-03-10', '2025-03-10 08:30:00'),
(default,'Redes Neuronais e Deep Learning',         'Sala A1', '2025-03-10', '2025-03-10 13:00:00'),

(default, 'Fundamentos de Segurança em Redes',       'Laboratório B2', '2025-04-05', '2025-04-05 09:00:00'),
(default, 'Ataques e Defesa em Ambiente Real',       'Laboratório B2', '2025-04-06', '2025-04-06 09:00:00'),

(default, 'Frontend Moderno com React',              'Sala C3', '2025-05-15', '2025-05-15 09:30:00'),
(default, 'Backend com Node.js e APIs REST',         'Sala C3', '2025-05-16', '2025-05-16 09:30:00'),

(default, 'Modelos de Negócio Digital',              'Auditório Principal', '2025-06-20', '2025-06-20 08:30:00'),
(default, 'Startups: Da Ideia ao Mercado',           'Auditório Principal', '2025-06-21', '2025-06-21 08:30:00'),

(default, 'Modelagem e Normalização de BD',          'Sala D1', '2025-07-08', '2025-07-08 09:00:00'),
(default, 'Consultas Avançadas e Optimização SQL',   'Sala D1', '2025-07-08', '2025-07-08 13:00:00');

INSERT INTO departamento_evento (Id_departamento, Id_evento) VALUES
(default,1, 1), 
(default,1, 2), 
(default,1, 3),
(default,3, 4), 
(default,2, 5); 


INSERT INTO Orador (Nome, Sexo, Especialidade) VALUES
(default,'Prof. Carlos Manuel Lopes',    'M', 'Inteligência Artificial'),
(default,'Dra. Ana Paula Ferreira',      'F', 'Cibersegurança'),
(default,'Eng. João Baptista Neto',      'M', 'Desenvolvimento Web'),
(default,'Prof. Maria José Cardoso',     'F', 'Bases de Dados'),
(default,'Dr. António Sebastião Tomas',  'M', 'Empreendedorismo Digital'),
(default,'Eng. Fátima Luvualo',          'F', 'Redes de Computadores'),
(default,'Prof. Pedro Afonso Kiala',     'M', 'Machine Learning'),
(default,'Dra. Beatriz Ngola Mbemba',    'F', 'Inovação Tecnológica'),
(default,'Eng. Ricardo Simões Castro',   'M', 'DevOps e Cloud Computing'),
(default,'Prof. Luísa Domingos Neto',    'F', 'Sistemas de Informação');


INSERT INTO Contacto_orador (Id_orador, Telefone, Email, Facbook) VALUES
(1,  923456781, 'carlos.lopes@univ.ao',     'fb.com/carloslopes'),
(2,  912345678, 'ana.ferreira@univ.ao',     'fb.com/anaferreira'),
(3,  934567890, 'joao.neto@techdev.ao',     'fb.com/joaoneto'),
(4,  945678901, 'maria.cardoso@univ.ao',    'fb.com/mariacardoso'),
(5,  956789012, 'antonio.tomas@startup.ao', 'fb.com/antoniotomas'),
(6,  967890123, 'fatima.luvualo@net.ao',    'fb.com/fatimaluvualo'),
(7,  978901234, 'pedro.kiala@ai.ao',        'fb.com/pedrokiala'),
(8,  989012345, 'beatriz.mbemba@inov.ao',   'fb.com/beatrizmbemba'),
(9,  990123456, 'ricardo.castro@cloud.ao',  'fb.com/ricardocastro'),
(10, 901234567, 'luisa.neto@si.ao',         'fb.com/luisaneto');


INSERT INTO Endereco_Orador (Id_orador, Provincia, Municipio, Bairro, Zona, Rua) VALUES
(default,  'Uíge',   'Uíge',    'Caputo',        'Zona 2', 'Rua da Universidade'),
(default,'Luanda', 'Luanda',  'Maianga',        'Zona 3', 'Rua Rainha Ginga'),
(default,  'Luanda', 'Cazenga', 'Tala Hady',      'Zona 1', 'Rua dos Técnicos'),
(default,  'Uíge',   'Uíge',    'Bairro Militar', 'Zona 4', 'Rua da Escola'),
(default, 'Malanje','Malanje',  'Centro',         'Zona 2', 'Rua do Comércio'),
(default, 'Uíge',   'Uíge',    'Sanzala Nova',   'Zona 1', 'Rua da Paz'),
(default, 'Luanda', 'Ingombotas','Mutamba',       'Zona 5', 'Rua Primeiro de Maio'),
(default, 'Uíge',   'Negage',  'Centro',         'Zona 3', 'Rua da Juventude'),
(default,  'Luanda', 'Sambizanga','Mabor',         'Zona 2', 'Rua dos Engenheiros'),
(default,'Uíge',   'Uíge',    'Caputo',         'Zona 1', 'Rua da Informática');


INSERT INTO Oradores_Sessao (Id_sessao, Id_orador) VALUES
(default,1,  1), 
(default,1,  7),  
(default,2,  7),  
(default,3,  2),  
(default,3,  6),  
(default,4,  2),  
(default,5,  3),  
(default,6,  3),  
(default,6,  9),  
(default,7,  5),  
(default,7,  8),  
(default,8,  5),  
(default,9,  4),  
(default,9,  10), 
(default,10, 4);  




INSERT INTO Funcionario (Nome, Sexo) VALUES
(default,'Secretária Rosa Domingos',   'F'),
(default,'Técnico Manuel Patrício',    'M'),
(default,'Secretária Helena Teixeira', 'F');


INSERT INTO Contacto_funcionario (Id_funcionario, Telefone, Email) VALUES
(default,1, 921100001, 'rosa.domingos@eventos.ao'),
(default,2, 921100002, 'manuel.patricio@eventos.ao'),
(default,3, 921100003, 'helena.teixeira@eventos.ao');


INSERT INTO Endereco_Funcionario (Id_Funcionario, província, Municipio, Bairro, Zona, Rua) VALUES
(default,1, 'Uíge', 'Uíge', 'Caputo',        'Zona 1', 'Rua da Administração'),
(default,2, 'Uíge', 'Uíge', 'Bairro Central','Zona 2', 'Rua do Instituto'),
(default,3, 'Uíge', 'Uíge', 'Sanzala Nova',  'Zona 3', 'Rua da Secretaria');


INSERT INTO Participante (Nome, Sexo) VALUES
(default,'Adilson Faustino Lopes',        'M'),
(default,'Brenda Natália Quissanga',       'F'),
(default,'Celestino Paulo Mbemba',         'M'),
(default,'Débora Angélica Mateus',         'F'),
(default,'Eduardo Simão Neto',             'M'),
(default,'Feliciana Rosa Dala',            'F'),
(default,'Gustavo Henrique Sousa',         'M'),
(default,'Helena Marques Domingos',        'F'),
(default,'Isidro Cassule Capita',          'M'),
(default,'Joana Beatriz Silva',            'F'),
(default,'Kizua Manuel Lopes',             'M'),
(default,'Lurdes Fernanda Costa',          'F'),
(default,'Mário Sebastião Teixeira',       'M'),
(default,'Natália Conceição Pinto',        'F'),
(default,'Osvaldo Miguel Katola',          'M'),
(default,'Palmira Suzana Ngola',           'F'),
(default,'Quintino José Mbunga',           'M'),
(default,'Rosária Luísa Bumba',            'F'),
(default,'Sandro Filipe Mendonça',         'M'),
(default,'Teresa Angélica Nzinga',         'F');


INSERT INTO Contacto_participante (Id_participante, Telefone, Email) VALUES
(default,1,  923000001, 'adilson.lopes@gmail.com'),
(default,2,  923000002, 'brenda.quissanga@gmail.com'),
(default,3,  923000003, 'celestino.mbemba@gmail.com'),
(default,4,  923000004, 'debora.mateus@gmail.com'),
(default,5,  923000005, 'eduardo.neto@gmail.com'),
(default,6,  923000006, 'feliciana.dala@gmail.com'),
(default,7,  923000007, 'gustavo.sousa@gmail.com'),
(default,8,  923000008, 'helena.domingos@gmail.com'),
(default,9,  923000009, 'isidro.capita@gmail.com'),
(default,10, 923000010, 'joana.silva@gmail.com'),
(default,11, 923000011, 'kizua.lopes@gmail.com'),
(default,12, 923000012, 'lurdes.costa@gmail.com'),
(default,13, 923000013, 'mario.teixeira@gmail.com'),
(default,14, 923000014, 'natalia.pinto@gmail.com'),
(default,15, 923000015, 'osvaldo.katola@gmail.com'),
(default,16, 923000016, 'palmira.ngola@gmail.com'),
(default,17, 923000017, 'quintino.mbunga@gmail.com'),
(default,18, 923000018, 'rosaria.bumba@gmail.com'),
(default,19, 923000019, 'sandro.mendonca@gmail.com'),
(default,20, 923000020, 'teresa.nzinga@gmail.com');

INSERT INTO Endereco_participante (Id_Participante, província, Municipio, Bairro, Zona, Rua) VALUES
(default,1,  'Uíge',    'Uíge',     'Caputo',          'Zona 1', 'Rua A'),
(default,2,  'Uíge',    'Uíge',     'Sanzala Nova',    'Zona 2', 'Rua B'),
(default,3,  'Uíge',    'Negage',   'Centro',          'Zona 1', 'Rua C'),
(default,4,  'Luanda',  'Luanda',   'Maianga',         'Zona 3', 'Rua D'),
(default,5,  'Uíge',    'Uíge',     'Bairro Militar',  'Zona 4', 'Rua E'),
(default,6,  'Malanje', 'Malanje',  'Centro',          'Zona 2', 'Rua F'),
(default,7,  'Uíge',    'Uíge',     'Caputo',          'Zona 1', 'Rua G'),
(default,8,  'Uíge',    'Uíge',     'Sanzala Nova',    'Zona 3', 'Rua H'),
(default,9,  'Luanda',  'Cazenga',  'Tala Hady',       'Zona 1', 'Rua I'),
(default,10, 'Uíge',    'Uíge',     'Centro',          'Zona 2', 'Rua J'),
(default,11, 'Uíge',    'Uíge',     'Caputo',          'Zona 1', 'Rua K'),
(default,12, 'Uíge',    'Negage',   'Bairro Novo',     'Zona 2', 'Rua L'),
(default,13, 'Luanda',  'Ingombotas','Mutamba',         'Zona 5', 'Rua M'),
(default,14, 'Uíge',    'Uíge',     'Bairro Central',  'Zona 3', 'Rua N'),
(default,15, 'Uíge',    'Uíge',     'Sanzala Nova',    'Zona 1', 'Rua O'),
(default,16, 'Malanje', 'Malanje',  'Centro',          'Zona 4', 'Rua P'),
(default,17, 'Uíge',    'Uíge',     'Caputo',          'Zona 2', 'Rua Q'),
(default,18, 'Uíge',    'Uíge',     'Bairro Militar',  'Zona 1', 'Rua R'),
(default,19, 'Luanda',  'Luanda',   'Rangel',          'Zona 3', 'Rua S'),
(default,20, 'Uíge',    'Uíge',     'Centro',          'Zona 2', 'Rua T');


INSERT INTO Inscricao (Id_participante, Id_funcionario, Data_inscreção, Valores, Estado) VALUES

(default,1,  1, '2025-03-01 10:00:00', 1500.00, 'Confirmada'),
(default,2,  1, '2025-03-02 11:00:00', 1500.00, 'Confirmada'),
(default,3,  2, '2025-03-03 09:30:00', 1500.00, 'Confirmada'),
(default,4,  2, '2025-03-04 14:00:00', 1500.00, 'Pendente'),
(default,5,  3, '2025-03-05 10:30:00', 1500.00, 'Confirmada'),
(default,6,  3, '2025-03-06 16:00:00', 1500.00, 'Cancelada'),

(default,7,  1, '2025-03-20 08:00:00', 2000.00, 'Confirmada'),
(default,8,  1, '2025-03-21 09:00:00', 2000.00, 'Confirmada'),
(default,9,  2, '2025-03-22 10:00:00', 2000.00, 'Confirmada'),
(default,10, 2, '2025-03-23 11:00:00', 2000.00, 'Pendente'),
(default,11, 3, '2025-03-24 13:00:00', 2000.00, 'Confirmada'),
(default,12, 3, '2025-03-25 14:30:00', 2000.00, 'Cancelada'),

(default,13, 1, '2025-04-25 08:30:00', 1800.00, 'Confirmada'),
(default,14, 1, '2025-04-26 09:30:00', 1800.00, 'Confirmada'),
(default,15, 2, '2025-04-27 10:30:00', 1800.00, 'Confirmada'),
(default,16, 2, '2025-04-28 11:30:00', 1800.00, 'Pendente'),
(default,17, 3, '2025-04-29 13:30:00', 1800.00, 'Confirmada'),
(default,18, 3, '2025-04-30 15:00:00', 1800.00, 'Confirmada'),

(default,19, 1, '2025-05-30 08:00:00', 2500.00, 'Confirmada'),
(default,20, 1, '2025-05-31 09:00:00', 2500.00, 'Confirmada'),
(default,1,  2, '2025-06-01 10:00:00', 2500.00, 'Confirmada'),  
(default,2,  2, '2025-06-02 11:00:00', 2500.00, 'Pendente'),    
(default,3,  3, '2025-06-03 13:00:00', 2500.00, 'Confirmada'),  
(default,4,  3, '2025-06-04 14:00:00', 2500.00, 'Cancelada'),

(default,5,  1, '2025-06-20 08:00:00', 1200.00, 'Confirmada'), 
(default,6,  1, '2025-06-21 09:00:00', 1200.00, 'Confirmada'),
(default,7,  2, '2025-06-22 10:00:00', 1200.00, 'Confirmada'),  
(default,8,  2, '2025-06-23 11:00:00', 1200.00, 'Pendente'),   
(default,9,  3, '2025-06-24 13:00:00', 1200.00, 'Confirmada'),  
(default,10, 3, '2025-06-25 14:00:00', 1200.00, 'Confirmada');  


INSERT INTO Evento_Inscrecao (Id_Inscricao, Id_evento) VALUES

(default,1,  1), (default,2,  1), (default,3,  1), (default,4,  1), (default,5,  1), (default,6,  1),

(default,7,  2), (default,8,  2), (default,9,  2), (default,0, 2), (default,11, 2), (default,12, 2),

(default,13, 3), (default,14, 3), (default,15, 3), (default,16, 3), (default,17, 3), (default,18, 3),

(default,19, 4), (default,20, 4), (default,21, 4), (default,22, 4), (default,23, 4), (default,24, 4),

(default,25, 5), (default,26, 5), (default,27, 5), (default,28, 5), (default,29, 5), (default,30, 5);

-- Consultas 


SELECT
    e.Id_evento                               AS ID_Evento,
    e.Nome                                    AS Evento,
    o.Nome                                    AS Orador,
    o.Especialidade                           AS Especialidade_Orador,
    COUNT(DISTINCT i.Id_participante)         AS Total_Participantes_Inscritos
FROM Eventos e
    JOIN SESSAO            s   ON s.Id_vento    = e.Id_evento
    JOIN Oradores_Sessao   os  ON os.Id_sessao  = s.Id_sessao
    JOIN Orador            o   ON o.Id_orador   = os.Id_orador
    LEFT JOIN Evento_Inscrecao ei ON ei.Id_evento = e.Id_evento
    LEFT JOIN Inscricao    i   ON i.Id_Inscricao = ei.Id_Inscricao
                               AND i.Estado = 'Confirmada'
GROUP BY
    e.Id_evento,
    e.Nome,
    o.Id_orador,
    o.Nome,
    o.Especialidade
ORDER BY
    e.Nome ASC,
    o.Nome ASC;

SELECT
    p.Id_participante                         AS ID_Participante,
    p.Nome                                    AS Participante,
    p.Sexo,
    COUNT(DISTINCT ei.Id_evento)              AS Total_Eventos_Inscritos
FROM Participante p
    JOIN Inscricao        i   ON i.Id_participante = p.Id_participante
    JOIN Evento_Inscrecao ei  ON ei.Id_Inscricao   = i.Id_Inscricao
GROUP BY
    p.Id_participante,
    p.Nome,
    p.Sexo
HAVING
    COUNT(DISTINCT ei.Id_evento) > 1
ORDER BY
    Total_Eventos_Inscritos DESC,
    p.Nome ASC;


SELECT
    s.Id_sessao                               AS ID_Sessao,
    e.Nome                                    AS Evento,
    s.Nome                                    AS Sessao,
    s._Local                                  AS Local,
    s.Hora_data                               AS Data_e_Hora,
    s.Duracao                                 AS Data_Duracao
FROM SESSAO s
    JOIN Eventos e ON e.Id_evento = s.Id_vento
WHERE
    s.Id_vento = 1   -- << Substituir pelo Id_evento pretendido
ORDER BY
    s.Hora_data ASC;


SELECT
    e.Id_evento                               AS ID_Evento,
    e.Nome                                    AS Evento,
    e.Preco                                   AS Preco_Unitario,
    COUNT(i.Id_Inscricao)                     AS Total_Inscricoes_Confirmadas,
    SUM(i.Valores)                            AS Receita_Total_AOA
FROM Eventos e
    JOIN Evento_Inscrecao ei ON ei.Id_evento    = e.Id_evento
    JOIN Inscricao        i  ON i.Id_Inscricao  = ei.Id_Inscricao
WHERE
    i.Estado = 'Confirmada'
GROUP BY
    e.Id_evento,
    e.Nome,
    e.Preco
ORDER BY
    Receita_Total_AOA DESC;


SELECT
    o.Id_orador                               AS ID_Orador,
    o.Nome                                    AS Orador,
    o.Especialidade,
    COUNT(DISTINCT eo.Provincia)              AS Total_Provincias,
    GROUP_CONCAT(DISTINCT eo.Provincia
                 ORDER BY eo.Provincia
                 SEPARATOR ', ')             AS Provincias
FROM Orador o
    JOIN Oradores_Sessao  os ON os.Id_orador  = o.Id_orador
    JOIN SESSAO           s  ON s.Id_sessao   = os.Id_sessao
    JOIN Eventos          e  ON e.Id_evento   = s.Id_vento
    JOIN Endereco_Orador  eo ON eo.Id_orador  = o.Id_orador
GROUP BY
    o.Id_orador,
    o.Nome,
    o.Especialidade
HAVING
    COUNT(DISTINCT eo.Provincia) > 1
ORDER BY
    Total_Provincias DESC,
    o.Nome ASC;


