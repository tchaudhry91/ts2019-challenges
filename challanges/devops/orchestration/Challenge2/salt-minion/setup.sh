#!/bin/bash -x

salt_minion_check () {
	if [ ! -f /var/log/salt/minion ]; then
  	  echo "File not found!" && \
          touch /var/log/salt/minion && \
	  salt_minion_check
	else
	  tail -f /var/log/salt/minion
	fi
}
echo "master: salt-master" >> /etc/salt/minion && \
echo "id: salt-minion-$(hostname)" >> /etc/salt/minion


if [ "${HOSTNAME}" == "salt-minion2" ];then
    echo "***** APACHE2 Stop"
    update-rc.d apache2 remove
    service apache2 stop
else
    service apache2 start
fi

service salt-minion start && \
salt_minion_check
