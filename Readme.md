Readme
======
<!--8-Mrz-20-->

`(c)` 2020 Jan Unger

<https://bw-ju.de>

Inhalt - Ordnerpaket-Notiz
--------------------------
		code/*              Quellcode
    css/*               Webdesign anpassen
		images/             Bilder optimiert
		img_auto/           temp
		img_orig/           Bilder in Original: min. 2x *.jpg o. *.png
		latex/              LaTeX files -> pdfs
			Grafiken/         logo u. titelbild
			content/          präambel, metadata, header, literatur.bib
		md/                 Notizen erstellen in Markdown
		md_gfm/             GitHub Flavored Markdown
		scripte/            PS-Scripte werden von projekt.ps1 aufgerufen
		www/                CMS Wordpress u. HTML5 files
		.gitattributes      Git
		.gitconfig
		.gitignore
		--------------------------------------------
		projekt.ps1         PS-Script ausführen => erstellt pdfs u. HTML, Backup, Git, opti. Bilder ...
		Readme.md           lesen!
		Start.html          Projekt - Website öffnen
    --------------------------------------------
		
    # Backup files
    cd ..
    DATUM_Thema-Notiz_vVERSION.zip
    Thema-Notiz.zip
    git_log.txt

Erste Schritte
--------------

    # Projektordner öffnen
    git clone https://github.com/ju1-eu/Ordnerpaket-Notiz.git notiz
    cd notiz

"Readme.txt" **lesen**

**Thema** im Script `projekt.ps1` anpassen u. im Ordner 

`scripte/"git.ps1" u. "backup.ps1"`

`latex/content/"metadata.tex", "zusammenfassung.tex", "literatur.bib"` 

`latex/Grafiken/"titelbild.pdf"`

**Notizen** in Markdown erstellen: min. 2x! `md/*.md`

    # PS-Script ausführen 
    PS >_ projekt.ps1

    # Projekt - Website öffnen
    Start.html

Git
---

### Repository clonen

    # Github
    $THEMA      = "Ordnerpaket-Notiz" # Repository
    $ADRESSE    = "https://github.com/ju1-eu"
    git clone $ADRESSE/${THEMA}.git 

    # HD
    $HD    = "C:\repos\notizenWin10"
    $THEMA = "Ordnerpaket-Notiz" # Repository
    git clone $HD/${THEMA}.git 

    # USB
    $USB   = "E:\repos\notizenWin10"    
    $THEMA = "Ordnerpaket-Notiz" # Repository
    git clone $USB/${THEMA}.git 

    # RPI
    $RPI   = "\\RPI4\nas\repos\notizenWin10"    
    $THEMA = "Ordnerpaket-Notiz" # Repository
    git clone $RPI/${THEMA}.git 

### Repository neu anlegen

    # Github 
    $THEMA   = "Ordnerpaket-Notiz" # Repository
    $ADRESSE = "https://github.com/ju1-eu"
    git remote add origin $ADRESSE/${THEMA}.git
    git push --set-upstream origin master

    # backupHD
    $HD  = "C:\repos\notizenWin10"
    $THEMA = "Ordnerpaket-Notiz" # Repository
    $LESEZ = "backupHD"
    git clone --no-hardlinks --bare . $HD/${THEMA}.git
    git remote add $LESEZ $HD/${THEMA}.git
    git push --all $LESEZ

    # backupUSB
    $USB   = "E:\repos\notizenWin10"    
    $THEMA = "Ordnerpaket-Notiz" # Repository
    $LESEZ = "backupUSB"
    git clone --no-hardlinks --bare . $USB/${THEMA}.git
    git remote add $LESEZ $USB/${THEMA}.git
    git push --all $LESEZ

    # backupRPI
    $RPI   = "\\RPI4\nas\repos\notizenWin10"   
    $THEMA = "Ordnerpaket-Notiz" # Repository
    $LESEZ = "backupRPI"
    git clone --no-hardlinks --bare . $RPI/${THEMA}.git
    git remote add $LESEZ $RPI/${THEMA}.git
    git push --all $LESEZ

### Versionsverwaltung git

sichern - löschen - umbenennen

    cd notiz
    #git init  # Repository neu erstellen
    git add .
    #git commit -am "Projekt start"
    git commit -a
    # letzten Commit rueckgaengig 
    git commit --amend 
    
		# sichern
    git push     # github
    git push --all backupUSB
    git push --all backupHD
    git push --all backupRPI

    # löschen
    git rm datei o. ordner
    git rm -rf ordner
    git rm ordner -Recurse -Force

    # umbenennen
    git mv datei datei_neu

# Markdown

## Überschriften 

    # Überschrift   1
    ## Überschrift  2
    ### Überschrift 3

## Code

`Quellcode`

~~~
	#include <stdio.h>
	int main(void) {
		printf("Hallo Welt!\n");
		return 0;
	}
~~~

## Quellenangabe

Zitat: vgl. \cite{monk_action_buch:2016} u. \cite{kofler_linux:2017} 

    \cite{monk_action_buch:2016}  
    \cite{kofler_linux:2017} 
    \footnote{\url{https://de.wikipedia.org/wiki/LaTeX}}.  


## Listen

**ungeordnete Liste**

- a
- b
	- bb
- c

    - a
    - b
        - bb
    - c

**Sortierte Liste**

1. eins
2. zwei
3. drei

    1. eins
    2. zwei
    3. drei

**Sortierte Liste**

a) a
b) b
c) c

    a) a
    b) b
    c) c

## Links

<https://google.de> oder [Google](https://google.de)

    <https://google.de> 
    [Google](https://google.de)

## Absätze

Dies hier ist ein Blindtext zum Testen von Textausgaben. Wer diesen Text liest, 
ist selbst schuld. Der Text gibt lediglich den Grauwert der Schrift an. 
Ist das wirklich so? Ist es gleichgültig, ob ich schreibe: "Dies ist ein Blindtext" 
oder "Huardest gefburn"? Kjift - mitnichten! Ein Blindtext bietet mir wichtige Informationen.

Dies hier ist ein Blindtext zum Testen von Textausgaben. Wer diesen Text liest, 
ist selbst schuld. Der Text gibt lediglich den Grauwert der Schrift an. 
Ist das wirklich so? Ist es gleichgültig, ob ich schreibe: "Dies ist ein Blindtext" 
oder "Huardest gefburn"? Kjift - mitnichten! Ein Blindtext bietet mir wichtige Informationen.

## Texthervorhebung

**fett** *kursiv* "Anführungsstriche" 

    **fett** 
    *kursiv* 
    "Anführungsstriche" 


## Bild

Bilder in pdf speichern, empfehlenswert für \LaTeX.

![Logo](images/winter.pdf)

    ![Logo](images/winter.pdf)

## Tabelle

|**Nr.**|**Begriffe**|**Erklärung**|
|------:|:-----------|:------------|
| 1     | a1         | a2	     |
| 2     | b1         | b2	     |
| 3     | c1         | c2	     |

    |**Nr.**|**Begriffe**|**Erklärung**|
    |------:|:-----------|:------------|
    | 1     | a1         | a2	     |
    | 2     | b1         | b2	     |
    | 3     | c1         | c2	     |

## Mathe

$[ V ] = [ \Omega ] \cdot [ A ]$ o. $U = R \cdot I$ 

    $[ V ] = [ \Omega ] \cdot [ A ]$ o. $U = R \cdot I$ 

$R = \frac{U}{I}$

    $R = \frac{U}{I}$