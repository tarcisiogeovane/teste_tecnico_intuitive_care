import pdfplumber # Para extrair tabelas de PDFs
import pandas as pd # Para manipular os dados
import os
from zipfile import ZipFile

def extract_and_transform_data(pdf_path, output_csv, output_zip, user_name):
    try:
        # 2.1 Extração dos dados do PDF (todas as páginas)
        print(f"Extraindo dados do PDF: {pdf_path}")
        all_tables = []
        with pdfplumber.open(pdf_path) as pdf:
            for page in pdf.pages:
                # Extrai tabelas de cada página
                tables = page.extract_tables()
                for table in tables:
                    if table:  # Ignora tabelas vazias
                        all_tables.append(table)

        if not all_tables:
            raise Exception("Nenhuma tabela encontrada no PDF!")

        # Converte as tabelas em um DataFrame do pandas
        # Assume que a primeira linha de cada tabela é o cabeçalho
        headers = all_tables[0][0]  # Pega o cabeçalho da primeira tabela
        data_rows = []
        for table in all_tables[1:]:  # Pula o cabeçalho da primeira tabela
            for row in table:
                if len(row) == len(headers):  # Garante que a linha tem o mesmo tamanho do cabeçalho
                    data_rows.append(row)

        df = pd.DataFrame(data_rows, columns=headers)
        
        # 2.4 Substitui abreviações OD e AMB pelas descrições completas
        # Conforme legenda comum em rodapés: OD = Odontológico, AMB = Ambulatorial
        column_mapping = {
            'OD': 'Odontológico',
            'AMB': 'Ambulatorial'
        }
        df.rename(columns=column_mapping, inplace=True)

        # 2.2 Salva os dados em CSV
        print(f"Salvando dados em: {output_csv}")
        df.to_csv(output_csv, index=False, encoding='utf-8-sig')  # utf-8-sig para suportar acentos no Windows

        # 2.3 Compacta o CSV em um ZIP
        zip_filename = output_zip.format(user_name=user_name)
        print(f"Compactando em: {zip_filename}")
        with ZipFile(zip_filename, 'w') as zipf:
            zipf.write(output_csv, os.path.basename(output_csv))
        
        # Remove o CSV após compactar (opcional)
        os.remove(output_csv)
        print(f"Processo concluído! Arquivo final: {zip_filename}")

    except Exception as e:
        print(f"Erro durante o processo: {str(e)}")

if __name__ == "__main__":
    # Configurações
    pdf_path = "anexos_rol_procedimentos/Anexo_I_Rol_2021RN_465.2021_RN_470_RN_480_RN_513_RN_536_RN_537.pdf"  # Ajuste o nome do PDF conforme gerado no Teste 1
    output_csv = "rol_procedimentos.csv"
    output_zip = "Teste_{}.zip"
    user_name = "Tarcila"  # Substitua pelo seu nome

    # Verifica se o PDF existe
    if not os.path.exists(pdf_path):
        print(f"Erro: O arquivo {pdf_path} não foi encontrado. Certifique-se de que o Teste 1 foi executado.")
    else:
        extract_and_transform_data(pdf_path, output_csv, output_zip, user_name)