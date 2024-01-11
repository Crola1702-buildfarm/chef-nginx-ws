#
# Cookbook:: nginx_web_server
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

bash 'install_sops' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  curl -LO https://github.com/getsops/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64
  mv sops-v3.8.1.linux.amd64 /usr/local/bin/sops
  chmod +x /usr/local/bin/sops  
  echo "Installed sops version: $(sops --version)"
  EOH
end

puts "KEY outside resources: #{ENV['SOPS_AGE_KEY']}"
puts "Other environment #{ENV['other']}"
puts "ENV: #{ENV}"

bash 'decrypt_data_bags' do
  user 'root'
  cwd '/home/ubuntu/'
  default_env true
  environment 'SOPS_AGE_KEY' => ENV['SOPS_AGE_KEY']
  code <<-EOH
  echo "Current key: $(echo $SOPS_AGE_KEY)"
  sops -d -i chef-nginx-ws/crola-chef/data_bags/key_databag/sops-key.json
  EOH
end

#key = data_bag_item('key_databag', 'sops-key')

#package 'nginx' do
#    action :install
#end

#service 'nginx' do
#    action [ :enable, :start ]
#end

#cookbook_file "/var/www/html/index.html" do
#  source "index.html"
#  mode "0644"
#end

#template "/etc/nginx/nginx.conf" do
#  source "nginx.conf.erb"
#  notifies :reload, "service[nginx]"
#end

#file '/home/key' do
#  content key['key']
#  action :create
#end

