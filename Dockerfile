FROM alpine:3.2 
MAINTAINER Mike Scott <mike.scott@sqs.com>

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler
ENV APP_DIR /usr/app

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

# Add APP_DIR
RUN mkdir $APP_DIR
WORKDIR $APP_DIR


