param (
    [string]$Flavor
)

# Verifica se um sabor foi fornecido
if (-not $Flavor) {
    Write-Output "Usage: .\script.ps1 <flavor>"
    exit 1
}

$ConfigFile = "icons_config\icon_${Flavor}.yaml"

# Verifica se o arquivo de configuração existe
if (Test-Path $ConfigFile) {
    Write-Output "Updating icons for the flavor: $Flavor"
    flutter pub run flutter_launcher_icons -f $ConfigFile
    Write-Output "Icons updated. Running the application..."
    flutter run --flavor $Flavor -t lib/main.dart --dart-define=FLAVOR=$Flavor
}
else {
    Write-Output "Configuration file $ConfigFile not found!"
    exit 1
}
