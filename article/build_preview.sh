#!/bin/bash

# check if Podman is installed
if ! command -v podman &> /dev/null; then
    echo "Error: Podman is not installed. Please install Podman to use this script."
    exit 1
fi

# start podman machine if not already running
if ! podman machine ls | grep -q "Currently running"; then
    echo "Error: No podman machine is currently running."
    echo "Starting Podman machine..."
    podman machine start
fi

echo "Building markdown preview..."
podman run --rm \
    -v "$(pwd):/data" pandoc/latex article/article.pandoc.md \
    --shift-heading-level-by=-1 \
    --bibliography slides/bibliography.bib \
    --citeproc \
    --to=gfm \
    -o article/article.preview.md

echo "Building pdf..."
podman run --rm \
    -v "$(pwd):/data" pandoc/latex article/article.pandoc.md \
    --shift-heading-level-by=-1 \
    --resource-path article \
    --bibliography slides/bibliography.bib \
    --citeproc \
    -o article/24_bis_shibboleth_article.pdf
