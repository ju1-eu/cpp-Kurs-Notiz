<#------------------------------------------------------ 
  PowerShell Script
  update: 2-Mrz-20
  (c) 2020 Jan Unger 
  * Versionsverwaltung git
  * Repository -> github, HD, USB, RPI
  * Backup Version erstellen
------------------------------------------------------#>
Clear-Host # cls

#---------------------------------------
$thema = "cpp-Kurs-Notiz"  # anpassen
$HD  = "C:\repos\notizenWin10"
$USB = "E:\repos\notizenWin10"
$RPI = "\\RPI4\nas\repos\notizenWin10"
#---------------------------------------

$log_file  = "git_log.txt"
$timestamp = Get-Date -Format 'ddMMy' # 250220
$LESEZ_HD  = "backupHD"
$LESEZ_USB = "backupUSB"
$LESEZ_RPI = "backupRPI"

## Funktionsaufruf: versionieren
function versionieren{
  # lokales repository
  git add .
  git commit -a # Editor
  git status
  #git lg
  #git lg > ../$log_file

<#
  # github repository
  # wenn lokale Änderungen vorliegen, wird der Merge abgebrochen
  #git pull --ff-only
  git push
#>

  if(!(test-path $HD)){
    "Fehler: '$HD' nicht vorhanden!"
  }
  else{
    git push --all $LESEZ_HD # sichern
    "Backup $HD"
  }

  if(!(test-path $USB)){
    "Fehler: '$USB' nicht vorhanden!"
  }
  else{
    git push --all $LESEZ_USB # sichern
    "Backup $USB"
  }

  if(!(test-path $RPI)){
    "Fehler: '$RPI' nicht vorhanden!"
  }
  else{
    git push --all $LESEZ_RPI # sichern
    "Backup $RPI" 
  }

  #git status
  git lg
  git lg > ../$log_file
}

# Usereingabe
"+++ Variablen anpassen '$thema' ?"
"+++ Git ausfuehren ?"
$var = Read-Host 'Eingabe - [j/n]' 
if($var -eq  "n"){# gleich
  "PS-Script .\scripte\git.ps1 wird beendet"
  exit
}
else{
  ## Funktionsaufruf: 
  versionieren
  "Git Version erstellt."

  # git commit (hashwert)
  $ID = git rev-parse --short HEAD  # Version: 2b98b91
  # DATUM_Thema-Notiz_vVERSION.zip
  Compress-Archive ./ -Update -dest ../"${timestamp}_${thema}_v${ID}.zip"
  "Backup Version erstellt."

  # löschen
  if(test-path ../"${thema}.zip"){rm ../"${thema}.zip" -force -recurse}
  # Thema-Notiz.zip
  Compress-Archive ./ -Update -dest ../"${thema}.zip"
  "Backup erstellt."
}
