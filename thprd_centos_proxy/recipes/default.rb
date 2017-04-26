#
# Cookbook:: thprd_centos_proxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#make sure that the /etc/yum.conf has the proxy setting
template '/etc/yum.conf' do
  source 'yum.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

##Make sure that the /etc/profile has the proxy setting
template '/etc/profile' do
  source 'profile.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
