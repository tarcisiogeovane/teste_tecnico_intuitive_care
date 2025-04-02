import pdfplumber # Para extrair tabelas de PDFs
import pandas as pd # Para manipular os dados
import os
from zipfile import ZipFile
import tkinter as tk
from tkinter import filedialog, messagebox, ttk
import threading


# Criação da Interface
class DataTransformApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Transformação de Dados - Teste 2")
        self.root.geometry("500x400")
        self.root.resizable(False, False)

        # Estilo da janela
        self.root.configure(bg="#f0f0f0")
        self.label = tk.Label(root, text="Transformar Dados do Anexo I", 
                             font=("Arial", 14, "bold"), bg="#f0f0f0")
        self.label.pack(pady=10)

        # Campo para selecionar o PDF
        self.pdf_path = tk.StringVar() # Variável para armazenar o caminho do PDF
        self.pdf_frame = tk.Frame(root, bg="#f0f0f0")
        self.pdf_frame.pack(pady=5)
        tk.Label(self.pdf_frame, text="Arquivo PDF:", font=("Arial", 10), bg="#f0f0f0").pack(side=tk.LEFT)
        self.pdf_entry = tk.Entry(self.pdf_frame, textvariable=self.pdf_path, width=40)
        self.pdf_entry.pack(side=tk.LEFT, padx=5)
        self.browse_button = ttk.Button(self.pdf_frame, text="Selecionar", command=self.browse_pdf)
        self.browse_button.pack(side=tk.LEFT)

        # Campo para o nome do usuário
        self.user_name = tk.StringVar(value="Tarcisio")  # Valor padrão
        self.name_frame = tk.Frame(root, bg="#f0f0f0")
        self.name_frame.pack(pady=5)
        tk.Label(self.name_frame, text="Seu Nome:", font=("Arial", 10), bg="#f0f0f0").pack(side=tk.LEFT)
        self.name_entry = tk.Entry(self.name_frame, textvariable=self.user_name, width=20)
        self.name_entry.pack(side=tk.LEFT, padx=5)

        # Botão para iniciar o processo
        self.start_button = ttk.Button(root, text="Iniciar Transformação", command=self.start_transform_thread)
        self.start_button.pack(pady=10)

        # Área de status
        self.status_text = tk.Text(root, height=12, width=60, font=("Arial", 10))
        self.status_text.pack(pady=10)
        self.status_text.insert(tk.END, "Pronto para começar...\n")

        # Botão para sair
        self.exit_button = ttk.Button(root, text="Sair", command=root.quit)
        self.exit_button.pack(pady=10)

    def log(self, message):
        # Adiciona mensagens ao campo de status 
        self.status_text.insert(tk.END, message + "\n")
        self.status_text.see(tk.END)
        self.root.update()

    def browse_pdf(self):
        # Abre um diálogo para selecionar o arquivo PDF
        file_path = filedialog.askopenfilename(filetypes=[("PDF files", "*.pdf")])
        if file_path:
            self.pdf_path.set(file_path)
            self.log(f"Arquivo selecionado: {file_path}")

    def start_transform_thread(self):
        # Inicia o processo em uma thread separada
        if not self.pdf_path.get():
            messagebox.showerror("Erro", "Por favor, selecione um arquivo PDF!")
            return
        if not self.user_name.get():
            messagebox.showerror("Erro", "Por favor, insira seu nome!")
            return
        
        self.start_button.config(state="disabled")
        self.log("Iniciando transformação...")
        thread = threading.Thread(target=self.extract_and_transform_data)
        thread.start()

    def extract_and_transform_data(self):
        # Extrai dados do PDF, transforma e salva em CSV/ZIP 
        try:
            pdf_path = self.pdf_path.get()  # Obtém o caminho do PDF do campo de entrada
            output_csv = "rol_procedimentos.csv"
            output_zip_template = "Teste_{}.zip"
            user_name = self.user_name.get()  # Obtém o nome do usuário do campo de entrada

            # Extração dos dados do PDF (todas as páginas)
            self.log(f"Extraindo dados do PDF: {pdf_path}")
            all_tables = []
            with pdfplumber.open(pdf_path) as pdf:
                for page in pdf.pages:
                    tables = page.extract_tables() # Extrai tabelas de cada página
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
            
            # Substitui abreviações OD e AMB pelas descrições completas
            # Conforme legenda comum em rodapés: OD = Odontológico, AMB = Ambulatorial
            column_mapping = {
                'OD': 'Odontológico',
                'AMB': 'Ambulatorial'
            }
            df.rename(columns=column_mapping, inplace=True)

            # Salva os dados em CSV
            self.log(f"Salvando dados em: {output_csv}")
            df.to_csv(output_csv, index=False, encoding='utf-8-sig')  # utf-8-sig para suportar acentos no Windows

            # Compacta o CSV em um ZIP
            zip_filename = output_zip_template.format(user_name)
            self.log(f"Compactando em: {zip_filename}")
            with ZipFile(zip_filename, 'w') as zipf:
                zipf.write(output_csv, os.path.basename(output_csv))
            
            # Remove o CSV após compactar (opcional)
            os.remove(output_csv)
            self.log(f"Processo concluído! Arquivo final: {zip_filename}")
            messagebox.showinfo("Concluído", f"Transformação concluída!\nArquivo: {zip_filename}")

        except Exception as e:
            self.log(f"Erro: {str(e)}")
            messagebox.showerror("Erro", f"Ocorreu um erro:\n{str(e)}")
            
        finally:
            self.start_button.config(state="normal")

if __name__ == "__main__":
    root = tk.Tk()
    app = DataTransformApp(root)
    root.mainloop()