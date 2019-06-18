#Author: Shoumik Hasan
#!/usr/bin/env bash

CURRENT_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk '{print $3}')
yum -y install java-1.8.0-openjdk
unlink /etc/alternatives/java
ln -s $CURRENT_HOME/bin/java /etc/alternatives/java
OPEN_HOME=$(find /usr/lib/jvm -type d -name "*openjdk*")
LINK_NAME=$(rpm -qa | grep openjdk | head -1 | cut -c 12-28)
ln -s $OPEN_HOME/jre/bin /opt/$LINK_NAME
