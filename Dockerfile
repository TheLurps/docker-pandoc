FROM ubuntu:focal

MAINTAINER Joshua Schraven <joshua@schraven.email>

ENV DEBIAN_FRONTEND=noninteractive
ENV PANDOC_VERSION "2.5-3build2"

RUN apt-get update && \
    apt-get install -y \
        texlive \
        pandoc=${PANDOC_VERSION} \
        pandoc-citeproc
