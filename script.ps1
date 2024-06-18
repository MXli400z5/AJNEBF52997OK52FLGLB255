$path = "C:\MEDRA"

# Vérifie si le chemin existe
if (Test-Path -Path $path) {
    # Supprime de manière récursive
    Remove-Item -Path $path -Recurse -Force
}

New-Item -Path $path -ItemType Directory   
try {
    Invoke-WebRequest -Uri "https://github.com/MXli400z5/AJNEBF52997OK52FLGLB255/releases/download/MAJ/MAJ.zip" -OutFile "$($path)\MAJ.zip"

    Expand-Archive -Path "$($path)\MAJ.zip" -DestinationPath "$path"

    Remove-Item -Path "$($path)\MAJ.zip" -Force
} catch {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show('Erreur, téléchargement de MAJ MEDRA, contacter INGELAN !')
}

# Définit la politique d'exécution des scripts
Set-ExecutionPolicy RemoteSigned -Force
