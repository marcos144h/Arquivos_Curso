-- Active: 1788268180903@@127.0.0.1@3306@smartcoffee_dml_marcos
INSERT INTO CLIENTE (NOME,EMAIL,TELEFONE,CIDADE,ATIVO)VALUES
('manuella rossant', 'manuella@EMAIL.COM','199999812131','LIMEIRA',TRUE);
-- CONSULTAS COM SELECT

-- ESTRUTURA DE CONSTRUÇÃO DO SELECT
-- SELECT coluna
-- FROM tabela;

--EX 1 : select para todas as colunnas
SELECT * FROM cliente;

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

SELECT cidade FROM cliente;

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
WHERE cidade NOT IN ('limeira','americana');
--EX 9 : LIKE - PESQUIZANDO POR TEXTOS
SELECT nome
FROM produto
WHERE nome LIKE 'cafe%';
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

SELECT nome,cidade
FROM cliente
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

--EX 13 : COLUNAS COM CALCULOS
SELECT nome,preco,preco* 1.10 AS preco_com_reajuste
FROM produto;

--CALCULO COM SUBTOTAL
SELECT id_item,quantidade,preco_unitario,quantidade*preco_unitario AS subtotal
FROM item_pedido;


-- EX 14: FUNÇÕES UTEIS EM CONSULTAS

SELECT UPPER(nome) AS nome_maiusculo,
LOWER(email) AS email_minusculo
FROM cliente;
--deixar m maiusculo em minusculos e minusculo

SELECT CONCAT(nome, '-', cidade) AS nome_cidade
FROM cliente;

SELECT id_pedido,data_pedido,DATE(data_pedido) AS data_pedido, YEAR (data_pedido)AS
ano_pedido, MONTH(data_pedido) AS mês_pedido
FROM pedido;

--FORMATAÇÃO DE RESULTADOS POR DATA E ANO

--SUBSTITUINDO NULL TEXTO DESEJADO
SELECT nome,
COALESCE(telefone, 'nao informado')
FROM cliente;

--FUNCOES DE AGREGAÇÕES
-- EX 15: FUNÇÕES DE CALCULOS AGREGADAS

-- COUNT() - CONTAR
--SUM() - SOMAR
--AVG() - MEDIA
--MIN() - MINIMO
--MAX() - MAXIMO

SELECT COUNT(*) AS TOTAL_CLIENTES
FROM cliente;
--QUANTOS CLIENTES TEMOS EM NOSSA TABELA DE CLIENTE?
SELECT AVG(PRECO) AS PREÇO_MEDIO
FROM produto;
 --calcule o preco medio dos  produtos
 SELECT MIN(preco)  AS MENORES_PRECOS,
    MAX(preco) AS MAIORES_PRECOS,
    AVG(PRECO) AS MEDIA_PRECOS
    FROM produto;
    --resumo dos precos
    SELECT SUM(valor_total) AS FATURAMENTOS
    FROM pedido
    WHERE status = 'FINALIZADO';
    --total pedidos finalizados

-- EX 16: GROUP BY - AGRUPAR DADOS
SELECT id_categoria,
  COUNT(*) AS quantidade_produtos
  FROM produto  
  GROUP BY id_categoria;

  --EX 17 : - HAVING - FILTRAR GRUPOS
  --WHERE  FILTRA LINHAS ANTES DO AGRUPAMENTO
  -- HAVING FILTRA GRUPOSD DEPOIS DO GROUP BY
  SELECT cidade,
  COUNT(*) as Quantidade_clientes
  FROM cliente
  GROUP BY cidade
  having COUNT(*) >=2;

  --CIDADES COM PELO MENOS DIS CLIENTES

  --EX 18 - RESUMO EM  ORDEM DE CONSULTA COMPLETA

  SELECT colunas
  FROM tabelas
  WHERE condicao
  GROUP BY  colunas_agrupar
  HAVING condicao_agrupar
  ORDER BY colunas
  LIMIT quantidade

  SELECT cidade, COUNT(*) AS Quantidades_clientes
  FROM cliente
  WHERE cidade='limeira'
  GROUP BY  cidade
  HAVING COUNT(*) >=3
  LIMIT 5;


