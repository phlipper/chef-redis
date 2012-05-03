maintainer        "Phil Cohen"
maintainer_email  "github@phlippers.net"
license           "MIT"
description       "Installs and configures Redis"
version           "0.1.1"

recipe "redis", "Sets up ppa apt repository"
recipe "redis::server", "Installs redis server"
recipe "redis::doc", "Installs redis documentation"

%w{ ubuntu debian }.each do |os|
  supports os
end
