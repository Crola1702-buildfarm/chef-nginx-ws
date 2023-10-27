#
# Cookbook:: nginx_web_server
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

key = data_bag_item('key_databag', 'sops-key')

package 'nginx' do
    action :install
end

service 'nginx' do
    action [ :enable, :start ]
end

cookbook_file "/var/www/html/index.html" do
  source "index.html"
  mode "0644"
end

template "/etc/nginx/nginx.conf" do   
  source "nginx.conf.erb"
  notifies :reload, "service[nginx]"
end

file '/home/key' do
  content key['key']
  action :create
end

