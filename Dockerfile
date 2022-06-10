FROM miktex/miktex:latest

RUN apt-get update && \
    apt-get install -y \
        pandoc \
        pandoc-citeproc \
        git
