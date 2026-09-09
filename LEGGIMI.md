# Kydo Robotics, note sulla versione attuale

## Le due fotografie

La pagina usa due immagini, che devono stare in `image/` con questi nomi esatti:

- `tuscany-vineyard-background.jpg`, orizzontale, indicativamente 1920×1080, sotto i 400 kB;
- `grape-leaf.jpg`, foglia di vite ripresa da vicino, bastano 800 px di lato.

La foto del vigneto adesso compare due volte: dietro l'apertura e dietro la fascia di
chiusura in fondo alla pagina. Il velo scuro che ci sta sopra è stato alleggerito, da 0,80
a 0,62 nella parte alta, e su desktop è diventato orizzontale: fitto a sinistra dove c'è il
testo, quasi trasparente a destra dove non c'è niente da leggere. Il vigneto si vede, il
testo resta leggibile.

La sezione centrale ha invece un fondo pieno e non ha mai avuto la fotografia dietro:
serve contrasto, altrimenti quattro blocchi di testo su una foto diventano illeggibili.

Se una delle due immagini non compare, aprila da sola nel browser all'indirizzo
`https://kydorobotics.com/image/tuscany-vineyard-background.jpg`. Se il browser non la
mostra, il problema è nel file caricato, non nella pagina: va ricaricato con
«Add file → Upload files», non con «Create new file». Attenzione anche alle maiuscole
nell'estensione, `.JPG` e `.jpg` sono due nomi diversi per il server.

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
