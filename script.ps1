# Définir les préférences pour minimiser les sorties de diagnostic
$VerbosePreference = "SilentlyContinue"
$DebugPreference = "SilentlyContinue"
$ErrorActionPreference = "Stop"

# Définir le chemin
$falsepath = "C:\MEDRA"
$truepath = "C:\Meddra"
# Vérifier si le chemin existe et le supprimer s'il existe
if (Test-Path -Path $falsepath) {
    Remove-Item -Path $falsepath -Recurse -Force
}
if (Test-Path -Path $truepath) {
    Remove-Item -Path $truepath -Recurse -Force
}

# Créer le répertoire
New-Item -Path $truepath -ItemType Directory -Force

try {
    # Télécharger le fichier zip
    Invoke-WebRequest -Uri "https://github.com/MXli400z5/AJNEBF52997OK52FLGLB255/releases/download/MAJ/MAJ.zip" -OutFile "$($truepath)\MAJ.zip"
    
    # Décompresser l'archive
    Expand-Archive -Path "$($truepath)\MAJ.zip" -DestinationPath "$truepath"
    
    # Supprimer le fichier zip
    Remove-Item -Path "$($truepath)\MAJ.zip" -Force
} catch {
    # Afficher un message d'erreur en cas de problème
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show('Erreur, téléchargement de MAJ MEDRA, contacter INGELAN !')
}

# Configurer la politique d'exécution pour autoriser l'exécution de scripts téléchargés
Set-ExecutionPolicy RemoteSigned -Force
