FROM miktex/miktex:latest

ENV PANDOC_VERSION="2.18"
ENV CITEPROC_VERSION="0.7"

RUN apt-get update && \
    apt-get install -y \
        python3-pip \
        cabal-install

RUN pip3 install pandoc-fignos

ADD https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb /tmp/pandoc.deb

RUN dpkg -i /tmp/pandoc.deb

ADD https://github.com/jgm/citeproc/archive/refs/tags/${CITEPROC_VERSION}.tar.gz /tmp/citeproc.tar.gz

RUN tar xzf /tmp/citeproc.tar.gz -C /tmp && \
    cd /tmp/citeproc-* && \
    cabal v1-update && \
    cabal install -fexecutable && \
    mv /root/.cabal/bin/citeproc /usr/local/bin/

RUN rm -rf /tmp/*

RUN apt-get purge -y cabal-install

RUN apt-get autoremove -y
