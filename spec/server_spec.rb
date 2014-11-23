require "spec_helper"

describe "redis::server" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it { expect(chef_run).to include_recipe("redis::default") }

  describe "package installation" do
    describe "default action" do
      it { expect(chef_run).to install_package("redis-server") }
      it { expect(chef_run).to_not upgrade_package("redis-server") }
    end

    describe "when `auto_upgrade` is `true`" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new do |node|
          node.set["redis"]["auto_upgrade"] = true
        end.converge(described_recipe)
      end

      it { expect(chef_run).to_not install_package("redis-server") }
      it { expect(chef_run).to upgrade_package("redis-server") }
    end
  end

  it "creates the data directory" do
    expect(chef_run).to create_directory("/var/lib/redis").with(
      owner: "redis",
      group: "redis",
      mode: "0750",
      recursive: true
    )
  end

  it { expect(chef_run).to enable_service("redis-server") }
  it { expect(chef_run).to start_service("redis-server") }

  it "creates `/etc/redis/redis.conf`" do
    path = "/etc/redis/redis.conf"

    expect(chef_run).to create_template(path).with(
      source: "redis.conf.erb",
      owner:  "root",
      group:  "root",
      mode:   "0644"
    )

    expect(chef_run.template(path)).to(
      notify("service[redis-server]").to(:restart)
    )
  end

  it "creates `/etc/default/redis-server`" do
    path = "/etc/default/redis-server"

    expect(chef_run).to create_template(path).with(
      source: "default_redis-server.erb",
      owner:  "root",
      group:  "root",
      mode:   "0644"
    )

    expect(chef_run.template(path)).to(
      notify("service[redis-server]").to(:restart)
    )
  end
end
