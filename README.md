# pandocker

Docker image for pandoc 2.18 with xelatex and citeproc plugins.  Renders markdown files to pdf and docx, using a docx template file for styles.

# Usage

Create a file `.github/workflows/render-pandoc.yml`:

```yml
name: pandoc

on:
  push:
    paths:
      - "**pandoc.yml"
      - "**template.docx"
      - "**.bib"
      - "**.md"
      - "!README.md"

jobs:
  pandoc-render:
    name: Render documents

    runs-on: ubuntu-20.04
    container: ms609/pandoc

    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}

    steps:
      - uses: actions/checkout@v3
        
      - name: Render PDF
        run: |
          pandoc INPUT_FILENAME.md --pdf-engine=xelatex --citeproc \
            -o OUTPUT_FILENAME.pdf

      - name: Render .docx
        run: |
          pandoc INPUT_FILENAME.md --reference-doc template.docx \
            --citeproc -o OUTPUT_FILENAME.docx

      - name: Deploy
        run: |
          git config --global --add safe.directory "/__w/*"
          git ls-files
          git config --local user.email "actions@github.com"
          git config --local user.name "GitHub Actions"
          git add *.pdf *.docx
          git commit -m "Render output files"
          git fetch
          git pull --ff-only
          git push
```
