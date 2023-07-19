-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_3_e_4\mydatabase.db

--  Criar tabela usuarios com mesmas colunas que prograadores
-- inserir 10 linhas com dados validos
CREATE TABLE IF NOT EXISTS usuarios(
    id INTEGER PRIMARY KEY,
    nome_usu text (40),
    idade_usu integer,
    email_usu TEXT(40),
    tipo_conta_usu TEXT (40),
    sal_usu double
);

INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Marina', 28, 'marinaps21@gmail.com', 'free', 5.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Elaine', 48, 'elaine@gmail.com', 'premium', 5.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Clarice', 13, 'marinaps21@gmail.com', 'Ouro', 5.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Isaias', 53, 'pisaiasias@gmail.com', 'Prata', 15.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Leandro', 32, 'leandro@gmail.com', 'free', 8.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('David', 40, 'david@gmail.com', 'premium', 9.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Cristiano', 56, 'cristiano@gmail.com', 'free', 53.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Mariana', 27, 'marinaps21@gmail.com', 'free', 5.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Marilia', 22, 'marilia@gmail.com', 'premium', 45.000);
INSERT INTO usuarios (nome_usu, idade_usu, email_usu, tipo_conta_usu, sal_usu)
values ('Anderson', 68, 'andy@gmail.com', 'free', 45.000);

-- obter uma lista dos programadores juntamente com os usuarios
-- correspondentes com base em seus endereços de email

select programadores.nome as nome_programador, 
usuarios.nome_usu as nome_usuario,
programadores.email as email_bateu
from programadores 
inner join usuarios
on programadores.email = usuarios.email_usu;

--  O INNER JOIN É UTILIZADO PARA COMBINAR AS TABELAS 
-- OU SEJA MOSTRAR OS DADOS DE AMBAS COM FILTROS
-- COM BASE NA COLUNA INFORMADA DEPOIS DO 'ON'

-- Realizando o mesmo com a idade:

SELECT programadores.idade as idade_programador,
usuarios.idade_usu as idade_usuario,
programadores.nome as nome_programador,
usuarios.nome_usu as nome_usuario
from programadores
inner join usuarios
on programadores.idade = usuarios.idade_usu;

select a.idade, b.idade_usu, a.nome, b.nome_usu
from programadores a,
     usuarios b
where a.idade = b.idade_usu;

SELECT a.salario, b.sal_usu, a.nome, b.nome_usu
from    programadores a,
        usuarios b
where a.salario = b.sal_usu
order by nome desc;

-- update usuarios
-- set sal_usu = 5.799
-- where id > 7;

select programadores.nome as nome_programador,
usuarios.nome_usu as nome_usuario,
programadores.email as email_prog
from programadores
left join usuarios
on programadores.email = usuarios.email_usu;

-- |--- EX 2 ---|
-- Criar tabela Contatos com mesmas colunas que Usuarios + coluna telefone (e outras se desejado)
-- Insira 20 linhas na tabela Contatos e repita o exercícios anterior
-- trocando a tabela usuarios pela tabela contatos*

-- Criar tabela Contatos:

CREATE TABLE IF NOT EXISTS contatos (
    id INTEGER PRIMARY KEY,
    nome_ctt text (40),
    idade_ctt integer,
    email_ctt TEXT(40),
    tipo_conta_ctt TEXT (40),
    sal_ctt double,
    telefone_ctt integer
);

-- Inserir dados em contatos:

INSERT INTO contatos (nome_ctt, idade_ctt, email_ctt, tipo_conta_ctt, sal_ctt, telefone_ctt) VALUES
    ('Marina', 28, 'marinaps21@gmail.com', 'free', 5.000, 47997774209),
    ('João', 25, 'joao@email.com', 'Normal', 2500.00, 11999892629),
    ('Maria', 30, 'maria@email.com', 'Premium', 3500.00, 47884539900),
    ('Pedro', 22, 'pedro@email.com', 'Normal', 2000.00, 47884588900),
    ('Ana', 28, 'ana@email.com', 'Premium', 4000.00, 55984539900),
    ('Carlos', 35, 'carlos@email.com', 'Normal', 2800.00, 47884539955),
    ('Lúcia', 27, 'lucia@email.com', 'Premium', 4500.00, 47884536600),
    ('Fernando', 29, 'fernando@email.com', 'Normal', 2300.00, 31884539900),
    ('Sofia', 31, 'sofia@email.com', 'Premium', 5000.00, 47884459900),
    ('Mário', 26, 'mario@email.com', 'Normal', 2600.00, 47664539900),
    ('Laura', 33, 'laura@email.com', 'Premium', 3800.00, 47884533300);

    -- repetir exercicios acima com left e inner join
    -- trocando a tabela Usuariospo Contatos recem criada

-- INNER JOIN:
SELECT programadores.idade as idade_programador,
contatos.idade_ctt as idade_contato,
programadores.nome as nome_programador,
contatos.nome_ctt as nome_contato
from programadores
inner join contatos
on programadores.idade = contatos.idade_ctt;

-- LEFT JOIN:
select programadores.nome as nome_programador,
contatos.nome_ctt as nome_contato,
programadores.email as email_prog
from programadores
left join contatos
on programadores.email = contatos.email_ctt;



