FROM miktex/miktex:latest

RUN apt-get update && \
    apt-get install -y \
        pandoc \
        pandoc-citeproc \
        python3-pip

RUN pip3 install pandoc-fignos

COPY Makefile /miktex/work/
