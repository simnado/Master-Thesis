FROM asciidoctor/docker-asciidoctor:latest
WORKDIR /documents

RUN gem install asciidoctor-diagram
RUN gem install asciidoctor-bibtex

RUN gem install asciidoctor-latex --pre
RUN gem "prawn-gmagick"
# support .eps

#RUN apk add npm


RUN apk add --no-cache npm \
  && cd /root \
  && npm install -g mermaid.cli --unsafe-perm=true

ENV PATH="${PATH}:/root/node_modules/.bin"


CMD /bin/sh
