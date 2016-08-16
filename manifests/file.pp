define zabbix::file (
  $template = $zabbix::default_template) {

  if !defined(Class['zabbix']) {
    fail("You must include the zabbix base class before using any zabbix defined resources")
  }

  #FOLDERS
  file {"/etc/zabbix" :
       path => "/etc/zabbix",
       ensure => "directory"
  }

  file { "/etc/zabbix/zabbix_agent.d" :
       path => "/etc/zabbix/zabbix_agentd.d",
       ensure => "directory",
       owner => "root",
       group => "root",
       mode  => 644
  }

  #SCRIPTS CONF
  file { '/etc/zabbix/zabbix.agent.d/Informatech.conf':
    ensure  => file,
    backup  => false,
    content => template($template),
  }

  #SCRIPTS
  if $architecture == 'i686' or $architecture == 'i386' {
   file { "/etc/zabbix/scripts":
      source => "puppet:///modules/zabbix/scripts32",
      recurse => true,
      owner => "root",
      group => "root",
      mode  => 755,

    }
  }
  else {
     file { "/etc/zabbix/scripts":
        source => "puppet:///modules/zabbix/scripts64",
        recurse => true,
        owner => "root",
        group => "root",
        mode  => 755,
    }
 }
}
