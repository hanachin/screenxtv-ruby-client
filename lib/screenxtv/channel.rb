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
    def current_url
      if self.settings[:url]
        "http://#{ScreenXTV::HOST}/#{self.settings[:url]}"
      end
    end

    def current_color
      self.settings[:color]
    end

    def current_title
      self.settings[:title]
    end

    def ask_with_default(default)
      s = shell.ask(">")
      s.empty? ? default : s
    end

    def prev_value_if_just_enter(prev_value,&block)

    end

    def config_url
      shell.say %|Create a new URL. If given "foo", your URL will be "http://#{ScreenXTV::HOST}/foo".|
      shell.say %|Just enter to use current url #{current_url}| if current_url
      self.settings[:url] = ask_with_default(current_url)
    end

    def config_color
      shell.say %|Terminal Color [black white green novel]|
      shell.say %|Just enter to use current color #{current_color}| if current_color
      self.settings[:color] = ask_with_default(current_color)
    end

    def config_title
      shell.say %|Title|
      shell.say %|Just enter to use current title #{current_title}| if current_title
      self.settings[:title] = ask_with_default(current_title)
    end
  end
end
