FROM ubuntu:focal

MAINTAINER Joshua Schraven <joshua@schraven.email>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt install -y \
    texlive-full \
    pandoc \
    pandoc-citeproc
