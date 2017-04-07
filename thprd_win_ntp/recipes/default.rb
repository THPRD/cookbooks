#
# Cookbook:: thprd_win_ntp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
registry_key "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DateTime\\Servers" do
  values [{:name => '1', :type => :string, :data => 'time.thprd.org'},
         ]
  action :create
end
registry_key "HKLM\\SYSTEM\\CurrentControlSet\\services\\W32Time\\Parameters" do
  values [{:name => 'NtpServer', :type => :string, :data => 'time.thprd.org'},
         ]
  action :create
end
