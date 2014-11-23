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
  60  => 10_000
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
default["redis"]["slowlog_log_slower_than"]     = 10_000
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
