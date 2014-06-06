#
# Cookbook Name:: redis
# Recipe:: server
#

include_recipe "redis::default"

package "redis-server" do
  action node["redis"]["auto_upgrade"] ? :upgrade : :install
end

directory node["redis"]["dir"] do
  owner "redis"
  group "redis"
  mode "0750"
  recursive true
end

service "redis-server" do
  supports restart: true
  action [:enable, :start]
end

template "/etc/redis/redis.conf" do
  source "redis.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  notifies :restart, "service[redis-server]"
end

template "/etc/default/redis-server" do
  source "default_redis-server.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  notifies :restart, "service[redis-server]"
end
