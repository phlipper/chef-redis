require_relative "test_helper"

describe_recipe "redis::server" do
  it "installed the `redis-server` package" do
    package("redis-server").must_be_installed
  end

  it "enabled the `redis-server` service" do
    service("redis-server").must_be_enabled
  end

  it "started the `redis-server` service" do
    service("redis-server").must_be_running
  end

  describe "data directory" do
    let(:dir) do
      directory node["redis"]["dir"]
    end

    it { dir.must_exist }
    it { dir.must_have :owner, "redis" }
    it { dir.must_have :group, "redis" }
    it { dir.must_have :mode, "750" }
  end

  describe "redis.conf" do
    let(:conf) do
      file "/etc/redis/redis.conf"
    end

    it { conf.must_exist }
    it { conf.must_have :owner, "root" }
    it { conf.must_have :group, "root" }
    it { conf.must_have :mode, "644" }
  end

  describe "`default` file" do
    let(:default) do
      file "/etc/default/redis-server"
    end

    it { default.must_exist }
    it { default.must_have :owner, "root" }
    it { default.must_have :group, "root" }
    it { default.must_have :mode, "644" }
  end
end
