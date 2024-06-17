function Create-MedraDirectory {
    try {
        # Tente de créer le répertoire
        New-Item -Path "C:\MEDRA" -ItemType Directory -Force | Out-Null
        # Retourne 1 si la création réussit
        return 1
    } catch {
        # Affiche le message d'erreur
        Write-Error "Erreur lors de la création du répertoire: $_"
        # Retourne 0 pour indiquer l'échec
        return 0
    }
}

# Appelle la fonction et capture le code de retour
Create-MedraDirectory