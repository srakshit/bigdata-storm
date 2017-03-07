#!/bin/sh

echo "Downloading and unzipping storm-$STORM_VERSION"
mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
url="$mirror/storm/apache-storm-$STORM_VERSION/apache-storm-$STORM_VERSION.tar.gz"
curl $url | tar xz -C /opt 
