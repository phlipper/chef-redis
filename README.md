# chef-redis [![Build Status](https://travis-ci.org/phlipper/chef-redis.svg?branch=master)](https://travis-ci.org/phlipper/chef-redis)

## Description

This cookbook installs [Redis](http://redis.io) from Chris Lea's [ppa archive](https://launchpad.net/~chris-lea/+archive/redis-server).

Redis is an open source, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.


## Requirements

### Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu 12.04+
* Debian 6+

### Cookbooks

* [apt](http://community.opscode.com/cookbooks/apt)
* [minitest-handler](http://community.opscode.com/cookbooks/minitest-handler) _(suggested, not required)_


## Recipes

* `redis` - The default recipe. Setup apt with ppa details.
* `redis::server` - Install the Redis server.
* `redis::client` - Install the Redis client.

# Usage

This cookbook installs the Redis components if not present, and pulls updates if they are installed on the system.


## Attributes

```ruby
case node["platform"]
when "debian"
  default["redis"]["apt_distribution"]          = node["lsb"]["codename"]
  default["redis"]["apt_repository"]            = "dotdeb"
  default["redis"]["apt_uri"]                   = "http://packages.dotdeb.org"
  default["redis"]["apt_components"]            = ["all"]
  default["redis"]["apt_key"]                   = "http://www.dotdeb.org/dotdeb.gpg"
when "ubuntu"
  default["redis"]["apt_distribution"]          = node["lsb"]["codename"]
  default["redis"]["apt_repository"]            = "chris-lea-redis-server"
  default["redis"]["apt_uri"]                   = "http://ppa.launchpad.net/chris-lea/redis-server/ubuntu"
  default["redis"]["apt_components"]            = ["main"]
  default["redis"]["apt_keyserver"]             = "keyserver.ubuntu.com"
  default["redis"]["apt_key"]                   = "C7917B12"
end
default["redis"]["pidfile"]                     = "/var/run/redis/redis-server.pid"
default["redis"]["daemonize"]                   = "yes"
default["redis"]["port"]                        = 6379
default["redis"]["bind"]                        = "127.0.0.1"
default["redis"]["unixsocket"]                  = "/var/run/redis/redis.sock"
default["redis"]["unixsocketperm"]              = 755
default["redis"]["timeout"]                     = 300
default["redis"]["loglevel"]                    = "notice"
default["redis"]["logfile"]                     = "/var/log/redis/redis-server.log"
default["redis"]["syslog_enabled"]              = "no"
default["redis"]["syslog_ident"]                = "redis"
default["redis"]["syslog_facility"]             = "local0"
default["redis"]["databases"]                   = 16
default["redis"]["snapshots"]                   = {
  900 => 1,
  300 => 10,
  60  => 10000
}
default["redis"]["stop_writes_on_bgsave_error"] = "yes"
default["redis"]["rdbcompression"]              = "yes"
default["redis"]["rdbchecksum"]                 = "yes"
default["redis"]["dbfilename"]                  = "dump.rdb"
default["redis"]["dir"]                         = "/var/lib/redis"
default["redis"]["slaveof"]                     = ""
default["redis"]["masterauth"]                  = ""
default["redis"]["slave_serve_stale_data"]      = "yes"
default["redis"]["slave_read_only"]             = "yes"
default["redis"]["repl_ping_slave_period"]      = 10
default["redis"]["repl_timeout"]                = 60
default["redis"]["slave_priority"]              = 100
default["redis"]["requirepass"]                 = ""
default["redis"]["rename_commands"]             = []
default["redis"]["maxclients"]                  = 128
default["redis"]["maxmemory"]                   = "64mb"
default["redis"]["maxmemory_policy"]            = "volatile-lru"
default["redis"]["maxmemory_samples"]           = 3
default["redis"]["appendonly"]                  = "no"
default["redis"]["appendfilename"]              = "appendonly.aof"
default["redis"]["appendfsync"]                 = "everysec"
default["redis"]["no_appendfsync_on_rewrite"]   = "no"
default["redis"]["auto_aof_rewrite_percentage"] = 100
default["redis"]["auto_aof_rewrite_min_size"]   = "64mb"
default["redis"]["lua_time_limit"]              = 5000
default["redis"]["slowlog_log_slower_than"]     = 10000
default["redis"]["slowlog_max_len"]             = 1024
default["redis"]["hash_max_ziplist_entries"]    = 512
default["redis"]["hash_max_ziplist_value"]      = 64
default["redis"]["list_max_ziplist_entries"]    = 512
default["redis"]["list_max_ziplist_value"]      = 64
default["redis"]["set_max_intset_entries"]      = 512
default["redis"]["zset_max_ziplist_entries"]    = 128
default["redis"]["zset_max_ziplist_value"]      = 64
default["redis"]["activerehashing"]             = "yes"
default["redis"]["client_output_buffer_limit"]  = {
  "normal" => "0 0 0",
  "slave"  => "256mb 64mb 60",
  "pubsub" => "32mb 8mb 60"
}
default["redis"]["include_config_files"]        = []
default["redis"]["ulimit"]                      = ""
default["redis"]["auto_upgrade"]                = false
```


## Basic Settings

* `node["redis"]["ulimit"]` - Sets the maximum number of file descriptors for the Redis process. If this is unset or empty, the limit is the system default. The default may not be high enough to handle a large number of concurrent connections. See [Redis Clients Handling](http://redis.io/topics/clients).


## Contributors

Many thanks go to the following [contributors](https://github.com/phlipper/chef-redis/graphs/contributors) who have helped to make this cookbook even better:

* **[@smoil](https://github.com/smoil)**
  * `redis.conf` updates for Redis 2.6
* **[@svend](https://github.com/svend)**
  * add attribute to set ulimit
* **[@maciej](https://github.com/maciej)**
  * ensure `node["redis"]["dir"]` exists
* **[@dwradcliffe](https://github.com/dwradcliffe)**
  * allow bind to all interfaces
* **[@duggan](https://github.com/duggan)**
  * allow customizable apt sources

## Contributing

This cookbook could have way more personality... Help make it so!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

**chef-redis**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2012-2014/license.html).
* Copyright (c) 2012-2014 Phil Cohen (github@phlippers.net) [![endorse](http://api.coderwall.com/phlipper/endorsecount.png)](http://coderwall.com/phlipper)  [![Gittip](http://img.shields.io/gittip/phlipper.png)](https://www.gittip.com/phlipper/)
* http://phlippers.net/
