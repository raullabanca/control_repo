class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqzSvC1bzM+z6nSlHUklDD/+mVBH8xnvKZepkVDLMUXnGqFFP94rrLLiovUcpRzoVNey8GzJboOirKDhyEVacsNM9XYPfOqdDBY+N8RU3HwEcVARLe4MZbvqy020CptoO8on8Cw2KCHToNPW2MG5UoDg5S5Xz9MWdTk1ZXpFX+beHUBp5J8bPE8dIfMyt3VaKGK7Hq20FlOh5CGiA+zmVHO70Ulp74zEjii+ygwGN4uUOtGMt0ewUaZLmoxT5qUtKP+ujOHTEFiWpUmUKPIK6fwM2x45ZnR/QjUo0Y0/ljd534vqSEH6oLCx+AtZzDnMBEDwfrufG/HjD3Vqm6rLL9',
  }
}
