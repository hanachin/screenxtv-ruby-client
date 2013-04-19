require 'ostruct'
require 'yaml'
require 'tempfile'

module ScreenXTV
  class Config
    DEFAULT_CONFIG_PATH  = "#{ENV['HOME']}/.screenxtv.yml"

    def initialize(config_file_path = nil)
      load_or_create_config(config_file_path)
    end

    def load_or_create_config(config_file_path)
      @config_file_path = File.expand_path(config_file_path || DEFAULT_CONFIG_PATH)
      if File.exists?(@config_file_path)
        load_config
      else
        create_config
      end
    end

    def load_config
      @data = OpenStruct.new YAML.load_file @config_file_path
    end

    def create_config
      @data = new_config
      save
    end

    def new_config
      OpenStruct.new({
        channels: {}
      })
    end

    def channels
      @data.channels
    end

    def save
      tempfile = Tempfile.open('screenxtv')
      tempfile.write YAML.dump(@data.to_h)
      tempfile.close
      FileUtils.mv(tempfile.path, @config_file_path)
    end
  end
end
