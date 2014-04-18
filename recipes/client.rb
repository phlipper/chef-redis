#
# Cookbook Name:: redis
# Recipe:: client
#

include_recipe "redis::default"

default_action = node['redis']['auto_upgrade'] ? :upgrade : :install

package "redis-tools" do
  action default_action
end
