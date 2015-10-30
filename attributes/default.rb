# Initial configuration

default['jku-stridercd']['admin-email'] = "admin@#{node['fqdn']}"
default['jku-stridercd']['admin-password'] = 'password'

# System

default['jku-stridercd']['server-name'] = node['fqdn']
default['jku-stridercd']['server-port'] = 8001
default['jku-stridercd']['log-file'] = '/var/log/strider.sys.log'
default['jku-stridercd']['pid-file'] = '/tmp/strider.pid'
default['jku-stridercd']['system-user'] = 'strider'
default['jku-stridercd']['service-name'] = 'strider'

# MongoDB

default['jku-stridercd']['db-uri'] = 'mongodb://localhost/strider-foss'

# SMTP

default['jku-stridercd']['smtp-host'] = nil
default['jku-stridercd']['smtp-port'] = 587
default['jku-stridercd']['smtp-user'] = nil
default['jku-stridercd']['smtp-pass'] = nil
default['jku-stridercd']['smtp-from'] = "Strider from #{node['fqdn']}"

# GitHub integration

default['jku-stridercd']['github-appid'] = nil
default['jku-stridercd']['github-appsecret'] = nil
