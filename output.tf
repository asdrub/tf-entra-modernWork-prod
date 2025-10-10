output "admintech"{
  description = "Admin TheoTech"
  value       = "${azuread_user.admintech_group_owner.display_name}: ${azuread_user.admintech_group_owner.user_principal_name}"
}

output "grupo_guest_group_id" {
  description = "ID do grupo TM6-Guest-Group"
  value       = "${azuread_group.tm6_guest_group.display_name}: ${azuread_group.tm6_guest_group.id}"
}

output "grupo_android_comp_cobo_id" {
  description = "ID do grupo TM6-Android-Comp-COBO"
  value       = "${azuread_group.tm6_android_comp_cobo.display_name}: ${azuread_group.tm6_android_comp_cobo.id}"
}

output "grupo_android_comp_nao_corporativos_id" {
  description = "ID do grupo TM6-Android-Comp-nao-corporativos"
  value       = "${azuread_group.tm6_android_comp_nao_corporativos.display_name}: ${azuread_group.tm6_android_comp_nao_corporativos.id}"
}

output "grupo_ios_comp_nao_corporativos_id" {
  description = "ID do grupo TM6-iOS-Comp-nao-corporativos"
  value       = "${azuread_group.tm6_ios_comp_nao_corporativos.display_name}: ${azuread_group.tm6_ios_comp_nao_corporativos.id}"
}

output "grupo_win_comp_cobo" {
  description = "ID do grupo TM6-Win-Comp-COBO"
  value       = "${azuread_group.tm6_win_comp_cobo.display_name}: ${azuread_group.tm6_win_comp_cobo.id}"
}

output "grupo_win_comp_nao_corporativos" {
  description = "ID do grupo TM6-Win-Comp-nao-corporativos"
  value       = "${azuread_group.tm6_win_comp_nao_corporativos.display_name}: ${azuread_group.tm6_win_comp_nao_corporativos.id}"
}

output "grupo_win_comp_servidores" {
  description = "ID do grupo TM6-Win-Comp-Servidores"
  value       = "${azuread_group.tm6_win_comp_servidores.display_name}: ${azuread_group.tm6_win_comp_servidores.id}"
}

output "grupo_macos_comp" {
  description = "ID do grupo TM6-macOS-Comp"
  value       = "${azuread_group.tm6_macos_comp.display_name}: ${azuread_group.tm6_macos_comp.id}"
}
