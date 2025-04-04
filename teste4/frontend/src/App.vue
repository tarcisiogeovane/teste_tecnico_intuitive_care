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
          <td>{{ operadora.VL_SALDO_FINAL }}</td>
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
      operadoras: []
    };
  },
  mounted() {
    axios.get('http://localhost:5000/api/top_despesas')
      .then(response => {
        console.log('Dados recebidos:', response.data); // Debug
        this.operadoras = response.data;
      })
      .catch(error => {
        console.error('Erro ao buscar dados:', error); // Debug
      });
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
</style>