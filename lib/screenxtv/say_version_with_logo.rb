require 'screenxtv/version'
require 'screenxtv/logo'
require 'active_support/concern'

module SayVersionWithLogo
  extend ActiveSupport::Concern

  included do
    no_tasks do
      def say_version_with_logo
        shell.say ScreenXTV::LOGO
        shell.say
        shell.say "ScreenX TV Ruby Client #{ScreenXTV::VERSION}\n"
        shell.say
      end
    end
  end
end
