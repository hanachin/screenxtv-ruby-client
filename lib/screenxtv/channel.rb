require 'screenxtv/host'

module ScreenXTV
  class Channel
    DEFAULT_CHANNEL_NAME = 'default'

    attr_accessor :settings

    def initialize(settings)
      self.settings = settings || {}
    end

    def shell
      @shell ||= Thor::Shell::Basic.new
    end

    def config
      config_url
      config_color
      config_title
    end

    private

    def config_url
      self.settings[:url] = shell.ask %|Create a new URL. If given "foo", your URL will be "http://#{ScreenXTV::HOST}/foo".\n|
    end

    def config_color
      self.settings[:color] = shell.ask %|Terminal Color\n|, limited_to: %w(black white green novel)
    end

    def config_title
      self.settings[:title] = shell.ask %|Title\n|
    end
  end
end
