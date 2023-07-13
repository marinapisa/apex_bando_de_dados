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
        print(f'Coluna {indice}:{coluna_string}')
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
    print(retorno)



def contar_linhas_coluna(coluna_nome):
    """ Função para contar a coluna informada pelo usuário """     
    # Comando SQL
    sql_string = f'select count({coluna_nome}) from usuarios'

    # Executar o SQL
    retorno = executar_comandos_sql(sql_string)

    # Mostrar o resultado
    print(retorno)

def buscar_palavra_em_colunas():
    """ Função para buscar paravras chaves usando o LIKE """
    #  Criar a string com o padrão da palavra que que será buscada

    #  Comando SQL

    #  executar o SQL

    # Mostrar o resultado

def retorna_min_max_coluna():
    """ Função para retornar valor mínimo e máximo das colunas """
    #  Comando SQL

    #  executar o SQL

    # Mostrar o resultado

# START
os.system('cls')
# retorno = executar_comandos_sql('Select * from usuarios')
# print(retorno)
# mostrar_opcoes(['name', 'age', 'email'])
# retorna_media_coluna ('idade')
contar_linhas_coluna ('idade')


