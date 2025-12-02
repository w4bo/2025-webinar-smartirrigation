---
author: Matteo Francia <br/> DISI --- University of Bologna <br/> m.francia@unibo.it
title: Irrigazione intelligente
bibliography: refs.bib
---

#

**Matteo Francia**

- Ricercatore presso DISI - Università di Bologna
- Contatto: m.francia@unibo.it

**Background principale**:

- Dottorato in *Ingegneria e Scienze Informatiche*
- Big data e machine learning
    - ... con *applicazioni* nel campo dell'Agricoltura di Precisione
    - *L'interdisciplinarità* è molto importante!

Queste slide sono il risultato di uno sforzo condiviso:

- **Brevetto**: "Metodo e Sistema per il Monitoraggio dell'Umidità del Suolo" registrato il 18 ottobre 2023 N. 102021000023162
- **Ricerca**: "Multi-sensor profiling for precision soil-moisture monitoring" [@francia2022multi]
- Grazie a Prof. Matteo Golfarelli, Dott. Manuele Pasini, Dott. Alex Baiardi

<img src="./img/unibo.svg" style="box-shadow: none !important; position: absolute !important; top: -250px !important; right: -250px !important; ; max-height: 500px !important; max-width: 500px !important" />

# Irrigazione Intelligente

:::: {.columns}
::: {.column width="67%"}

La sinergia tra Internet of Things (IoT) e agricoltura di precisione produce applicazioni di valore in ambito Agritech [@vitali2021crop]

- **Agritech**: uso della tecnologia in agricoltura per migliorare efficienza e redditività

**Applicazione**: irrigazione intelligente

- Ottimizzare l'umidità del suolo è cruciale per le prestazioni delle colture [@turkeltaub2016real]
- *Obiettivo*: indicare l'acqua necessaria per raggiungere uno stato ottimale di umidità per la produzione

(Alcuni) **Problemi**:

- *I suoli* hanno differenti capacità di trattenere l'acqua
- *I sistemi di irrigazione* hanno comportamenti diversi
- *Le piante* hanno diverse esigenze idriche
    - Kiwi [@judd1986water] vs Vite

:::
::: {.column width="33%"}

<img src="https://github.com/user-attachments/assets/a1c9c6ae-3a56-405b-bbff-4d3922b27a9d" style="max-height: 450px !important"></img>

:::
::::


# Scenario di riferimento

:::: {.columns}
::: {.column width="58%"}

![Frutteto di Kiwi](./img/kiwifruit-orchard.jpg)

:::
::: {.column width="42%"}

![Modello del frutteto](./img/soil-volume.svg)

:::
::::

Il nostro approccio si concentra su frutteti

- Le *piante di kiwi sono allineate lungo i filari*
- Ogni filare ha molti *gocciolatori* (es. 1 ogni 60cm)
- I gocciolatori possono irrigare solo un *volume limitato di suolo*


# Panoramica dell'Approccio

:::: {.columns}
::: {.column width="50%"}

Il nostro approccio si compone di due fasi:

- **Monitoraggio**: comprendere il comportamento del suolo
- **Prescrizione**: fornire la quantità ottimale d'acqua

... coinvolge due attori:

- *Agricoltore*: fornisce conoscenze e feedback sul campo
- *Tecnico*: definisce lo stato ottimale e verifica il comportamento del sistema

... e richiede un ambiente IoT:

- *Sensori* (obbligatori): forniscono conoscenza in tempo reale
- *Irrigazione azionabile da remoto* (opzionale)
    - Senza connessione remota, forniamo all'agricoltore una raccomandazione (es. via e-mail)

:::
::: {.column width="50%"}

![Panoramica del frutteto](./img/overview.svg)

:::
::::


# Monitoraggio

![Monitoraggio](./img/monitoring.svg)


# Dai Sensori ai Profili del Suolo

:::: {.columns}
::: {.column width="32%"}

![Umidità del suolo reale](./img/sm.svg)

:::
::: {.column width="32%"}

![Dati campionati](./img/grid.svg)

:::
::: {.column width="32%"}

![Profilo](./img/profile.svg)

:::
::::

1. L'umidità del suolo è un continuum nel terreno
1. I sensori restituiscono una rappresentazione discretizzata dell'umidità del suolo
    - A seconda del numero di sensori e del loro layout, l'accuratezza del monitoraggio cambia
