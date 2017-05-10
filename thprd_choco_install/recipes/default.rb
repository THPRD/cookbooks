#
# Cookbook:: thprd_choco_install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# make sure these directories
directory 'c:\temp'
directory 'c:\temp\choco-install'

#copy file from tegile cifs share
remote_file 'c:\temp\chocolatey.0.10.5.zip' do
  source '\\\\192.168.224.176\choco_choco\chocolatey.0.10.5.zip'
  not_if { ::File.exists?('c:\temp\chocolatey.0.10.5.zip') }
end

#expand the new zip file
windows_zipfile 'c:\temp\choco-install' do
  source 'c:\temp\chocolatey.0.10.5.zip'
  action :unzip
  not_if { ::File.exists?('c:\temp\choco-install\chocolatey.0.10.5\installchocolatey.cmd') }
end

#install chocolatey if it is not insalled
execute 'c:\temp\choco-install\chocolatey.0.10.5\tools\installchocolatey.cmd' do
  command "c:\temp\choco-install\installchocolatey.cmd"
  not_if { ::File.exist?('c:\ProgramData\chocolatey\choco.exe') }
end
