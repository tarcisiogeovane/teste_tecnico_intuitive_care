# Teste 2: Transformação de Dados

Este projeto contém a solução para o **Teste 2** do teste técnico da Intuitive Care. O programa extrai dados da tabela "Rol de Procedimentos e Eventos em Saúde" do PDF do Anexo I, transforma-os em uma tabela estruturada em formato CSV, substitui abreviações (OD e AMB) por descrições completas e compacta o resultado em um arquivo ZIP.

## Descrição
O programa foi desenvolvido em Python com uma interface gráfica (GUI) usando `tkinter`. Ele:
1. Extrai dados do PDF do Anexo I (gerado no Teste 1).
2. Salva os dados em um arquivo CSV (`rol_procedimentos.csv`).
3. Substitui as colunas "OD" por "Odontológico" e "AMB" por "Ambulatorial".
4. Compacta o CSV em um arquivo ZIP nomeado como `Teste_[Seu_Nome].zip`.

## Como Usar

### Para Usuários Finais
Se você quer apenas usar o programa sem mexer no código, siga estas instruções:

1. **Baixe o Executável:**
   - Vá até a pasta `releases` ou a seção "Releases" deste repositório no GitHub.
   - Baixe o arquivo `teste2_data_transform_gui.exe`.

2. **Execute o Programa:**
   - Coloque o `.exe` em uma pasta no seu computador (ex.: Desktop).
   - Clique duas vezes no arquivo para abrir a interface gráfica.

3. **Use a Interface:**
   - Clique em "Selecionar" e escolha o PDF do Anexo I (ex.: `Anexo_I_Rol_2021RN_465.2021_...pdf`).
   - No campo "Seu Nome", insira seu nome (ex.: "Tarcila").
   - Clique em "Iniciar Transformação".
   - Acompanhe o progresso na área de status. Quando terminar, um pop-up confirmará o sucesso.

4. **Resultado:**
   - O arquivo `Teste_[Seu_Nome].zip` (ex.: `Teste_Tarcisio.zip`) será criado na mesma pasta do `.exe`.
--------------------------------------------------------------------------------------------------------------
### Para Desenvolvedores
Se você quer rodar ou modificar o código-fonte, siga estas instruções:

1. **Pré-requisitos:**
   - Python 3.x instalado (recomendado: 3.8 ou superior).
   - Instale as dependências necessárias:
     ```bash
     pip install pdfplumber pandas
     
2. **Baixe o Código:**
   - Clone este repositório ou baixe o arquivo teste2_data_transform_gui.py da pasta principal.
     
3. **Execute o Script:**
   - Abra o terminal na pasta onde o arquivo está:
     ```bash
     cd caminho/para/teste2
     python teste2_data_transform_gui.py
    - Siga os mesmos passos da interface descritos acima.
  
4. **Modificações:**
   - O código está comentado e estruturado para fácil entendimento. Ajuste conforme necessário (ex.: mudar o nome padrão no campo "Seu Nome").
