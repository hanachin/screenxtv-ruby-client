require 'ostruct'
require 'yaml'
require 'tempfile'

module ScreenXTV
  class Config
    DEFAULT_CONFIG_PATH  = "#{ENV['HOME']}/.screenxtv.yml"

    class << self
      def load(config_file_path = nil)
        @config_file_path = File.expand_path(config_file_path || DEFAULT_CONFIG_PATH)
        unless File.exists?(@config_file_path)
          create_config_file
        end
        OpenStruct.new YAML.load_file @config_file_path
      end

      def dump(config_file_path = nil, config)
        @config_file_path = File.expand_path(config_file_path || DEFAULT_CONFIG_PATH)
        create_config_file(config.to_h)
      end

      def new_config
        {
          channels: {}
        }
      end

      def create_config_file(c = new_config)
        tempfile = Tempfile.open('screenxtv')
        tempfile.write YAML.dump(c)
        tempfile.close
        FileUtils.mv(tempfile.path, @config_file_path)
      end
    end
  end
end
