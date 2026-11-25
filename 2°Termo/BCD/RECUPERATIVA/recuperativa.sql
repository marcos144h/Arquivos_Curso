-- Active: 1794917670332@@127.0.0.1@3308@recuperacao_retrogame
-- active: 1794917670332@@127.0.0.1@3308@recuperacao_retrogame
DROP DATABASE nome_do_banco;
DROP DATABASE IF EXISTS recuperacao_retrogame;
CREATE DATABASE IF NOT EXISTS recuperacao_retrogame;
USE recuperacao_retrogame;

CREATE TABLE plataforma (
    id_plataforma INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_plataforma PRIMARY KEY (id_plataforma)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL DEFAULT TRUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_email UNIQUE (email)
);

CREATE TABLE jogo (
    id_jogo INT AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    id_plataforma INT,
    id_categoria INT,

    CONSTRAINT pk_jogo PRIMARY KEY (id_jogo),
    CONSTRAINT fk_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE locacao (
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'aberta' CHECK (status_locacao IN ('aberta','devolvida','atrasada')),
    id_cliente INT,
    id_jogo INT,

    CONSTRAINT pk_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES plataforma (id_plataforma),
    CONSTRAINT fk_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);

ALTER TABLE jogo ADD desenvolvedora VARCHAR(100);

INSERT INTO cliente (nome,email,telefone,ativo) VALUES 
('marcos','marcos@gmail.com','1234567',TRUE),
('vinicio','vincio@gmail.com','12345678',TRUE),
('leo','leo@gmail.com','1234567',TRUE),
('nicolas','nicolasgmaail.com',NULL,TRUE);

INSERT INTO plataforma (nome) VALUES
('pc'),
('ps4');

INSERT INTO categoria (descricao) VALUES
('rpg'),
('ação');

INSERT INTO jogo (titulo,codigo,ano_lancamento,quantidade_disponivel) VALUES
('zelda','jog-001',1999,1),
('gta','jog-002',2013, 8),
('mario','jog-003',2018,22),
('elden ring','jog-004',2022,10),
('sonic','jog-005',2015,30),
('gta 4','jog-006',2013,45);

INSERT INTO locacao (data_retirada,data_prevista,data_devolucao,status_locacao,id_cliente,id_jogo) VALUES
(NOW(),'2026-11-17',NULL,'aberta',1,1),
(NOW(),'2026-11-17',NULL,'aberta',1,2),
(NOW(),'2026-11-17',NULL,'aberta',2,3);

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 3;

SELECT * FROM locacao;

UPDATE cliente
SET telefone = '123456789'
WHERE id_cliente = 1;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_lancamento >= 2000;

INSERT INTO cliente (nome, email, telefone, ativo) VALUES 
('marcos','gabriel ''marcos@gmail.com','123456543',TRUE);

DELETE FROM cliente
WHERE id_cliente = 5;

DELETE FROM cliente
WHERE id_cliente = 1;

SELECT titulo, ano_lancamento, quantidade_disponivel FROM jogo;

SELECT * FROM jogo
WHERE `quantidade_disponivel` >= 2
ORDER BY `quantidade_disponivel` DESC;

SELECT titulo
FROM jogo
WHERE titulo LIKE '%god%';

SELECT * FROM jogo 
WHERE ano_lancamento BETWEEN 1990 AND 2005;

SELECT 
COUNT(quantidade_disponivel) AS total_jogo, 
SUM(quantidade_disponivel) AS soma_quantidade,
AVG(quantidade_disponivel) AS media_quantidade, 
MIN(quantidade_disponivel) AS menor_quantidade, 
MAX(quantidade_disponivel) AS maior_quantidade
FROM jogo;


