#!/bin/bash
set -exo
quarto preview cs-smartirrigation-ita.md --to revealjs --port 6778 --host 0.0.0.0
# quarto render --to revealjs