#
# Cookbook Name:: rsyslog-cookbook
# Recipe:: papertrail
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# Install the gem using the rbenv resource.
rbenv_gem "remote_syslog" do
  action :install
end

template "/etc/rsyslog.d/60-remotepapertrail.conf" do
  source    "60-remotepapertrail.conf.erb"
  owner     'root'
  group     'root'
  mode      '0644'
  notifies  :restart, "service[#{node['rsyslog']['service_name']}]"
end
