FROM ubuntu:jammy

MAINTAINER Joshua Schraven <joshua@schraven.email>

ENV DEBIAN_FRONTEND=noninteractive
ENV PANDOC_VERSION "2.9.2.1-3ubuntu2"

RUN apt-get update && \
    apt-get install -y \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-science \
        texlive-fonts-extra \
        texlive-bibtex-extra \
        pandoc=${PANDOC_VERSION} \
        pandoc-citeproc \
        git
