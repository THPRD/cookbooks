#
# Cookbook Name:: thprd_libre_office
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
chocolatey_package 'libreoffice' do
  action :install
  source '\\\\192.168.224.176\\choco_choco\\libreoffice'
end
