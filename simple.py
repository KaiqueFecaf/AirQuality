import requests
import mysql.connector
from datetime import datetime

# Conectar ao banco de dados MySQL
conn = mysql.connector.connect(
    host='localhost',
    user='root',  # usuário MySQL
    password='root',  # senha MySQL
    database='qualidade_do_ar'
)
cursor = conn.cursor()

# Função para obter dados da API CETESB
def obter_dados_cetesb():
    url = "CHAVE DA URL PESSOAL DA CETESB"  # Insira a URL correta da API da CETESB quando for testar por motivos de seguranca e nao ter a sua chave d a API vazada
    response = requests.get(url)
    dados = response.json()  # Supondo que a resposta seja em JSON
    return dados

# Função para inserir os dados no banco
def inserir_dados(municipio, poluente, valor, data, hora):
    # Verificar se o município existe
    cursor.execute("SELECT id FROM municipios WHERE nome = %s", (municipio,))
    municipio_id = cursor.fetchone()
    if not municipio_id:
        cursor.execute("INSERT INTO municipios (nome) VALUES (%s)", (municipio,))
        municipio_id = cursor.lastrowid
    else:
        municipio_id = municipio_id[0]

    # Verificar se o poluente existe
    cursor.execute("SELECT id FROM poluentes WHERE nome = %s", (poluente,))
    poluente_id = cursor.fetchone()
    if not poluente_id:
        cursor.execute("INSERT INTO poluentes (nome) VALUES (%s)", (poluente,))
        poluente_id = cursor.lastrowid
    else:
        poluente_id = poluente_id[0]

    # Inserir os dados de qualidade do ar
    cursor.execute("""
        INSERT INTO qualidade_do_ar (municipio_id, poluente_id, valor, data, hora) 
        VALUES (%s, %s, %s, %s, %s)
    """, (municipio_id, poluente_id, valor, data, hora))
    conn.commit()

# Obter dados da API e inserir no banco
dados = obter_dados_cetesb()
for item in dados:
    municipio = item['municipio']
    poluente = item['poluente']
    valor = item['valor']
    data = datetime.strptime(item['data'], "%Y-%m-%d").date()
    hora = datetime.strptime(item['hora'], "%H:%M:%S").time()

    inserir_dados(municipio, poluente, valor, data, hora)

print("Dados inseridos com sucesso!")

# Fechar a conexão com o banco
cursor.close()
conn.close()
