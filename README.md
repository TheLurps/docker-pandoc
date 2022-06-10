# docker-pandoc

A docker image for generating PDFs from Markdown using Pandoc and Miktex

## Usage

Create docker volume to store Miktex packages

```bash
docker create --name miktex
```

Run locally

```bash
docker run --rm -ti \
    -v miktex:/miktex/.miktex \
    -v $(pwd):/miktex/work \
    -e VERSION=$(git log -1 --format=format:"%H") \
    -e MIKTEX_GID=$(id -g) \
    -e MIKTEX_UID=$(id -u) \
    thelurps/pandoc:latest make all
```

## More sample text

An unordered listing:

- item a
- item b
- item c

A ordered listing:

1. item a
1. item b
1. item c

Some code:

```python
for e in elements:
    print(e)
```

This is a sample citation @dominici2014overview.

## References
