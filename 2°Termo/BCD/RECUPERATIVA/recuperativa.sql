-- active: 1794917670332@@127.0.0.1@3308@recuperacao_retrogame
drop database if exists recuperacao_retrogame;
create database if not exists recuperacao_retrogame;
use recuperacao_retrogame;

create table plataforma (
    id_plataforma int auto_increment,
    nome varchar(80) not null unique,

    constraint pk_plataforma primary key (id_plataforma)
);

create table categoria (
    id_categoria int auto_increment,
    descricao varchar(80) not null unique,

    constraint pk_categoria primary key (id_categoria)
);

create table cliente (
    id_cliente int auto_increment,
    nome varchar(100) not null,
    email varchar(120) not null default true,
    telefone varchar(20) null,
    ativo boolean default true,

    constraint pk_cliente primary key (id_cliente),
    constraint uq_email unique (email)
);

create table jogo (
    id_jogo int auto_increment,
    titulo varchar(150) not null,
    codigo varchar(15) not null unique,
    ano_lancamento int not null,
    quantidade_disponivel int default 0 check (quantidade_disponivel >=0),
    id_plataforma int,
    id_categoria int,

    constraint pk_jogo primary key (id_jogo),
    constraint fk_plataforma foreign key (id_plataforma) references plataforma (id_plataforma),
    constraint fk_categoria foreign key (id_categoria) references categoria(id_categoria)
);

create table locacao (
    id_locacao int auto_increment,
    data_retirada datetime default current_timestamp,
    data_prevista date not null,
    data_devolucao date null,
    status_locacao varchar(20) default 'aberta' check (status_locacao in ('aberta','devolvida','atrasada')),
    id_cliente int,
    id_jogo int,

    constraint pk_locacao primary key (id_locacao),
    constraint fk_cliente foreign key (id_cliente) references plataforma (id_plataforma),
    constraint fk_jogo foreign key (id_jogo) references jogo (id_jogo)
);

alter table jogo add desenvolvedora varchar(100);

insert into cliente (nome,email,telefone,ativo) values 
('marcos','marcos@gmail.com','1234567',true),
('vinicio','vincio@gmail.com','12345678',true),
('leo','leo@gmail.com','1234567',true),
('nicolas','nicolasgmaail.com',null,true);

insert into plataforma (nome) values
('pc'),
('ps4');

insert into categoria (descricao) values
('rpg'),
('ação');

insert into jogo (titulo,codigo,ano_lancamento,quantidade_disponivel) values
('zelda','jog-001',1999,1),
('gta','jog-002',2013, 8),
('mario','jog-003',2018,22),
('elden ring','jog-004',2022,10),
('sonic','jog-005',2015,30),
('gta 4','jog-006',2013,45);

insert into locacao (data_retirada,data_prevista,data_devolucao,status_locacao,id_cliente,id_jogo) values
(now(),'2026-11-17',null,'aberta',1,1),
(now(),'2026-11-17',null,'aberta',1,2),
(now(),'2026-11-17',null,'aberta',2,3);

update jogo
set quantidade_disponivel = quantidade_disponivel - 1
where id_jogo = 3;

select * from locacao;

update cliente
set telefone = '123456789'
where id_cliente = 1;

update jogo
set quantidade_disponivel = quantidade_disponivel + 2
where ano_lancamento >= 2000;

insert into cliente (nome, email, telefone, ativo) values 
('gabrielgoldenboy','gabriel goldenboy@gmail.com','123456543',true);

delete from cliente
where id_cliente = 5;

delete from cliente
where id_cliente = 1;

select titulo, ano_lancamento, quantidade_disponivel from jogo;

select * from jogo
where `quantidade_disponivel` >= 2
order by `quantidade_disponivel` desc;

select titulo
from jogo
where titulo like '%god%'

select * from jogo 
where ano_lancamento between 1990 and 2005;

select 
count(quantidade_disponivel) as total_jogo, 
sum(quantidade_disponivel) as soma_quantidade,
avg(quantidade_disponivel) as media_quantidade, 
min(quantidade_disponivel) as menor_quantidade, 
max(quantidade_disponivel) as maior_quantidade
from jogo;