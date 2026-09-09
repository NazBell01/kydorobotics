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

echo
if [ "$ERRORI" -eq 0 ]; then
    echo "Build completata: i file sono pronti per il caricamento."
    exit 0
else
    echo "Build fallita: $ERRORI problemi da risolvere."
    exit 1
fi
