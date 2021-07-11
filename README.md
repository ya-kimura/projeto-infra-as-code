# Projeto IAC


## Requisitos

- Terraform 0.14+
- Packer 1.7+
- Ansible 2.10+
- Credenciais da AWS

##  Sobre este Projeto
Projeto para subir uma infrastutura  base e provisionar uma ec2 que irá rodar uma aplicação simples em Nodejs.

Cria recursos como:
 - AMI baseada em Ubuntu 20.04
 - EC2 instance

Arquitetura geral do projeto:
![arquitetura iac na aws](https://i.pinimg.com/originals/14/4f/a8/144fa839a6e85704866c4ed38e9a94f4.jpg)

## Executando o Projeto
> **Note: ** Será necessário mudar a zona de disponibilidade tanto no **Terraform** quanto no **Packer**.

Executando o packer:
```bash 
cd packer/
```
Em seguida rodar o comando docker abaixo.
```bash 
docker run --rm -it -v $PWD:/app -w /app --entrypoint "" hashicorp/packer:light sh 
```
Instalar o ansible dentro container do packer:
```bash 
apk -U add ansible
```
Fazer o export da chaves AWS:
```bash
export AWS_ACCESS_KEY_ID=" "
export AWS_SECRET_ACCESS_KEY=" "
```

Executando o Terraform:
```bash 
cd terraform/
```
Em seguida rodar o comando docker abaixo:
```bash 
docker run --rm -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh 
```
Fazer o export da chaves AWS:
```bash
export AWS_ACCESS_KEY_ID=" "
export AWS_SECRET_ACCESS_KEY=" "
```
Executando o terraform plan e apply:
```bash
terraform plan
```
Após rodar o plano, o terraform irá informar quais recursos ele irá criar na aws, se tudo estiver ok, segue com o apply:
```bash
terraform apply
```
Ao concluir o processo, o terraform informará o output com o public_ip e dns_ip.

>  Mais sobre os recursos terraform neste projeto: [terrafom-docs](https://github.com/ya-kimura/pagar-me/blob/develop/terraform/README.md).
#
### Todo
- Criar Makefile
- Adicionar step do packer no pipeline
- Desenvolver CRUD da API nodejs
  
  #

