require "spec_helper"

describe "redis::client" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it { expect(chef_run).to include_recipe("redis::default") }

  describe "package installation" do
    describe "default action" do
      it { expect(chef_run).to install_package("redis-tools") }
      it { expect(chef_run).to_not upgrade_package("redis-tools") }
    end

    describe "when `auto_upgrade` is `true`" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new do |node|
          node.set["redis"]["auto_upgrade"] = true
        end.converge(described_recipe)
      end

      it { expect(chef_run).to_not install_package("redis-tools") }
      it { expect(chef_run).to upgrade_package("redis-tools") }
    end
  end
end
