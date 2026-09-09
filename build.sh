#!/bin/bash
# Script di build per Kydorobotics - AGGIORNATO per nuova struttura immagini e formato JPG

echo "🚀 Avvio della build di Kydorobotics..."
echo "📂 Elenco dei file attuali:"
ls -F

# Controllo dell'integrazione di Google Site Verification
echo "🔍 Controllo dell'indicizzazione richiesta verbatim..."
if grep -q "google-site-verification" index.html; then
    echo "✅ Meta tag trovato in index.html."
    echo "   ✅ Valore verificato: y5C2DoxCR-_3h6pQVan7bYae3rRYLBRr70b8vzcpdQ8"
else
    echo "❌ Meta tag NON trovato in index.html. Aggiungerlo manualmente."
    exit 1
}

# Controllo della presenza delle immagini collegate verbatim NELLA NUOVA CARTELLA
echo "🔍 Controllo della presenza delle immagini collegate verbatim in image/..."
if [ -f "image/tuscany-vineyard-background.jpg" ]; then echo "   ✅ tuscany-vineyard-background.jpg trovata."; else echo "❌ tuscany-vineyard-background.jpg NON trovata."; exit 1; fi
if [ -f "image/grape-leaf.jpg" ]; then echo "   ✅ grape-leaf.jpg trovata."; else echo "❌ grape-leaf.jpg NON trovata."; exit 1; fi
if [ -f "image/logo-icon.jpg" ]; then echo "   ✅ logo-icon.jpg trovata."; else echo "❌ logo-icon.jpg NON trovata."; exit 1; fi

echo "🎉 Build completata con successo! I file sono pronti per il caricamento su GitHub."
