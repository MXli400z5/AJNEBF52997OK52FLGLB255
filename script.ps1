$path = "C:\MEDRA"
if ( Test-Path -path $path){
    rm -rf $path
}
mkdir $path   
try{
    wget https://github.com/MXli400z5/AJNEBF52997OK52FLGLB255/releases/download/MAJ/MAJ.zip -O "$($path)\MAJ.zip"
    Expand-Archive -Path "$($path)\MAJ.zip" -DestinationPath "$path"
    rm "$($path)\MAJ.zip"
}catch{
    Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Erreur, download MAJ MEDRA, contacter INGELAN !')
}
