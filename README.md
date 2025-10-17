# Terraform Entra ID Modern Work - Produção

Este projeto Terraform implementa uma estrutura de gerenciamento de identidade e acesso no Microsoft Entra ID (Azure AD) seguindo as melhores práticas do **CIS Microsoft 365 Foundations Benchmark v.4.0.0** para ambientes corporativos Modern Work.

## 📋 Visão Geral

O projeto automatiza a criação e gestão de:
- ✅ Usuários administrativos especializados
- ✅ Grupos de segurança dinâmicos baseados em tipos de dispositivos
- ✅ Grupos de segurança atribuídos para controle de acesso
- ✅ Atribuições de funções administrativas
- ✅ Políticas de segurança e controle de dados

## 🏗️ Arquitetura

### Usuários Administrativos

| Usuário | Função | Descrição |
|---------|--------|-----------|
| `admintech@{tenant}.onmicrosoft.com` | Global Administrator | Administrador principal Microsoft 365 - Theo Tech |
| `lad@{tenant}.onmicrosoft.com` | User Administrator<br>Device Administrator | Administrador Local de Dispositivos - Theo Tech |

### Grupos Dinâmicos

Os grupos dinâmicos são automaticamente populados baseados em regras de filtro:

#### Dispositivos por Plataforma
- **TM6-Android-Comp-COBO**: Dispositivos Android corporativos
- **TM6-Android-Comp-nao-corporativos**: Dispositivos Android pessoais
- **TM6-iOS-Comp-nao-corporativos**: Dispositivos iOS/iPad pessoais
- **TM6-Win-Comp-COBO**: Dispositivos Windows corporativos
- **TM6-Win-Comp-nao-corporativos**: Dispositivos Windows pessoais
- **TM6-Win-Comp-Servidores**: Servidores Windows
- **TM6-macOs-Comp**: Dispositivos macOS

#### Usuários por Tipo
- **TM6-Guest-Group**: Todos os usuários convidados (Guest)

### Grupos Atribuídos

Grupos para controle granular de políticas e exceções:

- **TM6-Excecao-Armazenamento-Removivel**: Computadores excluídos da política de bloqueio de dispositivos removíveis
- **TM6-Gerenciamento-Unified-Groups**: Usuários autorizados a criar grupos do Microsoft 365
- **TM6-Windows-Hello-grupo-dispositivos-em-exceção**: Dispositivos com exceções para políticas do Windows Hello
- **TM6-Usuarios-Autorizados-a-Compartilhamento-Externo**: Usuários autorizados para compartilhamento externo
- **TM6-Computadores com administradores locais**: Dispositivos que receberão usuários privilegiados no grupo local de Administradores
- **TM6-Upgrade-Windows-11**: Dispositivos que precisam ser atualizados para Windows 11

## 🛠️ Pré-requisitos

- **Terraform** >= 1.0
- **Azure CLI** configurado e autenticado
- Permissões de **Global Administrator** no tenant Entra ID
- Provider **hashicorp/azuread** ~> 3.4
- Provider **hashicorp/random** ~> 3.5

## 🚀 Como Usar

### 1. Configuração Inicial

```bash
# Clone o repositório
git clone <repository-url>
cd tf-entra-modernWork-prod

# Autentique-se no Azure
az login

# Selecione o tenant correto
az account set --subscription "<subscription-id>"
```

### 2. Inicialização

```bash
# Inicialize o Terraform
terraform init

# Valide a configuração
terraform validate

# Visualize o plano de execução
terraform plan
```

### 3. Aplicação

```bash
# Aplique as configurações
terraform apply

# Confirme quando solicitado digitando "yes"
```

### 4. Verificação

Após a aplicação, você pode verificar:

```bash
# Visualizar os outputs
terraform output

# Listar grupos criados
az ad group list --query "[?contains(displayName, 'TM6')].{Name:displayName, Id:id}" --output table
```

## 📊 Outputs

O projeto fornece informações importantes após a execução:

- IDs dos grupos criados
- Informações dos usuários administrativos
- Nomes e identificadores para referência em outras políticas

## 🔐 Segurança

### Senhas Automáticas
- As senhas são geradas automaticamente usando o provider `random`
- Comprimento: 20 caracteres
- Incluem: maiúsculas, minúsculas, números e caracteres especiais (!@#$%&*)

### Práticas de Segurança
- Todos os grupos seguem o padrão de nomenclatura **TM6-**
- Implementação baseada no **CIS Microsoft 365 Foundations Benchmark**
- Princípio de menor privilégio aplicado
- Segregação de funções administrativas

## 📁 Estrutura do Projeto

```
.
├── main.tf              # Configuração principal e providers
├── admintech.tf         # Usuário administrador principal
├── lad.tf              # Usuário administrador de dispositivos
├── dinamicos.tf        # Grupos dinâmicos baseados em regras
├── atribuidos.tf       # Grupos de atribuição manual
├── output.tf           # Outputs do projeto
└── README.md           # Este arquivo
```

## 🔄 Manutenção

### Atualizações
Para atualizar a infraestrutura:

```bash
terraform plan
terraform apply
```

### Backup do Estado
Recomenda-se configurar um backend remoto para o arquivo de estado:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "terraformstatestg"
    container_name       = "tfstate"
    key                  = "entra-modernwork.tfstate"
  }
}
```

## ⚠️ Considerações Importantes

1. **Primeiro Deploy**: Execute em ambiente de teste antes da produção
2. **Permissões**: Certifique-se de ter as permissões adequadas no tenant
3. **Backup**: Faça backup das configurações existentes antes da aplicação
4. **Monitoramento**: Monitore os logs do Entra ID após a implementação
5. **Compliance**: Revise se as configurações atendem aos requisitos da sua organização

## 📞 Suporte

Para dúvidas ou problemas:
- Consulte a documentação do [Terraform AzureAD Provider](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs)
- Revise o [CIS Microsoft 365 Foundations Benchmark](https://www.cisecurity.org/benchmark/microsoft_365)
- Verifique os logs do Terraform para detalhes de erros

## 📄 Licença

Este projeto segue as práticas e padrões estabelecidos pela Theo Tech para implementações Microsoft 365.

---

*Desenvolvido seguindo as melhores práticas de Infrastructure as Code (IaC) e segurança empresarial.*