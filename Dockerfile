#FROM fluent/fluentd:v0.12-onbuild
FROM fluent/fluentd:v1.1-onbuild

MAINTAINER Chris Rohrer chris.rohrer@ubuntunet.net

# elasticsearc plugin for sending to ES/Kibana
# tagged_udp plugin for forwarding eduroam F-TICKS 
RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-tagged_udp \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem