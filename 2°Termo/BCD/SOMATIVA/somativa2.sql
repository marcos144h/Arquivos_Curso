CREATE  DATABASE biblioteca_som3;
---FASE 1 — DDL: CRIAÇÃO E ESTRUTURA
 USE biblioteca_som3;

 CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE   
 );
 SELECT*FROM livro


 CREATE TABLE livro (
   id_livro  INT AUTO_INCREMENT PRIMARY KEY,
   titulo VARCHAR(150)  NOT NULL,
   autor VARCHAR(120) NOT NULL,
   isbn CHAR(13) NOT NULL UNIQUE,
   ano_publicação INT,
   quantidade_disponivel INT DEFAULT 0 ,
   CHECK( quantidade_disponivel>=0)
 );

 CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolução date,
    id_usuario INT,
    id_livro INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
 );

--6.Adicione editora VARCHAR(100) à tabela LIVRO.
ALTER TABLE livro ADD COLUMN editora VARCHAR(100);

--7.Cadastre pelo menos 4 usuários; um deles deve ter telefone NULL.
 INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Ana Silva', 'ana@email.com', '19999990001',  TRUE),
('Bruno Souza', 'bruno@email.com', '19999990002',  TRUE),
('Carla Mendes', 'carla@email.com', NULL,  TRUE),
('Diego Santos', 'diego@email.com', '19999990004',  TRUE);

--8.Cadastre pelo menos 6 livros com autores, ISBNs, anos e quantidades diferentes.
 INSERT INTO livro(titulo,autor,isbn, ano_publicação,quantidade_disponivel,editora)VALUES
('os vivos', 'bruno', '1234567890124','1995','100', 'Editora A' ),
('os mortos-vivos', 'carla', '1234567890125','1996','10', 'Editora B' ),
('os mortos-vivos 2', 'diego', '1234567890126','1997','20', 'Editora C' ),
('os mortos-vivos 3', 'ana', '1234567890127','1998','10', 'Editora D' ),
('os mortos-vivos 4', 'bruno', '1234567890128','1999','10', 'Editora E' );

--9.Cadastre pelo menos 3 empréstimos ABERTOS para usuários e livros existentes.
 iNSERT INTO emprestimo (data_prevista, data_prevista, data_devolução) VALUES
('2024-07-01','2024-07-2', '2024-07-02'),
('2024-07-02','2024-07-02', '2024-07-02'),
('2024-07-03','2024-07-03', '2024-07-03);'

--10.Localize um usuário com SELECT e depois altere seu telefone com UPDATE.
SELECT * FROM usuario WHERE nome = 'Ana Silva';
UPDATE usuario SET telefone = '19999990005'
 WHERE nome = 'Ana Silva';

--Acrescente 2 exemplares a todos os livros publicados a partir de 2020.

--11 Crie e exclua um usuário sem empréstimos. Depois tente excluir um usuário que
--possua empréstimo e explique o resultado.
iNSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Evelyn Costa', 'evelyn@email.com', '19999990006',  TRUE);
DELETE FROM usuario WHERE nome = 'Evelyn Costa';

select *from usuario where nome = 'Ana Silva';
DELETE FROM usuario WHERE nome = 'Ana Silva';

--12. SELECT básico — 2 pts
--Liste título, autor e quantidade disponível de todos os livros.
SELECT titulo, autor, quantidade_disponivel FROM livro;

--13. WHERE + ORDER BY — 3 pts
--Liste livros com quantidade maior que 2, do maior para o menor estoque.
SELECT titulo, autor, quantidade_disponivel 
FROM livro WHERE quantidade_disponivel > 2 
ORDER BY quantidade_disponivel DESC;

--14Pesquise livros cujo título contenha uma palavra escolhida por você.
SELECT * FROM livro WHERE titulo LIKE '%palavra%';

--15. Listar livros publicados entre 2015 e 2025.
SELECT * FROM livro WHERE ano_publicação BETWEEN 2015 AND 2025;