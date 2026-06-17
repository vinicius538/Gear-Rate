# 🖱️ Gear-Rate

O Gear Rate é uma plataforma de reviews e comparações de perifericos, que permite os usuarios a darem suas opiniões sobre tal produto e também compará-los com outros 

---

## ⚙️ Técnologias Usadas

<center>
<img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white" alt="VS Code">
<img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
<img src="https://img.shields.io/badge/Amazon_AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white" alt="AWS">
<img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=fff" alt="Python">
  <img src="https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind">
    <img src="https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5">
</center>

---

## 📂 Estrutura do Projeto

```text
Gear-Rate/
├── src/                       # Código-fonte da aplicação Flask
│   ├── static                 # Ativos estáticos do frontend
│   ├── templates              # Páginas e templates HTML
│   ├── views/                 # Controladores, rotas e lógica de interface
│   │   └── routes.py
│   └── app.py                 # Arquivo principal para execução da aplicação Flask
├── .gitignore                 # Arquivos e pastas ignorados pelo Git
├── Dockerfile                 # Configuração para criação do container Docker
├── README.md                  # Documentação principal do repositório
├── docker-compose.yml         # Orquestração dos containers
└── requirements.txt           # Lista de dependências do Python

```

## Como Acessar o Site

### Pré-requisitos:
Ter o <a src="https://www.docker.com/products/docker-desktop/">Docker Desktop</a> Instalado


### Passo a Passo

```text
git clone https://github.com/vinicius538/Gear-Rate.git

cd Gear-Rate

docker compose up --build
```
