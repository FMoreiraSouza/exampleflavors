# Verifica se um sabor foi fornecido
param (
    [string]$Flavor
)

if (-not $Flavor) {
    Write-Host "Usage: .\script.ps1 <flavor>"
    exit 1
}

$ConfigFile = "icons_config\icon_${Flavor}.yaml"

# Verifica se o arquivo de configuração existe
if (Test-Path $ConfigFile) {
    Write-Host "Atualizando ícones para o sabor: $Flavor"
    flutter pub run flutter_launcher_icons:main -f $ConfigFile
    Write-Host "Ícones atualizados. Rodando o aplicativo..."
    flutter run --flavor $Flavor -t lib/main.dart --dart-define=FLAVOR=$Flavor
} else {
    Write-Host "Arquivo de configuração $ConfigFile não encontrado!"
    exit 1
}
