import requests # Requests para acesso web
from bs4 import BeautifulSoup # BeautifulSoup para parsing HTML 
import os
from zipfile import ZipFile # Zipfile para compactação

def download_and_zip_annexes():
    # URL alvo
    url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
    
    try:
        # 1.1 Acesso ao site
        headers = {'User-Agent': 'Mozilla/5.0'}
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        
        # Parsing do HTML
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # 1.2 Download dos Anexos I e II
        # Procurando links que contenham "Anexo" no texto
        pdf_links = []
        for link in soup.find_all('a', href=True):
            if 'anexo' in link.text.lower() and '.pdf' in link['href'].lower():
                pdf_url = link['href']
                # Se o link for relativo, converte para absoluto
                if not pdf_url.startswith('http'):
                    pdf_url = f"https://www.gov.br{pdf_url}"
                pdf_links.append(pdf_url)
        
        # Baixando os PDFs
        downloaded_files = []
        for pdf_url in pdf_links:
            pdf_response = requests.get(pdf_url, headers=headers)
            pdf_response.raise_for_status()
            
            # Extraindo nome do arquivo do URL
            filename = pdf_url.split('/')[-1]
            with open(filename, 'wb') as f:
                f.write(pdf_response.content)
            downloaded_files.append(filename)
            print(f"Baixado: {filename}")
        
        # 1.3 Compactação em ZIP
        zip_filename = "anexos_rol_procedimentos.zip"
        with ZipFile(zip_filename, 'w') as zipf:
            for file in downloaded_files:
                zipf.write(file)
                # Opcional: remover arquivos após zipar
                os.remove(file)
        
        print(f"Arquivos compactados em: {zip_filename}")
        
    except requests.RequestException as e:
        print(f"Erro ao acessar o site ou baixar arquivos: {e}")
    except Exception as e:
        print(f"Erro durante a execução: {e}")

if __name__ == "__main__":
    download_and_zip_annexes()