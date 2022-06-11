FROM miktex/miktex:latest

ENV PANDOC_VERSION="2.18"

RUN apt-get update && \
    apt-get install -y \
        python3-pip

RUN pip3 install pandoc-fignos

ADD https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb /tmp/pandoc.deb

RUN dpkg -i /tmp/pandoc.deb

COPY ./citeproc /usr/local/bin/citeproc

RUN rm -rf /tmp/*

RUN apt-get autoremove -y
