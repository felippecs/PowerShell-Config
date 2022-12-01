$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp"
$ENV:STARSHIP_DISTRO = "  $env:USERNAME "
Invoke-Expression (&starship init powershell)

New-Alias g goto

function goto {
    param (
        $location
    )

    Switch ($location) {
        "tmp" {
            Set-Location -Path "C:\tmp"
        }
        "home" {
            Set-Location -Path "$HOME"
        }
        "oci" {
            Set-Location -Path "$HOME\oci"
        }
        "aws" {
            Set-Location -Path "$HOME\aws"
        }
        "music" {
            Set-Location -Path "$HOME\music"
        }
        "docs" {
            Set-Location -Path "$HOME\documents"
        }
        default {
            Write-Output "...::: Invalid location :::..."
        }
    }
}

function exec {
    param (
        $exec
    )

    Switch ($exec) {
        "pingfw" {
            psping64.exe -4 -n 65535 172.16.0.254:443 -t -h -accepteula | Foreach{"{0} - {1}" -f (Get-Date),$_,$1}
        }
        "pingad" {
            psping64.exe -4 -n 65535 172.16.0.1:3389 -t -h -accepteula | Foreach{"{0} - {1}" -f (Get-Date),$_,$1}
        }
        "pingnas" {
            psping64.exe -4 -n 65535 172.16.0.100:22 -t -h -accepteula | Foreach{"{0} - {1}" -f (Get-Date),$_,$1}
        }
        "pingint1" {
            psping64.exe -4 -n 65535 flowti.com.br:443 -t -h -accepteula | Foreach{"{0} - {1}" -f (Get-Date),$_,$1}
        }
        default {
            Write-Output "...::: Invalid location :::..."
        }
    }
}
