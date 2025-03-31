import requests # requests para realizar o acesso web
from bs4 import BeautifulSoup # BeautifulSoup para "parsing" HTML, encontrar os links dos PDFs 
import os #vamos usar o módulo 'os' para obter o caminho absoluto do diretório desejado
from zipfile import ZipFile # ZipFile para compactação
import tkinter as tk
from tkinter import messagebox, ttk
import threading

class ANSScraperApp:
    def __init__(self, root):
        self.root = root
        self.root.title("ANS Anexos Downloader")
        self.root.geometry("400x300")
        self.root.resizable(False, False)

        # Estilo
        self.root.configure(bg="#f0f0f0")
        self.label = tk.Label(root, text="Baixar Anexos do Rol de Procedimentos", 
                             font=("Arial", 14, "bold"), bg="#f0f0f0")
        self.label.pack(pady=20)

        # Botão para iniciar
        self.start_button = ttk.Button(root, text="Iniciar Download", command=self.start_scraping_thread)
        self.start_button.pack(pady=10)

        # Área de status
        self.status_text = tk.Text(root, height=10, width=50, font=("Arial", 10))
        self.status_text.pack(pady=10)
        self.status_text.insert(tk.END, "Pronto para começar...\n")

        # Botão para sair
        self.exit_button = ttk.Button(root, text="Sair", command=root.quit)
        self.exit_button.pack(pady=10)

        # Define o diretório do script como base
        self.base_dir = os.path.dirname(os.path.abspath(__file__))

    def log(self, message):
        self.status_text.insert(tk.END, message + "\n")
        self.status_text.see(tk.END)
        self.root.update()

    def start_scraping_thread(self):
        # Desativa o botão enquanto executa
        self.start_button.config(state="disabled")
        self.log("Iniciando processo...")
        # Usa thread para não travar a interface
        thread = threading.Thread(target=self.scrape_and_zip)
        thread.start()

    def scrape_and_zip(self):
        url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
        
        try:
            # Acesso ao site
            headers = {'User-Agent': 'Mozilla/5.0'}
            self.log("Acessando o site...")
            response = requests.get(url, headers=headers)
            response.raise_for_status()

            # Parsing do HTML
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Download dos Anexos I e II
            # Procurando links que contenham "Anexo" no texto
            pdf_links = []
            for link in soup.find_all('a', href=True):
                if 'anexo' in link.text.lower() and '.pdf' in link['href'].lower():
                    pdf_url = link['href']
                    # Se o link for relativo, converte para absoluto
                    if not pdf_url.startswith('http'):
                        pdf_url = f"https://www.gov.br{pdf_url}"
                    pdf_links.append(pdf_url)
            
            # Caso nenhum PDF com "Anexo" tenha sido encontrado
            if not pdf_links:
                self.log("Nenhum anexo encontrado!")
                raise Exception("Nenhum PDF detectado.")

            # Download dos PDFs
            downloaded_files = []
            for pdf_url in pdf_links:
                self.log(f"Baixando: {pdf_url.split('/')[-1]}")
                pdf_response = requests.get(pdf_url, headers=headers)
                pdf_response.raise_for_status()
                filename = os.path.join(self.base_dir, pdf_url.split('/')[-1])
                with open(filename, 'wb') as f:
                    f.write(pdf_response.content)
                downloaded_files.append(filename)

            # Compactação e Definição do caminho completo do ZIP na mesma pasta do script
            zip_filename = os.path.join(self.base_dir, "anexos_rol_procedimentos.zip")
            with ZipFile(zip_filename, 'w') as zipf:
                for file in downloaded_files:
                    zipf.write(file, os.path.basename(file))  # Usa apenas o nome do arquivo no ZIP
                    # Remover arquivos após zipar
                    os.remove(file)
            self.log(f"Sucesso! Arquivos salvos em: {zip_filename}")

            messagebox.showinfo("Concluído", f"Download e compactação concluídos!\nArquivo: {zip_filename}")

        except Exception as e:
            self.log(f"Erro: {str(e)}")
            messagebox.showerror("Erro", f"Ocorreu um erro:\n{str(e)}")
        
        finally:
            self.start_button.config(state="normal")

if __name__ == "__main__":
    root = tk.Tk()
    app = ANSScraperApp(root)
    root.mainloop()