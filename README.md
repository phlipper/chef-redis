# chef-redis

## Description

This cookbook installs [Redis](http://redis.io) from Chris Lea's [ppa archive](https://launchpad.net/~chris-lea/+archive/redis-server).

Redis is an open source, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.


## Requirements

### Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu


## Recipes

* `redis` - The default recipe. Setup apt with ppa details.
* `redis::server` - Install the Redis server.
* `redis::doc` - Install the Redis documentation.

# Usage

This cookbook installs the Redis components if not present, and pulls updates if they are installed on the system.


## Attributes

```ruby
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
default["redis"]["rdbcompression"]              = "yes"
default["redis"]["dbfilename"]                  = "dump.rdb"
default["redis"]["dir"]                         = "/var/lib/redis"
default["redis"]["slaveof"]                     = ""
default["redis"]["masterauth"]                  = ""
default["redis"]["slave_serve_stale_data"]      = "yes"
default["redis"]["repl_ping_slave_period"]      = 10
default["redis"]["repl_timeout"]                = 60
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
default["redis"]["slowlog_log_slower_than"]     = 10000
default["redis"]["slowlog_max_len"]             = 1024
default["redis"]["vm_enabled"]                  = "no"
default["redis"]["vm_swap_file"]                = "/var/lib/redis/redis.swap"
default["redis"]["vm_max_memory"]               = 0
default["redis"]["vm_page_size"]                = 32
default["redis"]["vm_pages"]                    = 134217728
default["redis"]["vm_max_threads"]              = 4
default["redis"]["hash_max_zipmap_entries"]     = 512
default["redis"]["hash_max_zipmap_value"]       = 64
default["redis"]["list_max_ziplist_entries"]    = 512
default["redis"]["list_max_ziplist_value"]      = 64
default["redis"]["set_max_intset_entries"]      = 512
default["redis"]["zset_max_ziplist_entries"]    = 128
default["redis"]["zset_max_ziplist_value"]      = 64
default["redis"]["activerehashing"]             = "yes"
default["redis"]["include_config_files"]        = []
```


## Basic Settings

None


## Contributing

This cookbook could have way more personality... Help make it so!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

**chef-redis**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2012/license.html).
* Copyright (c) 2012 Phil Cohen (github@phlippers.net) [![endorse](http://api.coderwall.com/phlipper/endorsecount.png)](http://coderwall.com/phlipper)
* http://phlippers.net/
