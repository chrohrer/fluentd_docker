#FROM fluent/fluentd:v0.12-onbuild
FROM fluent/fluentd:v1.1-onbild

MAINTAINER Chris Rohrer chris.rohrer@ubuntunet.net

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \

 # cutomize following instruction as you wish
 && sudo gem install \
        fluent-plugin-elasticsearch \
        #fluent-plugin-secure-forward \

 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

EXPOSE 24284
