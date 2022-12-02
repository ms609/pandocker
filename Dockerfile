FROM ubuntu

RUN sudo apt-get update
RUN sudo apt-get purge pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.18/pandoc-2.18-1-amd64.deb
RUN sudo dpkg -i pandoc-2.18-1-amd64.deb
RUN sudo apt-get install texlive-xetex
