resource "azuread_group" "tm6_guest_group" {
  display_name     = "Tm6-Guest-Group"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico que reune todos convidados do Entra ID. Este grupo visa atender requisitos do CIS Microsoft 365 Foundations Benchmark - v.4.0.0 - 31/10/2024"
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(user.userType -eq \"Guest\")"
  }
}

resource "azuread_group" "tm6_android_comp_cobo" {
  display_name     = "Tm6-Android-Comp-COBO"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico que reune todos dispositivos da plataforma Android que forem ingressados no Entra ID como dispositivos de propriedade corporativa."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOSType -eq \"AndroidEnterprise\")"
  }
}

resource "azuread_group" "tm6_android_comp_nao_corporativos" {
  display_name     = "Tm6-Android-Comp-nao-corporativos"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico que reune todos dispositivos da plataforma Android que forem registrados no Entra ID, portanto, de propriedade pessoal."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOwnership -eq \"Personal\") and (device.deviceOSType -eq \"Android\")"
  }
}

resource "azuread_group" "tm6_ios_comp_nao_corporativos" {
  display_name     = "Tm6-iOS-Comp-nao-corporativos"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico que reune todos dispositivos da plataforma Apple que forem registrados no Entra ID, portanto, de propriedade pessoal."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOwnership -eq \"Personal\") and ((device.deviceOSType -eq \"iPad\") or (device.deviceOSType -eq \"iPhone\"))"
  }
}

# Tm6-Win-Comp-COBO
resource "azuread_group" "tm6_win_comp_cobo" {
  display_name     = "Tm6-Win-Comp-COBO"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico que reune todos dispositivos da plataforma Windows que forem ingressados no Entra ID como dispositivos de propriedade corporativa."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOwnership -eq \"Company\") and (device.deviceOSType -eq \"Windows\")"
  }
}

#Tm6-Win-Comp-nao-corporativos
resource "azuread_group" "tm6_win_comp_nao_corporativos" {
  display_name     = "Tm6-Win-Comp-nao-corporativos"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico que reune todos dispositivos da plataforma Windows que forem registrados no Entra ID, portanto, de propriedade pessoal."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOwnership -eq \"Personal\") and (device.deviceOSType -eq \"Windows\")"
  }
}

#Tm6-Win-Comp-Servidores
resource "azuread_group" "tm6_win_comp_servidores" {
  display_name     = "Tm6-Win-Comp-Servidores"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico de dispositivos que reune todos dispositivos do tipo Windows Server que forem ingressados no Entra ID."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOSType -eq \"Windows Server\")"
  }
}

#Tm6-macOs-Comp
resource "azuread_group" "tm6_macos_comp" {
  display_name     = "Tm6-macOs-Comp"
  description      = "CIS v.8 -> 3-Data Protection -> 3.3-Configure Data Access Control Lists.\nGrupo dinâmico de dispositivos que reune todos dispositivos do tipo macOs no Entra ID."
  security_enabled = true
  mail_enabled     = false
  types            = ["DynamicMembership"]
  owners           = [azuread_user.admintech_group_owner.object_id]

  dynamic_membership {
    enabled = true
    rule = "(device.deviceOSType -eq \"MacMDM\")"
  }
}
