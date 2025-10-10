# Gera uma senha aleatória segura
resource "random_password" "lad_owner_password" {
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

#lad
resource "azuread_user" "lad_owner" {
  user_principal_name = "lad@${local.onmicrosoft_domain}"
  display_name        = "Administrador Local de Dispositivos - Theo Tech"
  mail_nickname       = "lad"
  password            = random_password.lad_owner_password.result
}

# Obtém a função de Administrador de usuários
resource "azuread_directory_role" "user_admin" {
  display_name = "User Administrator"
}

# Obtém a função de Device Administrator
resource "azuread_directory_role" "device_admin" {
  display_name = "Device Administrator"
}

# Atribui a função user admin ao usuário
resource "azuread_directory_role_assignment" "assign_user_admin" {
  role_id             = azuread_directory_role.user_admin.template_id
  principal_object_id = azuread_user.lad_owner.object_id
}

# Atribui a função device admin ao usuário
resource "azuread_directory_role_assignment" "assign_device_admin" {
  role_id             = azuread_directory_role.device_admin.template_id
  principal_object_id = azuread_user.lad_owner.object_id
}
