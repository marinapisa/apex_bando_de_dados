# usar bibliotecas no python
# no começo do arquivo realizamos as importações necessárias 
# biblioteca sqlite3 que serve para manipular banco de dados do sqlite3
import sqlite3
# biblioteca OS que serve para manipukar o sistema operacional
import os

os.system('cls')

# conexão com o banco de dados:
conexao = sqlite3.connect('mydatabase.db')
print ('Conexão criada com sucesso!')


# cursor para manipukar o bando de dados
cursor = conexao.cursor()

# variavel para criar a nova tabela:
nome_tabela = ''
# OBS: True E False (valores boolean), começam com maiusculo em python
while True: 
    # ler o nome da tabela iformada pelo usuário
    nome_tabela = input ('Informe o nome da tabela: ')


    # verificar se o nome é válido
    if nome_tabela != '' and len(nome_tabela) > 3:
        print (f'Nome {nome_tabela} é válido para tabela!')
        break
    else:
        print ('Informe um nome válido!')

# Executar comandos SQL no banco de dados 
# com a função execute da biblioteca sqlite3
cursor.execute(f'''

    CREATE TABLE IF NOT EXISTS {nome_tabela} (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        idade INTEGER,
        email TEXT    
    )

 ''')

print ('Tabela criada com sucesso!!\n')

# Pedir os dados ao usuario para preencher a tabela
usuario_nome = ''
usuario_idade = 0
usuario_email = ''

while True:
    # ler dados
    # OBS: input por padrao recebe strings(textos)
    usuario_nome = input('Informe o nome do usuário: ')
    usuario_idade = input('Informe a idade so usuário: ')
    usuario_email = input('Informe o e-mail do usuário: ')

    # Converter idade para inteiro
    usuario_idade = int(usuario_idade)

    # validar os dados armazenando valores true  ou false em variaveis de validação
    validacao_um = usuario_nome != '' and len(usuario_nome) >= 3
    validacao_dois = usuario_idade > 10 and usuario_idade < 100
    validacao_tres = usuario_email != '' and '@' in usuario_email

    if validacao_um and validacao_dois and validacao_tres:
        print(f'Nome {usuario_nome}, idade {usuario_idade}, e-mail {usuario_email} são dados válidos!')
        break
    else:
        print(f'Nome é válido: {validacao_um}')
        print(f'Idade é válido: {validacao_dois}')
        print(f'E-mail é válido: {validacao_tres}')
        print('Informe dados váidos!')

# Inserir os dados na nossa base de dados
cursor.execute(f'''

    INSERT INTO {nome_tabela}(nome, idade, email)
    VALUES ('{usuario_nome}', {usuario_idade} , '{usuario_email}')

 ''')

print('Dados adicionados na tabela com sucesso!!')


        








