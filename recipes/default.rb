#
# Cookbook Name:: redis
# Recipe:: default
#

case node["platform"]
when "debian"
  apt_repository "dotdeb" do
    uri "http://packages.dotdeb.org"
    distribution node["lsb"]["codename"]
    components ["all"]
    key "http://www.dotdeb.org/dotdeb.gpg"
    action :add
  end
when "ubuntu"
  apt_repository "chris-lea-redis-server" do
    uri "http://ppa.launchpad.net/chris-lea/redis-server/ubuntu"
    distribution node["lsb"]["codename"]
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "C7917B12"
    action :add
  end
end
