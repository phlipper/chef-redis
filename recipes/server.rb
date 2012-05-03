#
# Cookbook Name:: redis
# Recipe:: server
#

include_recipe "redis::default"

package "redis-server"
