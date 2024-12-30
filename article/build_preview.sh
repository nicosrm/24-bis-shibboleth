#!/bin/bash

# don't convert paths when using Windows
export MSYS_NO_PATHCONV=1

echo "Building markdown preview..."
podman run --rm \
    -v "$(pwd):/data" pandoc/latex:latest-ubuntu \
    --bibliography slides/bibliography.bib \
    --csl article/ieee.csl \
    --metadata numberSections \
    -F pandoc-crossref \
    --citeproc \
    --to=gfm \
    -o article/article.preview.md \
    article/article.pandoc.md

echo "Building pdf..."
podman run --rm \
    -v "$(pwd):/data" pandoc/latex:latest-ubuntu \
    --shift-heading-level-by=-1 \
    --resource-path article \
    --bibliography slides/bibliography.bib \
    --csl article/ieee.csl \
    --metadata linkReferences \
    --number-sections \
    -F pandoc-crossref \
    --citeproc \
    -o article/24_bis_shibboleth_article.pdf \
    article/article.pandoc.md
