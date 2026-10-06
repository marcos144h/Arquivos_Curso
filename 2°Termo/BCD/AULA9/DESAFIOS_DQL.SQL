-- 1. Liste todos os clientes cadastrados.
SELECT *
FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.

SELECT * FROM produto
ORDER BY PRECO ASC;

--6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

--7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome,cidade
FROM cliente
WHERE cidade = 'limeira' OR cidade='americana';

--8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome
FROM produto
WHERE nome LIKE '%Café%';