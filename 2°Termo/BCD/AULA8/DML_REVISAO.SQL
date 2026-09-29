-- Active: 1788268180903@@127.0.0.1@3306@smartcoffee_dml_marcos
---REVISAO DE DML - AULA08

---REVISAO DE INSERTS

INSERT INTO cliente (nome,email, telefone,cidade,ativo)VALUES
("laura C",'laurac@gmail','199999902','limeira', TRUE),
("laura N",'lauram@gmail','199999903','limeira', TRUE),
("laura R",'laurar@gmail','199999904','limeira', TRUE),
("leonardo b",'leonardo@gmail','199999905','americana', TRUE),
("lidia bt",'lidia@gmail','199999906','belem', TRUE),
("livia v",'livia@gmail',null,'limeira', TRUE),
("marcos v",'marcos@gmail','199999907','campo mourao', TRUE),
("nicolas n",'nicolasn@gmail','199999908','', TRUE),
("nicolas f",'nicolas@gmail','199999909','campinas', TRUE),
("plabo h",'plabo@gmail','1999999010','indaituba', TRUE),
("sophie a",'sophie@gmail','1999999011','indaituba', TRUE),
(" vinicius h",'vinicius@gmail',null,'1999999012','limeira', TRUE),
(" vitoria s",'vitoria@gmail','1999999012','limeira', TRUE),
(" virginia",'virginia@gmail',null,'boston', TRUE),

INSERT INTO CATEGORIA(nome_clientes)VALUES
('combos especiais'),('nutela');

INSERT INTO pedido (id_pedido,status,valor_total,id_cliente)VALUES

(NOW(), 'ABERTO', 0.00,1);
  
 SET @pedido = LAST_INSERT_ID();

 SELECT @pedido;

 INSERT item_pedido(id_item,id_pedido, id_produto, quantidade,  preco_unitario,observacao )VALUES
 (@pedido,4,2,13.00,'nutella') 

 --atualizando dados no bd
 UPDATE cliente
 SET telefon='1999990003'
 WHERE id_cliente = 3;

UPDATE cliente
 SET telefon='1999990003'
 WHERE id_cliente = 18;

 ---TOMAR MUITO CUIDADO-- NAO ESQUECER:(--DE CLOCAR O WHERE)
 UPDATE cliente
 SET ativo= FALSE;

 UPDATE pedido
 SET valor_total=1.00;
 -----------------------------------------------
--DICAS DE OURO
--EXECUTAR O SELECT SEMPRE ANTES DE ATUALIZAR
--SELECT* FROM TABELA_QUE_DESEJO
-------------------------------------------------
---CONDICIONAIS

UPDATE produto
SET preco=
CASE
    WHEN preco< 30 THEN preco*1.50
    ELSE preco *1.25
END
WHERE ativo=TRUE;

UPDATE cliente
 SET telefone=NULL
 WHERE id_cliente=8;

 ----apagando dados do  db
DELETE FROM cliente;
WHERE id_cliente;

--EXCLUINDO DADOS DE FORMA LOGICA
UPDATE cliente
SET ativo= FALSE
WHERE ID_CLIENTES= 23;
----------------------
--CADASTANDO UM PROCEDIMENTO DE CONTA
INSERT INTO cliente(nome,email,telefone,cidade,ativo)VALUES
('bruno m','brunom@gmail.com','1999999913','piracicaba',TRUE);
set @cliente=LAST_INSERT_ID();

--PASSO 2 :ADICIONANDO UM NOVO PEDIDO
INSERT INTO pedido(data_pedido,status,valor_total,id_cliente)VALUES
(NOW(), 'aberto',0.00, @cliente);
SET @pedido = LAST_INSERT_ID();

----PASSO 3: ADICIONANDO ITENS PEDIDO
INSERT INTO item_pedido(id_pedido, id_produto,quantidade,preco_unitario,observacao)VALUES
(@pedido,3,2,13.00,'mel'),
(@pedido,5,1,15.00,'')

---PASSO 4 :ATUALIZANDO O VALOR TOTAL DE PEDIDO
UPDATE pedido
SET valor_total = 22.00,
    status = 'PREPARANDO'
    WHERE id_pedido=@pedido;

    --PASSO 5 : REGISTRANDO PAGAMENTO
    INSERT INTO pagamento(id_pedido,id_forma_pagamento,valor,data_pagamento)VALUES
    (@pedido,2,22.00, NOW());
    ---CONSULTA DE FORMA COMPLETA
    SELECT p.id_pedido,
        c.nome AS cliente,
        p.status,
        p.valo_total
FROM pedido p
JOIN cliente c ON c.id_cliente= p.id_cliente
WHERE p.id_cliente = @pedido

 SELECT * FROM item_pedido;

 SELECT * FROM pedido




