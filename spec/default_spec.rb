require "spec_helper"

describe "redis::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it { expect(chef_run).to add_apt_repository("chris-lea-redis-server") }

  # debian family setup
  context "using debian platform" do
    let(:chef_run) do
      env_options = { platform: "debian", version: "6.0.5" }
      ChefSpec::SoloRunner.new(env_options).converge(described_recipe)
    end

    it { expect(chef_run).to add_apt_repository("dotdeb") }
  end
end
