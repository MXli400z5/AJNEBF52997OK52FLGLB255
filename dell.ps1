$falsepath = "C:\MEDRA"
$truepath = "C:\Meddra"
# Vérifier si le chemin existe et le supprimer s'il existe
if (Test-Path -Path $falsepath) {
    Remove-Item -Path $falsepath -Recurse -Force
}
if (Test-Path -Path $truepath) {
    Remove-Item -Path $truepath -Recurse -Force
}
