FROM haskell:8.10.2

MAINTAINER Joshua Schraven <joshua@schraven.email>

ENV DEBIAN_FRONTEND=noninteractive
ENV PANDOC_VERSION "2.10.1"

RUN apt-get update && \
    apt-get install -y \
        texlive-latex-base \
        texlive-science \
        texlive-fonts-extra \
        texlive-bibtex-extra

RUN cabal update && \
    cabal install \
        pandoc-${PANDOC_VERSION} \
        pandoc-citeproc
