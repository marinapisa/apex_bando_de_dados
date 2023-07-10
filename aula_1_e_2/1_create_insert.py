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

cursor.execute(f'''

    CREATE TABLE IF NOT EXISTS {nome_tabela} (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        idade INTEGER,
        email TEXT    
    )

 ''')

print ('Tabela criada com sucesso!!')


