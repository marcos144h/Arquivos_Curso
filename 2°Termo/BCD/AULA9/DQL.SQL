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

  