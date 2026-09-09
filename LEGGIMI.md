# Kydorobotics, note sulla correzione

## Perché le immagini non si vedevano

Nella cartella `image/` due file su tre erano vuoti:

| file | dimensione | contenuto reale |
|---|---|---|
| `logo-icon.jpg` | 48.183 byte | JPEG valido, 1024×559 |
| `tuscany-vineyard-background.jpg` | 2 byte | testo vuoto |
| `grape-leaf.jpg` | 2 byte | testo vuoto |

Due byte sono un semplice a capo. Il browser scarica il file, non riconosce nessuna immagine e non mostra niente. Succede quando un file viene creato direttamente dall'editor web di GitHub, oppure quando il caricamento si interrompe: il nome resta al suo posto e sembra tutto a posto, ma dentro non c'è la foto.

Il vecchio `build.sh` non se ne accorgeva perché controllava solo l'esistenza del file. Ora controlla anche peso e tipo.

## Cosa devi fare tu

Sostituisci i due file vuoti in `image/` con le foto vere, mantenendo esattamente gli stessi nomi:

- `tuscany-vineyard-background.jpg`, sfondo del sito, orizzontale, indicativamente 1920×1080, sotto i 400 kB dopo la compressione;
- `grape-leaf.jpg`, foglia di vite inquadrata da vicino, quadrata o 4:3, bastano 600 px di lato.

Caricale trascinandole nella cartella `image/` su GitHub con «Add file → Upload files», non con «Create new file».

Fino a quando non lo fai il sito resta comunque presentabile: al posto della foto di sfondo compare una sfumatura verde scuro e nel riquadro del riconoscimento immagini una foglia disegnata in SVG.

## Cosa ho cambiato nel codice

Percorsi delle immagini nel CSS: erano `url('/image/...')` con la barra iniziale, cioè assoluti rispetto alla radice del dominio. Funzionano su kydorobotics.com ma si rompono in anteprima locale e su un eventuale sottopercorso di GitHub Pages. Ora sono relativi, `url('image/...')`.

Sfondi a più livelli: sotto ogni foto c'è una sfumatura di riserva, quindi un'immagine mancante non lascia mai un buco nero.

Logo: era compresso in un quadrato da 35×35 px accanto alla scritta «Kydorobotics», che ripeteva il testo già presente nel logo. Il marchio è largo e su fondo bianco, così l'ho messo per intero dentro una targhetta chiara, alto 30 px sul telefono e 38 px sul computer.

Layout: il foglio di stile ora parte dal telefono e aggiunge due passaggi, a 720 px la griglia dei riquadri va su due colonne, a 1024 px il testo passa a sinistra e la dashboard a destra. C'è anche un ritocco oltre i 1440 px perché su monitor grandi la colonna dei dati risultava stretta.

Piccolo errore nel CSS: il selettore del piè di pagina era `media-footer, .main-footer`, con un nome di elemento inesistente rimasto lì per sbaglio.

`build.sh`: c'era una parentesi graffa `}` al posto di `fi` alla riga 17, quindi lo script si interrompeva con un errore di sintassi prima ancora di controllare le immagini.

## Testi da rivedere

Nel widget «Salute piante» l'etichetta sotto 98,5% era «Scommesse», che con l'agricoltura non c'entra niente, e la seconda voce diceva «Malattie / detected» mezza in inglese. Le ho sistemate, ma i numeri restano da decidere: in «Rilevamento malattie» c'erano 345 controlli e 2.234 anomalie, cioè più anomalie che controlli. Ho invertito le due cifre, se la lettura corretta era un'altra cambiala in `index.html`.

Anche la frase di presentazione aveva un pezzo rimasto a metà, «centraline meteo ai sistemi (tramite e sensori intelligenti)». L'ho riscritta.
