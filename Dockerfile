FROM ubuntu

RUN apt-get update
RUN apt-get purge pandoc
RUN apt-get install -y wget
RUN wget https://github.com/jgm/pandoc/releases/download/2.18/pandoc-2.18-1-amd64.deb
RUN dpkg -i pandoc-2.18-1-amd64.deb
RUN apt-get install -y texlive-xetex
