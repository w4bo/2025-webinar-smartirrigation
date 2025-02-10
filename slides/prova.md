---
author: John Doe
title: Title
subtitle: Subtitle
date: 2023-12-04
format:
  revealjs: 
    footer: "My footnote"
bibliography: prova.bib
---

# Main slide

:::: {.columns}

::: {.column width="40%"}
Left column
[@DBLP:journals/eswa/FranciaGG24]

- Nested level 1
  - Nested level 2
    - Nested level 3
    - Nested level 3
  - Nested level 2
- Nested level 1
:::

::: {.column width="60%"}
Right column

- Nested level 1
  - Nested level 2
    - Nested level 3
    - Nested level 3
  - Nested level 2
- Nested level 1
:::

::::

## This is some latex

- $A \in \{0, 1\}$
- $$A \in \{0, 1\}$$

# This is embedded

{{< include _embed.md >}}

## A Section

Bbb

![immagine](https://github.com/w4bo/img-dump/assets/18005592/edb97112-e9bb-45f8-8f2c-3121ebd80b7d)


---

## A Section

Xxx

### A subsection

Ccc

---

### A subsection

Yyy

---

#### A subsubsection

Ddd

---

## A subsubsubsection

Eee

---

# Some other slides


```js
let a = 1;
let b = 2;
let c = x => 1 + 2 + x;
c(3);
```

# References