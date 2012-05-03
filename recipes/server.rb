#
# Cookbook Name:: redis
# Recipe:: server
#

include_recipe "redis::default"

package "redis-server"

service "redis-server" do
  supports :restart => true
  action [ :enable, :start ]
end

template "/etc/redis/redis.conf" do
  source "redis.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  action :create
  notifies :restart, "service[redis-server]"
end
