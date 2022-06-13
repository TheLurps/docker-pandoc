FROM miktex/miktex:latest

ENV PANDOC_VERSION="2.18"

RUN apt-get update && \
    apt-get install -y \
        python3-pip \
        git

RUN pip3 install pandoc-fignos

ADD https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb /tmp/pandoc.deb

RUN dpkg -i /tmp/pandoc.deb

COPY citeproc /usr/local/bin/citeproc

RUN chmod +x /usr/local/bin/citeproc

ADD https://raw.githubusercontent.com/tomncooper/pandoc-gls/89d3e716d3778af5d92ce735c9beb1d53826bbb1/pandoc-gls.lua /miktex/pandoc-gls.lua

RUN chmod +r /miktex/pandoc-gls.lua

RUN rm -rf /tmp/*

RUN apt-get autoremove -y
