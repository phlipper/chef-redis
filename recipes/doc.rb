#
# Cookbook Name:: redis
# Recipe:: doc
#

include_recipe "redis::default"

package "redis-doc"
