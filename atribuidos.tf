#Tm6-Excecao-Armazenamento-Removivel
resource "azuread_group" "tm6_excecao_armazenamento_removivel" {
  display_name     = "Tm6-Excecao-Armazenamento-Removivel"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo atribuído de DISPOSITIVOS contendo os computadores que serão excetuados a regra de bloqueio para TODOS dispositivos."
  security_enabled = true
  mail_enabled     = false
  owners           = [azuread_user.admintech_group_owner.object_id]
}

#Tm6-Gerenciamento-Unified-Groups
resource "azuread_group" "tm6_gerenciamento_unified_groups" {
  display_name     = "Tm6-Gerenciamento-Unified-Groups"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo atribuído que reune todos usuários autorizados a criação de grupos do Microsoft 365. Esta atribuição é necessária para alterar o comportamento padrão do Microsoft 365 que autoriza todos usuários a criação de grupos e, consequentemente, caixas postais de grupos e sites de equipe (Team Sites)."
  security_enabled = true
  mail_enabled     = false
  owners           = [azuread_user.admintech_group_owner.object_id]
}

#TM6-Windows Hello grupo dispositivos em exceção
resource "azuread_group" "tm6_windows_hello_grupo_dispositivos_em_excecao" {
  display_name     = "TM6-Windows-Hello-grupo-dispositivos-em-exceção"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo atribuído de DISPOSITIVOS contendo os computadores que não devem seguir a regra padrão definida pelo cliente para uso do Windows Hello"
  security_enabled = true
  mail_enabled     = false
  owners           = [azuread_user.admintech_group_owner.object_id]
}

#TM6-Usuarios autorizados a compartilhamento externo
resource "azuread_group" "tm6_usuarios_autorizados_a_compartilhamento_externo" {
  display_name     = "TM6-Usuarios-Autorizados-a-Compartilhamento-Externo"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo atribuído de USUÁRIOS que poderão fazer compartilhamentos externos no Sharepoint e Onedrive, configuração para estar ativa deve ser validada no console Admin do Sharepoint > Poíticas > Permitir que somente usuários em grupos de segurança específicos compartilhem externamente."
  security_enabled = true
  mail_enabled     = false
  owners           = [azuread_user.admintech_group_owner.object_id]
}

#Tm6-Computadores com administradores locais
resource "azuread_group" "tm6_computadores_com_admin_local" {
  display_name     = "Tm6-Computadores com administradores locais"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo atribuído de DISPOSITIVOS contendo os computadores que receberão usuários privilegiados no seu grupo local de Administradores"
  security_enabled = true
  mail_enabled     = false
  owners           = [azuread_user.admintech_group_owner.object_id]
}

#Tm6-Upgrade-Windows-11
resource "azuread_group" "tm6_upgrade_windows_11" {
  display_name     = "Tm6-Upgrade-Windows-11"
  description      = "Grupo atribuído de DISPOSITIVOS contendo os computadores que precisam ter seus sistemas operacionais Windows 10 atualizados para a versão 11."
  security_enabled = true
  mail_enabled     = false
  owners           = [azuread_user.admintech_group_owner.object_id]
}
