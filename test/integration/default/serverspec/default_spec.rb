require "serverspec"

set :backend, :exec

describe "Redis client installation" do
  describe package("redis-tools") do
    it { should be_installed }
  end
end

describe "Redis server installation" do
  describe package("redis-server") do
    it { should be_installed }
  end

  describe file("/var/lib/redis") do
    it { should be_a_directory }
    it { should be_owned_by "redis" }
    it { should be_grouped_into "redis" }
    it { should be_mode 750 }
  end

  describe service("redis-server") do
    it { should be_enabled }
    it { should be_running }
  end

  describe file("/etc/redis/redis.conf") do
    it { should be_a_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should be_mode 644 }
  end

  describe file("/etc/default/redis-server") do
    it { should be_a_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should be_mode 644 }
  end
end
