require_relative "test_helper"

describe_recipe "redis::default" do
  let(:apt_path) do
    "/etc/apt/sources.list.d"
  end

  it "set up an apt repository" do
    repo = {
      "debian" => { name: "dotdeb", content: "dotdeb" },
      "ubuntu" => { name: "chris-lea-redis-server", content: "chris-lea" }
    }[node["platform"]]

    apt_file = "#{apt_path}/#{repo[:name]}.list"

    file(apt_file).must_exist
    file(apt_file).must_include repo[:content]
  end
end
