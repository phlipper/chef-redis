#
# Cookbook Name:: redis
# Recipe:: default
#

apt_repository "chris-lea-redis-server" do
  uri "http://ppa.launchpad.net/chris-lea/redis-server/ubuntu"
  distribution node["lsb"]["codename"]
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C7917B12"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end
