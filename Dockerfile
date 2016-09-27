## BUILDING
##   (from project root directory)
##   $ docker build -t php-for-shovey-bitnamistacksmith .
##
## RUNNING
##   $ docker run -p 9000:9000 php-for-shovey-bitnamistacksmith
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian:wheezy-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="3ljfgrf" \
    STACKSMITH_STACK_NAME="PHP for shovey/bitnamiStacksmith" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-5.6.26-1 --checksum b7a72ae78f9b19352bd400dfe027465c88a8643c0e5d9753f8d12f4ebae542a2

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# PHP base template
COPY . /app
WORKDIR /app

CMD ["php", "-a"]
