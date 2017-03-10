#!/bin/sh

if [ $APP_NAME = "nimbus" ]; then
   sed -i -e "s/%nimbus%/`hostname -i`/g" $STORM_HOME/conf/storm.yaml
else
   sed -i -e "s/%nimbus%/$NIMBUS_ADDR/g" $STORM_HOME/conf/storm.yaml
fi

sed -i -e "s/%zookeeper%/$ZK_ADDR/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
