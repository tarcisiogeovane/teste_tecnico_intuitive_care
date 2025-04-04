<template>
  <div id="app">
    <h1>Top 10 Operadoras com Maiores Despesas (4T2024)</h1>
    <table>
      <thead>
        <tr>
          <th>Registro ANS</th>
          <th>Total Despesas</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="operadora in operadoras" :key="operadora.REG_ANS">
          <td>{{ operadora.REG_ANS }}</td>
          <td>{{ operadora.VL_SALDO_FINAL.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) }}</td>
        </tr>
      </tbody>
    </table>

    <h1>Busca de Operadoras</h1>
    <input v-model="searchQuery" @input="searchOperadoras" placeholder="Digite o nome da operadora" />
    <table>
      <thead>
        <tr>
          <th>Registro ANS</th>
          <th>Razão Social</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="resultado in searchResults" :key="resultado.registro_ans">
          <td>{{ resultado.registro_ans }}</td>
          <td>{{ resultado.razao_social }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'App',
  data() {
    return {
      operadoras: [],
      searchQuery: '',
      searchResults: []
    };
  },
  mounted() {
    this.fetchTopDespesas();
    this.searchOperadoras(); // Carrega todas as operadoras inicialmente
  },
  methods: {
    fetchTopDespesas() {
      axios.get('http://localhost:5000/api/top_despesas')
        .then(response => {
          this.operadoras = response.data;
        })
        .catch(error => {
          console.error('Erro ao buscar despesas:', error);
        });
    },
    searchOperadoras() {
      axios.get('http://localhost:5000/api/search_operadoras', { params: { q: this.searchQuery } })
        .then(response => {
          this.searchResults = response.data;
        })
        .catch(error => {
          console.error('Erro ao buscar operadoras:', error);
        });
    }
  }
};
</script>

<style>
table {
  width: 80%;
  margin: 20px auto;
  border-collapse: collapse;
}
th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}
th {
  background-color: #f2f2f2;
}
input {
  display: block;
  margin: 20px auto;
  padding: 8px;
  width: 300px;
}
</style>