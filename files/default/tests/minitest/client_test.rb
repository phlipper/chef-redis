require_relative "test_helper"

describe_recipe "redis::client" do
  it "installed the `redis-tools` package" do
    package("redis-tools").must_be_installed
  end
end
