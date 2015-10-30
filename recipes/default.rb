#
# Cookbook Name:: jku-stridercd
# Recipe:: default
#
# Copyright 2015, Jakub Kułak
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# make sure mongo is installed
# make sure nodejs is installed
# make sure git is installed

# Add strider system user
user node['jku-stridercd']['system-user'] do
  comment 'Strider CD user'
  home "/home/#{node['jku-stridercd']['system-user']}"
  shell '/bin/bash'
  manage_home true
  # password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
end

# Install Strider from npm
nodejs_npm 'strider' do
  not_if do ::File.exists?('/usr/lib/node_modules/strider/bin/strider') end
end

# Add admin user
# $ strider addUser
execute "Add initial admin user" do
  command "strider addUser -l #{node['jku-stridercd']['admin-email']} -p #{node['jku-stridercd']['admin-password']} -a true"
  only_if "mongo strider-foss --eval 'printjson(db.users.count())' --quiet | grep 0"
end

# Create init script (default: /etc/init/strider.conf)
template "/etc/init/#{node['jku-stridercd']['service-name']}.conf" do
    source 'strider.conf.erb'
    variables('params' => node['jku-stridercd'])
end

# Create log file
file node['jku-stridercd']['log-file'] do
  mode '0755'
  owner node['jku-stridercd']['system-user']
  # group node['jku-stridercd']['system-user']
  not_if do ::File.exists?(node['jku-stridercd']['log-file']) end
end

# Start Strider CD service
execute "Stop Strider CD service if it's running" do
  command "stop #{node['jku-stridercd']['service-name']}"
  only_if do ::File.exists?(node['jku-stridercd']['pid-file']) end
end

# Start Strider CD service
execute "Start Strider CD service if it's not running" do
  command "start #{node['jku-stridercd']['service-name']}"
  not_if do ::File.exists?(node['jku-stridercd']['pid-file']) end
end

log "Strider available at: http://#{node['jku-stridercd']['server-name']}/"
