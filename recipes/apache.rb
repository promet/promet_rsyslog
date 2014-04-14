#
# Cookbook Name:: rsyslog-cookbook
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

template "#{node['rsyslog']['config_prefix']}/rsyslog.d/51-apache.conf" do
  source    "51-apache.conf.erb"
  owner     'root'
  group     'root'
  mode      '0644'
  variables(:servers => rsyslog_servers)
  notifies  :restart, "service[#{node['rsyslog']['service_name']}]"
  only_if   { node['rsyslog']['remote_logs'] }
end
