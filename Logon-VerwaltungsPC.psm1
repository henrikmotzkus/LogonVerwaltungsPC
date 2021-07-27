# Script Logon-Verwaltungspc
<# .SYNOPSIS
     Connects to a PC running in Azure
.DESCRIPTION
     This script starts a Azure VM connects a rdp session to it. When the user quits the session the VM will be stopped. Requirement is that 
     the Az Module for Powershell ist installed.
.NOTES
     Author     : Henrik Motzkus - henrik@motzkus.info
.LINK
    http://www.henrikmotzkus.de
#>


function Check-Reqs {
    
    try {
        Import-Module Az.Accounts
        
        if (Get-Module -ListAvailable -Name Az.Accounts) {
            Write-Host "Requirements checked ..."
            return $true
        } 
        else {
            Write-Host "Install Az Powershell Module ..."
            return $false
        }

    } catch {
        Write-Host "Install Az Powershell Module ..."
        return $false
    }
    
}

function Logon-VerwaltungsPC {

    
    param (
        
        [Parameter(Mandatory=$true)]
        [String]
        $rg,

        [Parameter(Mandatory=$true)]
        [String]
        $name,

        [Parameter(Mandatory=$true)]
        [String]
        $pubname
    )

    try {

        if (Check-Reqs) {
           
            $creds = Get-Credential -Message "Bitte Benutzerdaten eingeben"
            Connect-AzAccount -Credential $creds
            Write-Host "Starting VM ..." 
            Start-AzVM -ResourceGroupName $rg -Name $name
            Write-Host "Connecting to VM ..."
            Start-Process -FilePath c:\windows\system32\mstsc.exe -ArgumentList "/v:$pubname /span" -Wait
           
        }

    } catch {
        Write-Host "Error occured ..."
    } finally {
        Write-Host "Stopping VM ..."
        Stop-AzVM -ResourceGroupName $rg -Name $name -Force
        Write-Host "VM stopped ..."
    }

}

Export-ModuleMember -Function Logon-VerwaltungsPC
