#!/usr/bin/env bash

function build_html {
    docker run --rm -it -v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-diagram -o builds/html/index.html index.adoc
    cp ./images/* builds/html/images
}

function build_epub {
    docker run --rm -it -v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor-epub3 -r asciidoctor-diagram -o builds/liceo.epub index.adoc
}

function build_pdf {
    docker run --rm -it -v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -r asciidoctor-diagram -o builds/liceo.pdf index.adoc
    
}

function usage {
    echo "build.sh pdf|epub|all"
}

case $1 in
    html)
        build_html
        ;;
    pdf)
        build_pdf
        ;;
    epub)
        build_epub
        ;;
    all)
        build_pdf && build_epub && build_html
        ;;
    *)
        usage
        ;;
esac