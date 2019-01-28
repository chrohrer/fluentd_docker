#FROM fluent/fluentd:v0.12-onbuild
FROM fluent/fluentd:v1.3-onbuild-1

MAINTAINER Chris Rohrer chris.rohrer@ubuntunet.net

USER root

# elasticsearc plugin for sending to ES/Kibana
# tagged_udp plugin for forwarding eduroam F-TICKS 
RUN apk add --update --virtual .build-deps \
 sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-tagged_udp \
        fluent-plugin-remote_syslog \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.5.0/cache/*.gem
