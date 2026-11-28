# Kydo Robotics, note sulla versione attuale

## Le immagini (aggiornato il 28/11/2026)

La pagina usa due fotografie vere, in `image/`, entrambe senza metadati:

- `vigna-interfilare-sfondo.jpg`, 1234 × 684, interfilare con i grappoli (foto di Rino,
  28/11/2026). Sta dietro l'apertura e la fascia di chiusura, sotto il velo scuro. Risoluzione
  bassa per uno sfondo: va bene sotto il velo; se arriva una versione più grande (almeno
  1920 px di lato) si sostituisce con lo stesso nome.
- `vigna-parete-foglia.jpg`, 1600 × 1200, ripresa di prova in vigna (Marche, 26/08/2026),
  senza posizione GPS. Nessun nome di azienda.

La vecchia immagine di sfondo (`tuscany-vineyard-background.jpg`) era generata con l'AI e
mostrava un rover con una scritta sbagliata e droni che irroravano: tolta dal repository il
28/11/2026, insieme a `grape-leaf.jpg`. Ogni sfondo nuovo va solo da una foto vera,
orizzontale, senza edifici, persone, targhe o macchine riconoscibili.

Regole per ogni immagine nuova: niente immagini generate con l'AI che possano sembrare foto;
niente immagini di prodotto (Core o Metal) finché Rino non lo decide; niente riquadri del
riconoscimento; togliere sempre i metadati EXIF prima di caricare.

Se un'immagine non compare, aprila da sola nel browser
(`https://kydorobotics.com/image/vigna-parete-foglia.jpg`). Se il browser non la mostra,
il problema è nel file caricato: va ricaricato con «Add file → Upload files». Attenzione alle
maiuscole nell'estensione, `.JPG` e `.jpg` sono due nomi diversi per il server.

## Due prodotti (28/11/2026)

Dopo l'apertura c'è la sezione «Due prodotti, una sola tecnologia» (in inglese «Two
products, one technology»): Kydo Core e Kydo Metal, la versione espandibile e su misura.
Per Metal non si usano parole di gerarchia («più robusto», «Pro», «Premium») e il nome non
si spiega con il materiale. Il fornitore dell'involucro non si nomina.

## Cosa è cambiato nei testi

La sezione «cosa non fa» è uscita dalla pagina. Restano quattro blocchi in positivo, che
dicono la stessa cosa girata dal lato del cliente: la fascia produttiva vista di lato,
i rilievi confrontabili, il microclima del filare, l'anagrafe della pianta.

È rimasta la chiusura «complementare al rilievo aereo, non alternativo», che non è una
riserva ma una frase di posizionamento presa dall'identità sintetica. Serve soprattutto
con gli operatori di servizi con drone, che sono il canale migliore: appena leggono la
pagina devono capire che non vieni a prendergli il lavoro.

## Da tenere presente

Il pulsante di contatto e l'indirizzo di posta sono fuori dalla pagina finché la casella
non è attiva. Il blocco è rimasto in `index.html` dentro un commento, subito sotto il
paragrafo di apertura: quando la posta funziona basta togliere i marcatori `<!--` e `-->`
e sostituire `info@kydorobotics.com` con l'indirizzo vero.

Le affermazioni vietate dal file `argomento-tecnico.md` non sono rientrate dalla finestra:
in pagina non si parla di diagnosi, di guida autonoma, di precisione millimetrica né di
percentuali di accuratezza.

## Navigazione (28/11/2026)

- Menu fisso in alto con le sezioni (Prodotti, Rilievo, Metodo, UV-C, Contatti); su telefono
  scorre di lato. Le sezioni hanno uno spazio in alto per non finire sotto il menu.
- I blocchi lunghi sono tendine (`<details class="more">`): su telefono partono chiuse, su schermi
  da 1024 px in su un piccolo script le apre. Senza JavaScript restano chiuse e si aprono a mano.
- I tre pilastri (rilievo, elettrificazione, rete industriale) non stanno più nell'apertura:
  sono nella sezione «Dove andiamo», prima della chiusura, in una tendina.
- Pulsante «torna su» fisso in basso a destra.
- Lunghezza su telefono (390 px): da circa 7,8 a circa 4,9 schermate con le tendine chiuse.
