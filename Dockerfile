FROM srakshit/alpine-base

MAINTAINER Subham Rakshit

ENV STORM_HOME="/opt/storm" \
    STORM_VERSION="1.0.3"

ADD ./storm-download.sh /opt/
ADD ./storm-properties.sh /opt/

RUN apk add --no-cache python2 supervisor \
    && chmod +x /opt/storm-download.sh \
    && sleep 1 \
    && /opt/storm-download.sh \
    && rm /opt/storm-download.sh \
    && ln -s /opt/apache-storm-$STORM_VERSION $STORM_HOME \
    && mkdir -p /var/log/storm \
    && addgroup storm \
    && adduser -S -G storm storm \
    && chown storm:storm -R /opt/ \
    && chmod 754 /opt/ \
    && chown storm:storm -R /var/log/storm/ \
    && chmod 754 /var/log/storm/

ADD ./storm.yaml.template $STORM_HOME/conf/storm.yaml
