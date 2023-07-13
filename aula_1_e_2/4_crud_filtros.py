import sqlite3
import os
import pandas as pd # as pd para usar apenas PD para usar o pandas

#  instalar o pandas na maquina local com o cmd 'pip install pandas' enter

# def para criar função DEF = FUNCTION

def executar_comandos_sql(sql_string):
    """ Primeira docstring: Função para executar comandos sql na base de dados usando pandas """ #é pra ser um comentário acho
    # Criar a conexão com o banco de dados
    conexao = sqlite3.connect('mydatabase.db')

    # Usar função do pandas chamada: read_sql_query, ele executa sql e espera como parametros uma string
    # com o sql a ser executado, e tbm espera a conexão com  a base de dados
    retorno_do_sql = pd.read_sql_query(sql_string, conexao)

    #  fechar a conexão
    conexao.close()

    # retornar os dados do query (ou seja, da busca sql)
    return retorno_do_sql



def mostrar_opcoes(colunas_lista):
    """ Função para mostrar as opções disponpiveis do programa para o usuário """
    # Printar os dados usando um for na lista com as colunas disponíveis
    print('Colunas disponíveis: ')
    for indice, coluna_string in enumerate(colunas_lista): # enumerate permite q seja possvel 
        # rodar o for com duas variaveis, uma sendo o indice (I) da linha e a outra 
        # sendo o valr (dado/informação)
        # para pegar o item e a posição do item tbm
        print(f'Coluna {indice+1}:{coluna_string}')
        # coluna 0 : nome
        # coluna 1 : idade
        # coluna 2 : email
        # mostrar_opcoes(['name', 'age', 'email']) exemplo de como chamar e ver essa function rodando
    print() # para o programa nao ficar grudado


def retorna_media_coluna(coluna_nome):
    """ Função para retornar média de uma coluna informada pelo usuário """
    #  Comando SQL
    sql_string = f'select avg({coluna_nome}) from usuarios'

    # Executar o SQL
    retorno = executar_comandos_sql(sql_string)

    # Mostrar o resultado
    print ('\n')
    print ('MEDIA: ')
    print(retorno)



def contar_linhas_coluna(coluna_nome):
    """ Função para contar a coluna informada pelo usuário """     
    # Comando SQL
    sql_string = f'select count({coluna_nome}) from usuarios'

    # Executar o SQL
    retorno = executar_comandos_sql(sql_string)

    # Mostrar o resultado
    print ('\n')
    print ('COUNT: ')
    print(retorno)



def buscar_palavra_em_colunas(nome_coluna, tipo_busca, string_usuario):
    """ Função para buscar paravras chaves usando o LIKE """
    #  Criar a string com o padrão da palavra que que será buscada
    string_de_busca = ''
    if tipo_busca == 'start':
        string_de_busca = f"'{string_usuario}%'"
    elif tipo_busca == 'end':
        string_de_busca = f"'%{string_usuario}'"
    elif tipo_busca == 'middle':
        string_de_busca = f"'%{string_usuario}%'"
    else:
        print('Tipo de busca é inválido!')

    #  Comando SQL
    sql_string = f"""

        select * from usuarios\
        where {nome_coluna} LIKE {string_de_busca} 
   
     """

    #  executar o SQL
    retorno = executar_comandos_sql(sql_string)

    # Mostrar o resultado
    print ('\n')
    print ('LIKE: ')
    print(retorno)

def retorna_min_max_coluna(coluna_nome):
    """ Função para retornar valor mínimo e máximo das colunas """
    #  Comando SQL
    sql_string = f'select max({coluna_nome}), min({coluna_nome}) from usuarios'

    #  executar o SQL
    retorno = executar_comandos_sql(sql_string)

    # Mostrar o resultado
    print ('\n')
    print ('MIN / MAX: ')
    print(retorno)

# START
os.system('cls')
# retorno = executar_comandos_sql('Select * from usuarios')
# print(retorno)
# mostrar_opcoes(['name', 'age', 'email'])
# retorna_media_coluna ('idade')
# contar_linhas_coluna ('idade')
# buscar_palavra_em_colunas('nome','start','f')
# retorna_min_max_coluna('idade')




# CRIAR O SISTEMA:

# usando o pragma table_info() para buscar informações sobre a tabela usuário
sql_retorno_colunas = 'PRAGMA table_info(usuarios)' # mesma coisa q um select * from

# executando o SQL
colunas = executar_comandos_sql (sql_retorno_colunas)

# SEPARANDO APENAS AS COLUNAS DO RETORNO SQL
# print(colunas) o nome das colunas que tem as informações é 'name'
colunas_lista = colunas['name'].tolist() # transforma dados em lista

#  variavel contador que vai contar quantas operações no bando de dados foram realizadas
contador = 0

print(colunas_lista)

rodar_programa = True
while rodar_programa is True:
    mostrar_opcoes(colunas_lista)
    print('digite S para sair\n')

    coluna_posicao = input('Informe a posição da coluna a manipular: ')

    if coluna_posicao == 's':
        break

    # converter o valor para inteiro:  
    coluna_posicao = int(coluna_posicao)

    # validar a posição informada:
    if coluna_posicao > 0 and coluna_posicao <= len(colunas_lista):
        # criar a variavel para o nome da coluna
        # extrair o nome da coluna da lista de colunas usando a posição iformada
        coluna_nome = colunas_lista[coluna_posicao-1]
        print(f'Coluna {coluna_nome} selecionada com sucesso!')

        menu_operacoes = f'\n1 - Média'
        menu_operacoes += f'\n2 - count'
        menu_operacoes += f'\n3 - Busca usanod like'
        menu_operacoes += f'\n4 - min / max'
        menu_operacoes += f'\nInforme a operação: '

        operacao = int(input(menu_operacoes)) # como ja esta esperando somente numero ja pode colocar o int aq

        if operacao == 1:
            # chamar a função que retorna a média
            retorna_media_coluna(coluna_nome)
        elif operacao == 2:
            # chamar a função que conta linhas coluna
            contar_linhas_coluna(coluna_nome)
        elif operacao == 3:
            # Criar o menu para o input:
            menu_input = '\nstart'
            menu_input += '\nmiddle'
            menu_input += '\nend'
            menu_input += '\nInforme a opção: '

            # usar o int para transformar a busca em um número:
            tipo_busca = input(menu_input)

            # ler a string que será usada para buscar no banco de dados
            string_usuario = input('\nInforme a string que irá para busca no banco: ')

            # chamar a função para buscar a string_usuario, passando os parametros informados
            buscar_palavra_em_colunas(coluna_nome, tipo_busca, string_usuario)

        elif operacao == 4:
            #  Retornar o menor e o maior valor da coluna
            retorna_min_max_coluna(coluna_nome)
        else:
            print('\nFoi informado uma operação inválida')
    else:
        print('\nInforme uma posição Válida!')





    # break