1. Obiettivo: produrre profili del suolo dettagliati a partire da layout a grana grossa


# Layout dei Sensori e Ipotesi di Simmetria


:::: {.columns}
::: {.column width="50%"}

![Volume di suolo](./img/soil-volume.svg)

:::
::: {.column width="50%"}

![Simmetria](./img/symmetry.svg)

:::
::::

Approcci con singolo sensore (o colonna di sensori a diverse profondità) *assumono che l'umidità del suolo sia uniforme ovunque*

- Se il volume irrigato è simmetrico lungo il filare, *una griglia 2D di sensori è sufficiente per rappresentare il volume di suolo*
- Se le variazioni di umidità avvengono anche lungo il filare, è necessaria una griglia 3D di sensori
    - Es. gocciolatori troppo distanti tra loro

# Raccolta Dati in Tempo Reale

:::: {.columns}
::: {.column width="43%"}

Ad oggi monitoriamo **10 campi** principalmente di kiwi

- ... ma anche di pero, noci e vite

In ogni campo, una **griglia di sensori** perpendicolare alla linea degli alberi da frutto

- *4 colonne* a distanza incrementale dalla pianta
    - es. 0/30/60/90cm
- *Ogni colonna ha 3 sensori* a diverse profondità
    - es. 20/40/60cm

L'approccio funziona anche con *6 o 9 sensori*

**Dataset**: in 4 anni 70GB di dati (al 30 agosto 2024)

:::
::: {.column width="17%"}

![Kiwi](./img/sensori-kiwi.jpg)

:::
::: {.column width="40%"}

![Vite](./img/sensori-vite.jpg)

:::
::::

# Elaborazione dei Dati

:::: {.columns}  
::: {.column width="60%"}  

**Tecniche statistiche (FU)**  

- Plug-and-play (funzionante dal primo giorno)  

**Tecniche basate su intelligenza artificiale (FA)**  

- Richiede tempo per la raccolta dati e l'addestramento/test

:::  
::: {.column width="40%"}  

![Panoramica](./img/pluto-processing.svg)  

:::  
::::  

# Fase Online: Profilazione Statistica

Profilazione dei dati dei sensori in tempo reale attraverso **tecniche statistiche**  

- Interpolazione lineare dei dati dei sensori in tempo reale  
- Plug-and-play (funzionante dal primo giorno)  

![Profilazione senza consapevolezza](./img/pluto-bilinear.svg)  

# Fase Online: IA

![](./img/pluto-nn.svg)  

*(Una semplice) ANN è il modello con le migliori prestazioni*  

Gli iperparametri (struttura/tassi di apprendimento) sono impostati tramite un processo di ottimizzazione  

- *HyperOpt* [@komer2019hyperopt]: tecnica di ottimizzazione per esplorare lo spazio degli iperparametri  
- Stiamo nidificando machine learning nel machine learning!  

# Monitoraggio

<div class="center-img" style="width: 800px !important;">
![Sensori semplici](./img/sensors-1.png)  
</div>

<div class="center-img" style="width: 800px !important;">
![Profilo di umidità](./img/sensors-2.png)
</div>

# Monitoraggio

<div class="center-img" style="width: 600px !important;">
<img src="./img/untitled.gif" class="center-img" />
</div>

# Irrigazione Intelligente

![Modello del frutteto](./img/prescripting.svg)  

# Irrigazione Intelligente

Il tecnico imposta un'umidità del suolo ottimale e il sistema deve raggiungerla  [@quartieri2021effect]  

:::: {.columns}
::: {.column width="40%"}  

![](./img/pluto-optimal.svg)  

:::  
::: {.column width="60%"}  

![](./img/opt-us-caption.png)  

:::  
::::  

# Consumo Idrico  

:::: {.columns}  
::: {.column width="50%"}  

Irrigazione prescrittiva

![](./img/opt-us.png)  

:::  
::: {.column width="50%"}  

Agricoltore

![](./img/opt-farm.png)  

:::  
::::  

- *Risparmio del 40%* di acqua durante l'intera campagna (24% in luglio/agosto)
- *Costi energetici ridotti*: meno ore di accensione dell'irrigazione
- *Qualità/quantità del frutto comparabile (o migliore)* rispetto alla gestione manuale  

# Bibliografia