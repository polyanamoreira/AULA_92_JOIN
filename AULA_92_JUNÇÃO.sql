-- CRIAÇÃO DE BANCO DE DADOS.
create database ibge;

-- ATIVAR O BANCO DE DADOS "IBGE"
use ibge;
 
-- CRIAÇÃO DA TABELA "UNIDADES_FEDERATIVAS" 
create table unidades_federativas (
cod_uf int,
uf char(2),
nome_uf varchar(30),
primary key (cod_uf)
); 

-- CRIAÇÃO DA TABELA "MUNICIPIOS" 
-- RELACIONANDO COM A TABELA "UNIDADES_FEDERATIVAS"
create table municipios (
cod_municipio int,
cod_uf int,
nome_municipio varchar(40),
populacao int,
FOREIGN KEY (cod_uf) REFERENCES
unidades_federativas(cod_uf)
);

-- Listar todos os municípios e suas unidades federativas.
SELECT m.nome_municipio, u.nome_uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf;

-- Listar os municípios com sua população e a sigla da unidade
SELECT m.nome_municipio, m.populacao, u.uf as sigla_uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf;

-- Listar os municípios e suas unidades federativas, ordenando pelo nome do município
SELECT m.nome_municipio, u.nome_uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf
order by m.nome_municipio;

-- Listar os municípios que possuem uma população superior a 100.000 habitantes
-- juntamente com a sigla da unidade federativa
SELECT m.nome_municipio, m.populacao, u.uf 
 FROM municipioS m 
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf
 WHERE m.populacao  > 100000 ;
 
 -- Listar os municípios que têm o mesmo nome 
 -- que sua respectiva unidade federativa
select m.cod_municipio,m.cod_uf,m.nome_municipio,m.populacao,u.nome_uf
from municipios m
join unidades_federativas u on m.cod_uf = u.cod_uf
where m.nome_municipio = u.nome_uf;

-- Calcular a média de população dos municípios 
-- para cada unidade federativa
select u.nome_uf, avg(m.populacao) as media_populacao
from municipios m 
inner join unidades_federativas u on m.cod_uf = u.cod_uf
group by u.uf;

-- Listar os municípios que têm uma população
-- maior que a média da população de todos os municípios
select * from municipios m
where populacao > (select avg(m.populacao) as media_populcao 
from municipios m);

-- Desafio 
SELECT u.nome_uf, count(*) as quantidade_municipios
from municipios m 
inner join unidades_federativas u on m.cod_uf = u.cod_uf
group by u.uf; 

 






























