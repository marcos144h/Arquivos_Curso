-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('lidia',' lidia@email.com', '19999990101', 'Limeira', TRUE),
('marcos vl', 'marcos.vl@email.com', '19999990102', 'Campinas', TRUE);

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome)
VALUES ('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SET @id_categoria_especiais = (
    SELECT id_categoria
    FROM categoria
    WHERE nome = 'Especiais da Casa'
);

SELECT @id_categoria_especiais AS id_categoria_especiais;

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('cafe', 17.50, TRUE, @id_categoria_especiais),
('misto quente', 16.00, TRUE, @id_categoria_especiais),
('Bolo de Cenoura', 12.50, TRUE, @id_categoria_especiais);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('lidia',' lidia@email.com', null, 'Limeira', TRUE),

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido(data_pedido,status,valor_total,id_cliente)VALUES
(NOW(), 'aberto',0.00, @cliente);
