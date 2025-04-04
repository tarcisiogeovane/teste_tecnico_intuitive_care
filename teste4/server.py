from flask import Flask, jsonify, request
from flask_cors import CORS
import pandas as pd

app = Flask(__name__)
CORS(app)  # Permite requisições do frontend Vue.js, evitando bloqueios

# Carrega os dados uma vez no início
operadoras_df = pd.read_csv('C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/operadoras_ativas.csv', 
                            sep=';', encoding='latin-1')

@app.route('/api/top_despesas', methods=['GET'])
def get_top_despesas():
    df = pd.read_csv('C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2024.csv', 
                     sep=';', encoding='latin-1', decimal=',')
    df_filtered = df[df['DESCRICAO'] == 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTENCIA A SAUDE MEDICO HOSPITALAR ']
    top_despesas = df_filtered.groupby('REG_ANS')['VL_SALDO_FINAL'].sum().nlargest(10).reset_index()
    result = top_despesas.to_dict(orient='records')
    return jsonify(result)

@app.route('/api/search_operadoras', methods=['GET'])
def search_operadoras():
    query = request.args.get('q', '')  # Pega o parâmetro 'q' da URL
    if not query:
        return jsonify(operadoras_df.to_dict(orient='records'))  # Retorna tudo se não houver busca
    # Busca textual em razao_social (tanto faz maiúsculo ou não)
    filtered_df = operadoras_df[operadoras_df['Razao_Social'].str.contains(query, case=False, na=False)]
    # Limita a 10 resultados mais relevantes
    result = filtered_df.head(10).to_dict(orient='records')
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True, port=5000)