# 🚀 Deploy de Aplicação Java com Docker na AWS via Terraform

Este projeto demonstra como provisionar infraestrutura na AWS usando Terraform e realizar o deploy de uma aplicação Java containerizada com Docker em uma instância EC2.

> 🔧 Ideal para desenvolvedores iniciantes em DevOps ou para quem deseja aprender **Terraform**, **Docker** e **AWS EC2** na prática.

---

## 🧰 Tecnologias Utilizadas

- 🖥️ Java
- 🍃 Spring Boot
- 🐳 Docker + Docker Hub
- ☁️ Amazon EC2 (via Terraform)
- 📦 Terraform CLI
- 🔐 AWS CLI + Key Pair SSH

---

## ✅ Pré-requisitos

- Conta na [AWS](https://aws.amazon.com/)
- Usuário com acesso programático (Access Key e Secret)
- AWS CLI configurado (`aws configure`)
- Terraform instalado (`terraform -v`)
- Docker instalado
- Chave pública/privada para SSH (`ssh-keygen`)

---

## 📦 Estrutura do Projeto

```
projeto/
├── app/
│   └── Dockerfile
│   └── SpringBootApp.java
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── user_data.sh
└── README.md
```

---

## 📍 Passo a Passo

### 1. Clonar o projeto

```bash
git clone https://github.com/seu-usuario/projeto-java-aws-terraform.git
cd projeto-java-aws-terraform
```

### 2. Publicar a imagem Docker no Docker Hub

```bash
cd app/
docker build -t seu-usuario/app-java .
docker push seu-usuario/app-java
```

### 3. Configurar a infraestrutura com Terraform

```bash
cd infra/
terraform init
terraform plan
terraform apply
```

### 4. Acessar a aplicação

- Pegue o IP público da EC2 no output do `terraform apply`.
- Acesse via navegador ou Postman:
  ```
  http://<ip-publico>:8080
  ```

### 5. (Opcional) Destruir a infraestrutura

```bash
terraform destroy
```

---

## 🔐 Segurança

- O acesso via SSH é liberado apenas para seu IP local.
- Porta 22 (SSH) e 8080 (HTTP) são abertas via **Security Group**.
- O script `user_data.sh` executa o deploy automático ao subir a EC2.

---

## 🧠 Aprendizados

✅ Terraform: providers, recursos, outputs, variável de ambiente  
✅ AWS: EC2, IAM, VPC, Security Groups  
✅ Docker: build, tag, push no Docker Hub  
✅ SSH e scripts de inicialização remota

---

## 🏗️ Infraestrutura Criada

| Recurso       | Descrição                      |
|---------------|--------------------------------|
| EC2 Instance  | Servidor Linux com Docker      |
| SecurityGroup | Libera portas 22 e 8080        |
| User Data     | Script automatiza o deploy     |
| Chave SSH     | Acesso remoto seguro à máquina |

---

## 📌 Por que usar Terraform?

- Automatiza toda a infraestrutura
- Evita erros manuais (ClickOps)
- Código versionável e reusável
- Multi-cloud (AWS, Azure, GCP)

---

## 🧩 Comparação: ClickOps vs. IaC

| Abordagem  | Vantagens | Desvantagens |
|------------|-----------|--------------|
| ClickOps   | Fácil para testes | Não reproduzível, não versionável |
| Terraform (IaC) | Automação, consistência, versionamento | Curva de aprendizado |

---

## 👨‍💻 Autor

**Douglas Souza**  
Desenvolvedor Java e DevOps em formação  
🔗 [LinkedIn](https://www.linkedin.com/in/ddouglss) • [GitHub](https://github.com/ddouglss)

---

📢 *Aprendizado 100% prático: da ideia ao deploy real na nuvem!*
