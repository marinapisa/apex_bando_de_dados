-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_1_e_2\mydatabase.db

SELECT * from usuarios;



-- Selecionando o maior valor na coluna idade (MAX):
SELECT MAX(idade) from usuarios;



--  Selecionando o menor valor na coluna idade:
SELECT MIN(idade) from usuarios;



-- Selecionando a media da coluna idade usanod AVG:
-- AVG  = avarage, que é média em pt
-- AS = como, altera o nome da coluna.
select avg(idade) as media_idade from usuarios ;



--  COUNT = significa contar, e ele conta dados nas colunas
select count (*) as quantidade_usuarios from usuarios;
select count(email) from usuarios;
select count(*) from usuarios
where idade > 18;
select count(*) from usuarios
where idade < 18;

--  is not null serve para verificar linhas que possuem valor dentro
select count(email) as quantidade_final from usuarios
where email is not null;

-- inserindo valor nulo no e-mail:
insert into usuarios(nome, idade, email)
values ('marina',40,null);

select count(*) 
from usuarios
where email is null;



-- LIKE = serve para buscar palavras ou partes de palavras:
-- para usar o like precisamos usar % %
-- buscar nome com letras no meio:
select nome from usuarios
where nome like '%mari%';

-- buscar nomes que começam em A:
select nome from usuarios
where nome like 'a%';

-- buscar nomes que terminam em A:
select nome from usuarios
where nome like '%a';

