#
# Cookbook:: thprd_win_xampp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
# create directory
directory 'c:\xampp2'

#copy file from dev-db.thprd.org
remote_file 'c:\xampp2\xampp.zip' do
  source 'https://dev-db.thprd.org/xampp.zip'
end

#expand the new zip file
windows_zipfile 'c:\\' do
  source 'c:\xampp2\xampp.zip'
  action :unzip
  not_if {::File.exists?('c:/5.6.30-0-VC11.txt')}
end

#install/create apache service
execute 'httpd.exe' do
   command "c:\\xampp\\apache\\bin\\httpd.exe -k install"
    not_if {registry_key_exists?("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Apache2.4",
      :x86_64)
    }
end

#make sure apache is running
windows_service 'apache2.4' do
  action [:enable, :start]
end
