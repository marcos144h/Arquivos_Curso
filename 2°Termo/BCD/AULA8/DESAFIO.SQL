
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('sol', 'sol@email.com', '19999990156', 'Limeira', TRUE),
('lua', 'lua@email.com', '19999990155', 'Campinas', TRUE);


-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categorias (nome) 
VALUES ('Especiais da Casa');
select * from categoria

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SET @id_categoria = LAST_INSERT_ID();

INSERT INTO produto (id_produto,nome, preco,ativo,id_categoria) VALUES 
('Prato Especial1',, 45.90, @id_categoria),
('Prato Especial2', 52.00, @id_categoria),
('Sobremesa da Casa', 18.50, @id_categoria);
    
    SELECT*FROM produto

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO clientes (nome, email, telefone) 
VALUES ('Carlos Eduardo', 'carlos@email.com', NULL);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedidos (cliente_id, data_pedido) 
VALUES (1, NOW());

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade = LAST_INSERT_ID();

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) 
VALUES 
    (@pedido_atividade, 1, 2, 45.90),
    (@pedido_atividade, 3, 1, 18.50);