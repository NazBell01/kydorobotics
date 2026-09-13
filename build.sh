#!/bin/bash
# Script di build per Kydorobotics
# Verifica che i file siano pronti prima del caricamento su GitHub Pages.

set -u
ERRORI=0

echo "Avvio della build di Kydorobotics"
echo "File presenti:"
ls -F

# --- Google Site Verification ---
echo
echo "Controllo del meta tag di verifica Google..."
if grep -q "google-site-verification" index.html; then
    echo "  OK: meta tag trovato in index.html."
else
    echo "  ERRORE: meta tag non trovato in index.html."
    ERRORI=$((ERRORI + 1))
fi

# --- Immagini ---
# Non basta che il file esista: deve anche essere una vera immagine.
# Un file da pochi byte (creato vuoto su GitHub, o caricato male) supera
# il controllo "esiste" ma sul sito non si vede. Qui controlliamo la
# dimensione e il tipo di file.
echo
echo "Controllo delle immagini in image/..."
for IMG in image/tuscany-vineyard-background.jpg image/grape-leaf.jpg image/logo-icon.jpg; do
    if [ ! -f "$IMG" ]; then
        echo "  ERRORE: $IMG non trovata."
        ERRORI=$((ERRORI + 1))
        continue
    fi

    PESO=$(wc -c < "$IMG")
    if [ "$PESO" -lt 1024 ]; then
        echo "  ERRORE: $IMG pesa solo $PESO byte, non è un'immagine valida. Va ricaricata."
        ERRORI=$((ERRORI + 1))
    elif file -b "$IMG" | grep -qi "image data"; then
        echo "  OK: $IMG ($PESO byte)."
    else
        echo "  ERRORE: $IMG non è riconosciuta come immagine. Va ricaricata."
        ERRORI=$((ERRORI + 1))
    fi
done

# --- Percorsi assoluti nel CSS ---
# url('/image/...') funziona solo sul dominio principale: in sottocartella
# o in anteprima locale l'immagine non si carica.
echo
echo "Controllo dei percorsi nel CSS..."
if grep -q "url('/image/" style.css || grep -q 'url("/image/' style.css; then
    echo "  ERRORE: nel CSS ci sono percorsi assoluti /image/. Usare image/ senza barra iniziale."
    ERRORI=$((ERRORI + 1))
else
    echo "  OK: percorsi relativi."
fi

# --- Pagina inglese ---
# Sta un livello più in basso, quindi foglio di stile e immagini vanno
# richiamati con ../ . Se si incolla la pagina italiana senza correggere
# i percorsi, l'inglese esce senza stile e senza logo.
echo
echo "Controllo della pagina inglese in en/..."
if [ ! -f "en/index.html" ]; then
    echo "  ERRORE: en/index.html non trovata."
    ERRORI=$((ERRORI + 1))
else
    if grep -q '"\.\./style\.css' en/index.html; then
        echo "  OK: il foglio di stile è richiamato con ../ ."
    else
        echo "  ERRORE: en/index.html non richiama ../style.css. Percorsi da correggere."
        ERRORI=$((ERRORI + 1))
    fi

    if grep -q '"\.\./image/' en/index.html; then
        echo "  OK: le immagini sono richiamate con ../ ."
    else
        echo "  ERRORE: en/index.html non richiama ../image/. Percorsi da correggere."
        ERRORI=$((ERRORI + 1))
    fi

    if grep -q 'lang="en"' en/index.html; then
        echo "  OK: la pagina si dichiara in inglese."
    else
        echo "  ERRORE: in en/index.html manca lang=\"en\"."
        ERRORI=$((ERRORI + 1))
    fi
fi

# --- Collegamento fra le due lingue ---
# Senza hreflang le due pagine, che si somigliano molto, si fanno
# concorrenza fra loro invece di essere lette come la stessa pagina
# in due lingue.
echo
echo "Controllo dei tag hreflang..."
for PAGINA in index.html en/index.html; do
    if [ ! -f "$PAGINA" ]; then
        continue
    fi
    if grep -q 'hreflang="it"' "$PAGINA" && grep -q 'hreflang="en"' "$PAGINA"; then
        echo "  OK: $PAGINA dichiara entrambe le lingue."
    else
        echo "  ERRORE: in $PAGINA mancano i tag hreflang."
        ERRORI=$((ERRORI + 1))
    fi
done

# --- Sitemap e robots ---
echo
echo "Controllo di sitemap.xml e robots.txt..."
for FILE in sitemap.xml robots.txt; do
    if [ -f "$FILE" ]; then
        echo "  OK: $FILE presente."
    else
        echo "  ERRORE: $FILE non trovato."
        ERRORI=$((ERRORI + 1))
    fi
done

# --- Vecchie versioni rimaste online ---
# GitHub Pages pubblica tutto quello che trova nel repository: un file
# rinominato .old resta raggiungibile da chiunque conosca l'indirizzo.
echo
echo "Controllo dei file vecchi rimasti nel repository..."
VECCHI=0
for FILE in index.html_old style.css_old index_old.html style_old.css; do
    if [ -f "$FILE" ]; then
        echo "  ATTENZIONE: $FILE è ancora qui e resta pubblicato. Conviene cancellarlo."
        VECCHI=$((VECCHI + 1))
    fi
done
if [ "$VECCHI" -eq 0 ]; then
    echo "  OK: nessuna vecchia versione nel repository."
fi

echo
if [ "$ERRORI" -eq 0 ]; then
    echo "Build completata: i file sono pronti per il caricamento."
    exit 0
else
    echo "Build fallita: $ERRORI problemi da risolvere."
    exit 1
fi
