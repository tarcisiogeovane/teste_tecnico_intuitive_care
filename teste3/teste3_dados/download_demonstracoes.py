import requests
import os
from zipfile import ZipFile

base_url = "https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/"
years = ["2023", "2024"]
output_dir = "C:/Users/tarci/OneDrive/Desktop/teste3_dados"

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

for year in years:
    for quarter in ["1T", "2T", "3T", "4T"]:
        file_name = f"{quarter}{year}.zip"
        url = f"{base_url}{year}/{file_name}"
        print(f"Baixando {file_name}...")
        response = requests.get(url)
        if response.status_code == 200:
            zip_path = os.path.join(output_dir, file_name)
            with open(zip_path, "wb") as f:
                f.write(response.content)
            # Descompacta o ZIP
            with ZipFile(zip_path, "r") as zip_ref:
                zip_ref.extractall(output_dir)
            os.remove(zip_path)  # Remove o ZIP após extrair
            print(f"{file_name} baixado e extraído.")
        else:
            print(f"Erro ao baixar {file_name}: {response.status_code}")

print("Download concluído!")