puppet-zabbix
=====
zabbix util scripts

modules
=====
* check bacula backups with auto discovery jobs (mysql/postgresql)
* check smart status
* check certificate (ssl) expire date
* check dhcp
* check file age (like to a mysql dump)
* check puppet agent
* check mail queue
* check rbl
* check samba

integrate with foreman
=====
```
cd /etc/puppet/environments/production/modules
git clone git@github.com:khony/puppet-zabbix.git
```

Now, just go to web interface and import

contributors
=====

* Fábio Miguel Mello (me)
* Bruno Guilherme Souza (https://github.com/brunogui0812) - Puppet Manifests
