require 'thor'
require 'screenxtv/config'
require 'screenxtv/channel'
require 'screenxtv/global_help_with_logo'
require 'screenxtv/say_version_with_logo'

module ScreenXTV
  class CLI < Thor
    include GlobalHelpWithLogo
    include SayVersionWithLogo

    desc "version", "display ScreenX TV client version and exit"
    def version
      say_version_with_logo
      exit 0
    end

    desc "start [CHANNEL_NAME]", "Start broadcasting"
    def start(channel_name = Channel::DEFAULT_CHANNEL_NAME)
      unless channel_exists?(channel_name)
        config(channel_name)
      end
      # start broad casting
    end

    desc "config [CHANNEL_NAME]", "Config your channel setting"
    def config(channel_name = Channel::DEFAULT_CHANNEL_NAME)
      c = self.screenx_config
      c.channels[channel_name] = Channel.configure(c.channels[channel_name].to_h)
      self.screenx_config = c
    end

    class_option :"config-file", type: :string, aliases: '-c', desc: 'Config file'

    no_tasks do
      def screenx_config=(c)
        ScreenXTV::Config.dump(options['config-file'], c)
      end

      def screenx_config
        ScreenXTV::Config.load(options['config-file'])
      end

      def channel_exists?(channel_name = Channel::DEFAULT_CHANNEL_NAME)
        !self.screenx_config.channels[channel_name].nil?
      end
    end
  end
end
