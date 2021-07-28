# LogonVerwaltungsPC

Dieses PowerShell Modul starten eine VM in Azure. (z. B.: einen zentralen PC mit einer Software, die aus der Cloud bereitgestellt wird). Dann wird eine RDP Session vom aufrufenden PC zu dieser VM aufgebaut. Nachdem der Benutzer sich von der VM getrennt hat, wird die VM in Azure automatisch beendet.


# Requirements
Auf dem PC muss das aktuelle Az Powershell Modul installiert sein.
https://docs.microsoft.com/de-de/powershell/azure/new-azureps-module-az?view=azps-6.2.1

Installationanleitung: https://docs.microsoft.com/de-de/powershell/azure/install-az-ps?view=azps-6.2.1

# Benutzung

Bsp 1:

Logon-VerwaltungsPC -rg "Verwaltung" -name "Verwaltungs-PC" -pubname "verwaltungspc.germanywestcentral.cloudapp.azure.com"

Wobei die Parameter folgende Wirkung haben

rg = Die ResourceGroup wo drin die Azure VM läuft
name = Der Name der VM
pubname = Der DNS Name der VM, der öffentlich erreichtbar sein muss.

Sollte die VM nicht über das Internet erreichbar sein, dann kann auch ein Weg über VPN aufgebaut werden.

# Zusätzliche Infos

Das RDP Protokoll ist mit ähnlich starken Technologien verschlüsselt wie auch VPN Tunnel. Auf die Nutzung von VPN würde ich also aktuell verzichten. Macht das Szenario also nochmal einfacher. 
