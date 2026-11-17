-- Active: 1794917670332@@127.0.0.1@3308@recuperativa_retrogame
DROP DATABASE IF EXISTS recuperacao_retrogame;
CREATE DATABASE IF NOT EXISTS  recuperacao_retrogame;
USE  recuperacao_retrogame;


CREATE TABLE PLATAFORMA (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE
);


CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE
);


CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE
);


CREATE TABLE JOGO (
    id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_jogo_plataforma FOREIGN KEY (id_plataforma) REFERENCES PLATAFORMA(id_plataforma),
    CONSTRAINT fk_jogo_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);


CREATE TABLE LOCACAO (
    id_locacao INT PRIMARY KEY AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'ABERTA' 
        CHECK (status_locacao IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT fk_locacao_jogo FOREIGN KEY (id_jogo) REFERENCES JOGO(id_jogo)
);
SELECT*FROM categoria;
ALTER TABLE jogo ADD desenvolvedora VARCHAR(100);


INSERT INTO cliente (nome, email, telefone) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98888-1111'),
('Bruno Costa', 'bruno.costa@email.com', '(11) 97777-2222'),
('Carla Dias', 'carla.dias@email.com', NULL),
('Diego Souza', 'diego.souza@email.com', '(11) 96666-4444');


INSERT INTO plataforma (nome) VALUES 
('console'), 
('nintendo');

INSERT INTO categoria (nome) VALUES 
('RPG'), 
('Ação');
