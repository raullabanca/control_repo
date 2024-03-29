class minecraft {
  file { '/opt/minecraft':
    ensure => directory,
  }
  
  file { '/opt/minecraft/minecraft_server.jar':
    ensure => present,
    source => 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  }
  
  package { 'java':
    ensure => present,
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure => present,
    content => 'eula=true',
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  
  exec { '/usr/bin/systemctl daemon-reload':
    refreshonly => true,
  }
  
  service { 'minecraft':
    ensure => running,
    enable => true,
    require => Exec['/usr/bin/systemctl daemon-reload'],
  }
}
