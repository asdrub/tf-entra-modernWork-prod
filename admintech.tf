# Gera uma senha aleatória segura
resource "random_password" "admintech_group_owner_password" {
  length           = 20
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  override_special = "!@#$%&*"
}

# Obtém o domínio padrão do tenant atual
data "azuread_domains" "current" {
}

locals {
  onmicrosoft_domain = [
    for d in data.azuread_domains.current.domains : d.domain_name
    if can(regex("^[a-zA-Z0-9-]+\\.onmicrosoft\\.com$", d.domain_name))
  ][0]
}

#Admintech
resource "azuread_user" "admintech_group_owner" {
  user_principal_name = "admintech@${local.onmicrosoft_domain}"
  display_name        = "Administrador Microsoft365 - Theo Tech"
  mail_nickname       = "admintech"
  password            = random_password.admintech_group_owner_password.result
}

# Obtém a função de Administrador Global
resource "azuread_directory_role" "global_admin" {
  display_name = "Global Administrator"
}

# Atribui a função ao usuário
resource "azuread_directory_role_assignment" "assign_global_admin" {
  role_id             = azuread_directory_role.global_admin.template_id
  principal_object_id = azuread_user.admintech_group_owner.object_id
}

