from flask import Flask, jsonify
from flask_cors import CORS
import pandas as pd

app = Flask(__name__)
CORS(app)  # Permite requisições de outros domínios (ex.: localhost:8081)

@app.route('/api/top_despesas', methods=['GET'])
def get_top_despesas():
    df = pd.read_csv('C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2024.csv', 
                     sep=';', encoding='latin-1', decimal=',')
    df_filtered = df[df['DESCRICAO'] == 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTENCIA A SAUDE MEDICO HOSPITALAR ']
    top_despesas = df_filtered.groupby('REG_ANS')['VL_SALDO_FINAL'].sum().nlargest(10).reset_index()
    result = top_despesas.to_dict(orient='records')
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True, port=5000)