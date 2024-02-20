FROM ubuntu

RUN apt-get update
RUN apt-get purge pandoc

RUN apt-get install -y wget
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.2/pandoc-3.1.2-1-amd64.deb
RUN dpkg -i pandoc-3.1.2-1-amd64.deb

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -yq texlive-xetex texlive-lang-chinese

RUN apt-get install -y git
RUN git config --global pull.ff only
