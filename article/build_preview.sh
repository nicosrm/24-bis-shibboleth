#!/bin/bash

# don't convert paths when using Windows
export MSYS_NO_PATHCONV=1

echo "Building markdown preview..."
podman run --rm \
    -v "$(pwd):/data" pandoc/latex article/article.pandoc.md \
    --shift-heading-level-by=-1 \
    --bibliography slides/bibliography.bib \
    --csl article/ieee.csl \
    --citeproc \
    --to=gfm \
    -o article/article.preview.md

echo "Building pdf..."
podman run --rm \
    -v "$(pwd):/data" pandoc/latex article/article.pandoc.md \
    --shift-heading-level-by=-1 \
    --resource-path article \
    --bibliography slides/bibliography.bib \
    --csl article/ieee.csl \
    --citeproc \
    -o article/24_bis_shibboleth_article.pdf
