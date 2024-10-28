# Artikel-Versionen

In diesem Verzeichnis ist der entstandene Artikel zu finden. Dabei wurde mit [Pandoc](https://pandoc.org/) gearbeitet, um eine von GitHub ordentlich darstellbare Preview-Version ([`article.preview.md`](./article.preview.md)) sowie eine PDF-Datei zu erstellen. Dafür kann das angegebene Build-Skript [`build_preview.sh`](./build_preview.sh) verwendet werden, welches die Dateien in einem [Podman](https://podman.io/)-Container baut. Dieses muss vom Root-Verzeichnis des Repositories ausgeführt werden.

```sh
# aus Root-Verzeichnis des Repositories
$ sh article/build_preview.sh
```

Weiterhin werden bei jedem Push, in welchem die `article.pandoc.md`-Datei verändert wird, die Preview-Version automatisch gebaut und gepusht (siehe [`.github/workflows/update_article_preview.yaml`](../.github/workflows/update_article_preview.yaml)). Die zugehörige PDF-Version ist als Artefakt in der CI zu finden.
