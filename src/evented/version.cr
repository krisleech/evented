require "yaml"

module Evented
  VERSION = (YAML.load(File.read("./shard.yml")) as Hash)["version"]
end
