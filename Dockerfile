FROM srakshit/alpine-base

MAINTAINER Subham Rakshit

ENV STORM_HOME="/opt/storm" \
    STORM_VERSION="1.0.3"

ADD ./storm-download.sh /opt/

RUN apk add --no-cache python2 \
    && chmod +x /opt/storm-download.sh \
	&& sleep 1 \
    && /opt/storm-download.sh \
	&& rm /opt/storm-download.sh \
	&& ln -s /opt/apache-storm-$STORM_VERSION $STORM_HOME \
	&& addgroup storm \
    && adduser -S -G storm storm \
	&& chown storm:storm -R $STORM_HOME

USER storm

EXPOSE 3772 3773 6627
