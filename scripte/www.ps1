<#------------------------------------------------------ 
	PowerShell Script
	update: 2-Mrz-20
  (c) 2020 Jan Unger 
  * www/ Websiten in HTML5 u. CMS Wordpress
  * Start.html
------------------------------------------------------#>
Clear-Host # cls

#---------------------------------
# code/ ?
# Codeformate: c, cpp, sh, py, tex 
$codeformat = "c" 

# img/ ?
# Bildformate: svg, jpg, png, webp
$bildformat = "webp"  
#---------------------------------

# variablen
$html = "www"
$css = "css"
$img = "images"
$pdf = "pdf"
$webDesign = "$css/design.css"
$code = "code"
$pdfs = "pdfs"
$latex = "latex"

# kopie
cp ./$latex/*.pdf  ./$html/$pdfs/ 
if(test-path $html/Start.html){rm -r $html/Start.html -force} 

# html
function suchenErsetzenHTML{
  $filter = "html"
  #$html = "www"
  [array]$array = ls "./$html/*.$filter"
	#$array 
  # array auslesen
  for($n=0; $n -lt $array.length; $n++){   # kleiner
    #$name = "$($array[$n])"              # file.tex
    $basename = "$($array.BaseName[$n])" # file
    #"$n - $basename"
  # <embed src=`"img
  $suchen = "<embed src=`"img" # regulaerer Ausdruck
  $ersetzen = "<img class=`"scaled`" src=`"img"
  # regulaerer Ausdruck
  (Get-Content "./$html/$basename.$filter") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "./$html/$basename.$filter"
  
  # alt u. Bildgröße
  $suchen = "/><figcaption" # regulaerer Ausdruck
  $ersetzen = "alt=`"Bildname`" class=`"scaled`" /><figcaption"
  # regulaerer Ausdruck
  (Get-Content "./$html/$basename.$filter") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "./$html/$basename.$filter"
  
  # <img
  $suchen = "<embed" # regulaerer Ausdruck
  $ersetzen = "<img"
  # regulaerer Ausdruck
  (Get-Content "./$html/$basename.$filter") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "./$html/$basename.$filter"
  

  # pdf -> jpg
  $suchen = ".pdf`"" # regulaerer Ausdruck
  $ersetzen = ".jpg`""
  # regulaerer Ausdruck
  (Get-Content "./$html/$basename.$filter") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "./$html/$basename.$filter"
  
  }
}
  
## Funktionsaufruf: suchenErsetzenHTML
suchenErsetzenHTML

### Funktionsaufruf: htmlFiles $fileTitel $fileHTML $fileTyp $filter
function htmlFiles{
  param( 
    [string]$fileTitel,
    [string]$fileHTML,
    [string]$fileTyp,
    [string]$filter
  ) 
  $textHTML = "<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$fileTitel</title>                         <!-- Titel        -->
  <meta name=`"description`" content=`"Keywords`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$fileTitel</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"
  # schreibe in datei 
  $textHTML | Set-Content ./$html/$fileHTML
  #$filter = "*.pdf"
  [array]$array = ls "./$fileTyp/*.$filter" -Force 
  # array auslesen
  #$picnummer = 1
  for($n=0; $n -lt $array.length; $n++){   # kleiner
    #$name = "$($array[$n])"              # file.tex
    $basename = "$($array.BaseName[$n])" # file
    #"$n - $basename"
    $textHTML = "   <li><a href=`"$fileTyp/$basename.$filter`">$basename.$filter</a></li>"
    # schreibe in datei hinzu
    $textHTML | Add-Content ./$html/$fileHTML
    #$picnummer++ 
  }
  $textHTML = "</ul>`n<!-- Ende -->`n</body></html>"
  # schreibe in datei hinzu
  $textHTML | Add-Content ./$html/$fileHTML
}


# html: alle-PDF-files.html
"+++ alle-PDF-files.html"
$titel = "PDFs"
$fileHTML  = "alle-PDF-files.html"
$textHTML = "<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title>                         <!-- Titel        -->
  <meta name=`"description`" content=`"Keywords`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$fileHTML</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"

# schreibe in datei 
$textHTML | Set-Content ./$html/$fileHTML  
$filter = $pdf 
[array]$array = ls "./$html/$pdfs/*.$filter" -Force 
# array auslesen
for($n=0; $n -lt $array.length; $n++){   # kleiner
  #$name = "$($array[$n])"              # file.tex
  $basename = "$($array.BaseName[$n])" # file
  #"$n - $basename"
  $textHTML = "   <li><a href=`"$pdfs/$basename.$filter`">$basename.$filter</a></li>"
  # schreibe in datei hinzu
  $textHTML | Add-Content ./$html/$fileHTML
}
$textHTML = "</ul>`n<!-- Ende -->`n</body></html>"
# schreibe in datei hinzu
$textHTML | Add-Content ./$html/$fileHTML


# html: alle-Code-files.html
"+++ alle-Code-files.html"
$fileTitel = "Quellcode"
$fileHTML  = "alle-Code-files.html"
$fileTyp   = $code
$filter    = $codeformat   # Codeformate: c, cpp, sh, py, tex
### Funktionsaufruf: 
htmlFiles $fileTitel $fileHTML $fileTyp $filter


# html: alle-Abb-files.html
"+++ alle-Abb-files.html"
$fileTitel = "Abbildungen"
$fileHTML  = "alle-Abb-files.html"
$fileTyp   = $img
$filter    = $bildformat # Bildformate: svg, jpg, png, webp
### Funktionsaufruf: 
htmlFiles $fileTitel $fileHTML $fileTyp $filter

"+++ alle-Pics.html"
$titel = "Pics"
$fileHTML =  "alle-Pics.html"
$textHTML = "<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title>                           <!-- Titel -->
  <meta name=`"description`" content=`"$titel`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>"

# schreibe in datei 
$textHTML | Set-Content ./$html/$fileHTML  
$filter = $bildformat # Bildformate: svg, jpg, png, webp
[array]$arrayAbb = ls "./$img/*.$filter" -Force 
# array auslesen
$picnummer = 1
for($n=0; $n -lt $arrayAbb.length; $n++){   # kleiner
  #$name = "$($arrayAbb[$n])"              # file.tex
  $basename = "$($arrayAbb.BaseName[$n])" # file
  #"$n - $basename"
  $textHTML = "<!-- Abb. $picnummer -->
<a href=`"$img/$basename.$filter`"> 
  <figure> <img class=`"scaled`" src=`"$img/$basename.$filter`" alt=`"$basename`" />
    <figcaption>Abb. $picnummer : $basename</figcaption>
  </figure>
</a>"

  # schreibe in datei hinzu
  $textHTML | Add-Content ./$html/$fileHTML
  $picnummer++ 
}
$textHTML = "<!-- Ende -->`n</body></html>"
# schreibe in datei hinzu
$textHTML | Add-Content ./$html/$fileHTML


"+++ Start.html - alle html-Seiten"
$titel = "Start"
$fileHTML =  "Start.html"
$textHTML = "<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title>                             <!-- Titel -->
  <meta name=`"description`" content=`"Keywords`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"

# schreibe in datei 
$textHTML | Set-Content $fileHTML  
$filter = "html"
[array]$arrayHTML = ls "./$html/*.$filter" -Force 
# array auslesen
for($n=0; $n -lt $arrayHTML.length; $n++){   # kleiner
  #$name = "$($arrayHTML[$n])"              # file.tex
  $basename = "$($arrayHTML.BaseName[$n])" # file
  #"$n - $basename"
  $textHTML = "   <li><a href=`"$html/$basename.html`">$basename</a></li>"
  # schreibe in datei hinzu
  $textHTML | Add-Content $fileHTML
}
$textHTML = "</ul>`n<!-- Ende -->`n</body></html>"
# schreibe in datei hinzu
$textHTML | Add-Content $fileHTML


"www u. Start.html erstellt."

