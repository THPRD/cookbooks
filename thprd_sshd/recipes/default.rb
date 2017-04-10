#
# Cookbook:: thprd_sshd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

service 'sshd' do
  action [:enable, :start]
end

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  owner 'root'
  group 'root'
  mode '0600'
  notifies :restart, 'service[sshd]', :immediately
end
