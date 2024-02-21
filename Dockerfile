FROM ubuntu

RUN apt-get update
RUN apt-get purge pandoc

RUN apt-get install -y wget
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.12.1/pandoc-3.1.12.1-1-amd64.deb
RUN dpkg -i pandoc-3.1.12.1-1-amd64.deb

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -yq texlive-latex-extra texlive-xetex

RUN wget https://github.com/google/fonts/raw/main/ofl/notosanssc/NotoSansSC%5Bwght%5D.ttf
RUN apt-get install -yq ttf-mscorefonts-installer
RUBN fc-add NotoSansSC%5Bwght%5D.ttf
RUN mkdir -p /usr/local/share/fonts/NotoSansCJKSC
RUN cp *.ttf /usr/local/share/fonts/NotoSansCJKSC
RUN fc-cache -f -v
RUN mkfontscale
RUN mktexpk --upd-map
RUN texhash
RUN fc-list | grep NotoSans

RUN apt-get install -y git
RUN git config --global pull.ff only
