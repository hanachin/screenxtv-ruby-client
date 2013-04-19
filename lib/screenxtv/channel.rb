require 'screenxtv/host'

module ScreenXTV
  class Channel
    DEFAULT_CHANNEL_NAME = 'default'

    class << self
      def shell
        Thor::Shell::Basic.new
      end

      def configure(channel_settings)
        channel_settings ||= {}

        channel_settings[:url]   = shell.ask %|Create a new URL. If given "foo", your URL will be "http://#{ScreenXTV::HOST}/foo".\n|
        channel_settings[:color] = shell.ask %|Terminal Color\n|, limited_to: %w(black white green novel)
        channel_settings[:title] = shell.ask %|Title\n|

        channel_settings
      end
    end
  end
end
