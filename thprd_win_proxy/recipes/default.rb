#
# Cookbook Name:: thprd_win_proxy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
proxy = URI.parse(Chef::Config[:http_proxy])
registry_key "HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings" do
  values [{:name => 'ProxyEnable', :type => :dword, :data => '1'},
          {:name => 'ProxyServer', :type => :string, :data => "#{'http=192.168.160.2:8080; https=192.168.160.2:8080'}"},
          {:name => 'ProxyOverride', :type => :string, :data => 'www.thprd.org;db.thprd.org'}
         ]
  action :create
end
