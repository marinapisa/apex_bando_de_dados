-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_1_e_2\mydatabase.db

-- Use the ▷ button in the top right corner to run the entire file.

--1- criar uma tabela
-- PRIMARY KEY;
-- auto incrementa o valor que esta no campo
-- força o campo a não ter valor nulo
-- garantir que cada usuário (linha) tenha um valor único

--IF NOT EXISTS:
-- ele garante que a tabela apenas será criada caso uma tabela 
--com o nome 'usuarioss' não exista. ou seja garante q ela só 
--vai ser criada se ela nao existir

CREATE TABLE  IF NOT EXISTS usuarios (
    --cAMPO DO TIPO INTEIRO, COM CHAVE PRIMARIA (nr_sequence)
    id INTEGER PRIMARY KEY,
    -- TEXT é usado para campos do tipo string
    nome TEXT(100),
    -- INTEGER é usado para campos com números inteiros
    idade INTEGER,
    -- o último campo não leva a virgula
    email TEXT(100)
);

-- 2 - Inserindo os dados na tabela criada:
-- INSERT INTO é o comando SQL para inserir dados nas tabelas

INSERT INTO usuarios(nome, idade, email)
-- é seguido pela palavra VALUES que armazena os valores nas colunas
VALUES ('Bryan', 25, 'bryan@gmail.com');

INSERT INTO usuarios(nome, idade, email)
VALUES ('Marina', 28, 'marina@gmail.com');

INSERT INTO usuarios(nome, idade, email)
VALUES ('Clarice', 6, 'clarice@gmail.com');

INSERT INTO usuarios(nome, idade, email)
VALUES ('Júlia', 26, 'julia@gmail.com');

INSERT INTO usuarios(nome, idade, email)
VALUES ('Fábio', 32, 'fabio@gmail.com');

-- 3 - Alterando tabelas
-- ALTER TABLES é usando para alterar tabelas
-- RENAME TO que renomeia a tabela

ALTER TABLE usuarioss
RENAME TO usuarios;

-- Inserindo uma coluna
-- ADD COLUMN adiciona uma coluna
ALTER TABLE usuarios
ADD COLUMN coluna_nova;

-- DROP COLUMN remove coluna
ALTER TABLE usuarios
DROP COLUMN coluna_nova;

-- 4 Resetando tabelas
-- DELETE FROM deleta tds os dados da tabela senão for 
-- passado uma condição específica
--VACUUM - vai zerar o primary key
DELETE FROM usuarios;
VACUUM usuarios;

-- 5 Destruindo tabelas:
DROP TABLE usuarios;


