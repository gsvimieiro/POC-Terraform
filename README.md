# POC-Terraform
Estudo sobre terraform utilizando cloud AWS. Neste POC construo scripts passo a passo.

O que é Terraform
- É uma ferramenta para construir, alterar e criar versões de infraestrutura através de código declarativo

Principais Características :
- IaC
- Declarativo
- Open Source
- Idempotente (pode ser aplicado várias vezes que o resultado final vai ser o mesmo)
- Planos de execução
- Hibrido (aceito em várias Clouds)

Tarefas :

- Criar uma conta na AWS OK
- Criar usuário AWS OK
- Baixar o AWS CLI e configurar de acordo com o Access Key e o Secret Key OK
- Primeiro Script para criação do Bucket AWS


  ![image](https://github.com/gsvimieiro/POC-Terraform/assets/25323854/5d34c2a5-f682-4595-814e-c400c45336f2)

  - Rodar o primeiro script .tf
      - terraform init
      - terraform plan
      - terraform apply

Bucket criado
![image](https://github.com/gsvimieiro/POC-Terraform/assets/25323854/37b71dab-0748-4765-9760-3923ef1bda77)

Tags 

![image](https://github.com/gsvimieiro/POC-Terraform/assets/25323854/be6f2e2a-3660-4b32-8228-0bec0140ec5d)


Principais comandos Terraform ou observações :

- Baixar o terraform (melhor baixar o binário dele), unzip no arquivo depois copiar para o executável para o diretorio /usr/local/bin - sudo mv terraform /usr/local/bin (isso no Linux)

- Digitar o comando terraform -install-autocomplete (ele autocompleta com os principais comandos do terraform no Terminal)

- Como estou utilizando o Provider AWS criar uma conta exclusiva para o Terraform
    - Ao criar esta conta, crie com acesso "programático" pois será utilzado o AWS CLI e o terraform utiliza programação declarativa.
 
- terraform init
    - este comando, quando executado ele baixa os fontes do provider e inicializa o backend

- Recomandável instalar a extensão Hashcorp Terraform (VSCode) pois ele já identa o código corretamente e coloca as cores corretas nos comandos

- Link da página para buscar os comandos para instalação dos recursos - [registry.terraform.io](https://registry.terraform.io/)

- O arquivo terraform.tfstate é o coração do Terraform, é este arquivo que irá guardar toda a infraestrutura instalada atualmente no provider (totalmente desaconselhável editar este arquivo)

- O comando terraform state list informa de uma forma simplista o que está atualmente provisionado no provider

- O comando terraform destroy -target nome_completo_do_objeto irá destruir APENAS o objeto e não toda a estrutura do terraform

- Quando está com uma configuração muito extensa, o comando terraform validate irá validar se sua configuração está correta

- Boa prática é criar o arquivo terraform.tfvars (arquivo de variáveis), este arquivo funciona junto com o variables.tf (arquivo de declaração de variáveis)

- Para variáveis tipo password, boa prática é declarar no arquivo de variables.tf definir um recurso sensitive = True na variável, isso significa que ele irá pedir que digite
    o valor da variável todas as vezes que executar os comandos plan ou apply

- Terraform Remote Backend
    - Centraliza o arquivo state (coração do Terraform) em um único repositório
    - Cria-se um bucket no S3

Exemplo arquivo backend :

  terraform {
  backend "s3" {
    bucket         = "myorg-terraform-states"
    key            = "myapp/production/tfstate"
    region         = "us-east-1"
    dynamodb_table = "TableName"
    }
  }













