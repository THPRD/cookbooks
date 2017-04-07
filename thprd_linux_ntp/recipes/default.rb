#
# Cookbook:: thprd_linux_ntp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

service 'ntpd' do
  action [:enable, :start]
end

template '/etc/ntp.conf' do
  source 'ntp.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[ntpd]', :immediately
end