----parte 2 - RELACIONAMENTO ENTRE TABELAS
--USO DE JOINS
-- INNER JOIN ENTRE DUAS TABELAS
-- EX 19: PEDIDOS COM O NOME DO CLIENTE
 
 SELECT P.ID_PEDIDO ,P.DATA_PEDIDO,C.NOME AS CLIENTE, P.VALOR_TOTAL
 FROM pedido AS P 
 INNER JOIN CLIENTE AS C 
 ON C.id_cliente= P.id_cliente;
 --
  -- OBS : RELACIONE O CLIENTE CUJO ID_CLIENTE E IGUAL ID_CLIENTE GRAVADO NO PEDIDO
  -- ALIASES - SÃO COMO ATRIBUIÇÃO DE PEDIDOS PARA CONSULTAS DE VARIAS TABELAS  MAIS CURTAS E LEGIVEIS

  --LEFT JOIN - MANTEM TODOS OS REGISTROS DA TABELAS DA ESQUERDA MESMO
  -- QUANDO NAO POSSUI CORRESPONDENCIA
  -- EX20: TODOS OS CLIENTESE INCLUSIVE QUEM NUNCA COMPROU
  -- EX 20: Clientes e seus pedidos
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C 
LEFT JOIN PEDIDO AS P 
  ON P.ID_CLIENTE = C.id_cliente
ORDER BY C.NOME;

SELECT * FROM PEDIDO;


-- EX 21: Cliente sem pedido
SELECT C.ID_CLIENTE, C.NOME
FROM cliente AS C
LEFT JOIN pedido AS P
  ON P.id_cliente = C.id_cliente
WHERE P.ID_PEDIDO IS NULL;


-- JOIN COM TRÊS TABELAS
-- EX 22: Itens de pedido com nome do produto
SELECT 
    P.ID_PEDIDO, 
    PR.NOME AS PRODUTO, 
    IP.preco_unitario,
    IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM pedido AS P
INNER JOIN item_pedido AS IP
  ON IP.ID_PEDIDO = P.id_pedido
INNER JOIN PRODUTO AS PR
  ON PR.ID_PRODUTO = IP.id_produto
ORDER BY P.id_pedido;

SELECT * FROM produto;


-- EX 23: Join com Categoria - Produto e nome de sua categoria
SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIAS, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
  ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME, PR.NOME;


-- AGREGANDO DADOS
-- EX 24: Quantidade de produtos por categoria
SELECT 
    CA.NOME AS CATEGORIA, 
    COUNT(PR.ID_PRODUTO) AS QTDE_PRODUTOS
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR
  ON PR.ID_CATEGORIA = CA.id_categoria
GROUP BY CA.ID_CATEGORIA, CA.nome
ORDER BY QTDE_PRODUTOS DESC;


-- EX 25: Total comprado por cliente
SELECT 
    C.NOME AS CLIENTE, 
    COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS,
    SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C 
INNER JOIN PEDIDO AS P 
  ON P.id_cliente = C.id_cliente
WHERE P.STATUS = 'ABERTO'
GROUP BY C.id_cliente, C.nome
ORDER BY TOTAL_COMPRADO DESC;


--RELATORIO COMPLETO DO PEDIDO
-- EX 26 ; COMBINAÇÕES DE VARIAS TABELAS PARA UMA CONSULTA COMPLETA
SELECT   P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d/%m/%Y %H:%i') AS DATA, 
C.NOME AS CLIENTE, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, 
IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C 
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP 
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR 
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;
 -- OBS : DATE_FORMAT(P.DATA_PEDIDO, '%d/%m/%Y %H:%i')
 ---FORMATAÇÃO PADRAO BRASIL

--  CASE - CRIANDO CLASSIFIAÇÕES
SELECT NOME,PRECO,
CASE
WHEN PRECO < 8.00 THEN 'ECONOMICO'
WHEN PRECO <=15.00 THEN 'INTERMEDIARIO'
ELSE 'PREMIUM'
END AS CLASSIFICAÇÃO
FROM PRODUTO 
ORDER BY PRECO;

 --SUBCONSULTA
--  INSERIR UM CONSULTA DENTRO DE OUTRA CONSULTA
-- EX 27 - PRODUTOS ACIMA DO PREÇO 
SELECT NOME, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO)
FROM PRODUTO)
ORDER BY PRECO DESC;