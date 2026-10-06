-- Active: 1788268180903@@127.0.0.1@3306@smartcoffee_dml_marcos
INSERT INTO CLIENTE (NOME,EMAIL,TELEFONE,CIDADE,ATIVO)VALUES
('manuella rossant', 'manuella@EMAIL.COM','199999812131','LIMEIRA',TRUE);
---CONSULTAS COM SELECT

--ESTRUTURA DE CONSTRUÇÃO DO SELECT
SELECT coluna
FROM tabela

--EX 1 : select para todas as colunnas
SELECT*FROM cliente;

--EX 2 ; SELECT POR COLUNAS
SELECT nome,email,ativo FROM cliente;
--EX 3: ALIAS E UM PEDIDO PARA O RESULTADO
SELECT nome AS cliente,
    telefone AS  contato
     FROM cliente;

SELECT ativo as STATUS
FROM cliente;

SELECT nome,preco,preco*1.80 AS  preco_promocao
FROM produto;
--EX 4 : ELIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;

SELECT cidade FROM cliente

--sem distinct -aparece varias vezes
--COM DISTINCT - aparece uma vez

--EX: FILTROS EM REGISTROS
SELECT nome,preco
FROM produto
WHERE preco >10.00;

SELECT nome,preco
FROM produto
WHERE preco <> 10; -- OU !- E <> sao diferentes

SELECT nome,preco
FROM produto
WHERE ativo = TRUE;

SELECT id_pedido,data_pedido,valor_total
FROM pedido
WHERE valor_total >=25.00;


--OUTROS OPERADORES DE COMPARAÇÃO
-- = IGUAL
--<> ! = DIFERENTE
--> MAIOR
--< MENOR
-- <= MENOR IGUAL

SELECT nome,preco
FROM produto
WHERE preco >= 8 AND preco <=20;

-- EXEMPLO COM OR
SELECT nome,cidade
FROM cliente
WHERE cidade = 'limeira' OR cidade='piracicaba';

-- exemplo com not
SELECT nome,cidade
FROM cliente
WHERE NOT cidade= 'limeira';

-- EXEMPLO COM AND E OR JUNTOS UTILIZAR()
SELECT nome,cidade, ativo
FROM cliente
where ativo= TRUE
AND(cidade='limeira'OR cidade= 'americana');
--EX 7: BETWEEN - PESQUIZA POR INTERVALOS
SELECT nome,preco
FROM produto
WHERE preco  BETWEEN 8.0 AND 15.00;

--EX8 : IN - VARIAS POSSIBILIDADES
-- USAR PARA ELIMINAR A QUANTIDADE DE OR

SELECT nome,cidade
FROM cliente
WHERE cidade IN ('limeira','americana','piracicaba');

SELECT nome,cidade
FROM cliente
WHERE cidade NOT IN('limeira','americana',);
--EX 9 : LIKE - PESQUIZANDO POR TEXTOS
SELECT nome
FROM produto
WHERE nome LIKE 'cafe%'
--COMECA COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%silva';

--UTILIZANDO % COMO CORINGA
SELECT nome
FROM produto
WHERE nome LIKE '_ilva';

SELECT nome
FROM produto
WHERE nome LIKE 'br_';
--UTILIZANDO _ COMO CORINGA

--EX10: NULL - AUSENCIA DE VALOR
SELECT nome,telefone
FROM cliente
WHERE telefone IS NULL;


SELECT nome,telefone
FROM cliente
WHERE telefone IS  NOT NULL;

--EX 11: ORDEN BY - ORDENAR RESULTADOS
-- ASC - ORDEM CRESCENTE É DRECENCETE
SELECT nome,preco
FROM produto
ORDER BY PRECO ASC;
SELECT nome,preco
FROM produto
ORDER BY preco DESC;

SELECT nome,preco
FROM produto
ORDER BY cidade ASC, nome DESC;

-- EX 12 : LIMIT - LIMITANDO A QUANTIDADE DE REULTADOS
SELECT nome,preco
FROM produto
ORDER BY preco DESC
LIMIT 8;

SELECT nome, preco
FROM produto
ORDER BY nome
LIMIT 8 OFFSET 8;
-
--EX 13 : COLUNAS COM CALCULOS
SELECT nome,preco,preco* 1.10 AS preco_com_reajuste
FROM produto;

--CALCULO COM SUBTOTAL
SELECT id_item,quantidade,perco_unitario,quantidade*perco_unitario AS subtotal
FROM item_pedido;


