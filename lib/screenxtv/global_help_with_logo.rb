require 'screenxtv/say_version_with_logo'
require 'active_support/concern'

module GlobalHelpWithLogo
  extend ActiveSupport::Concern

  included do
    include SayVersionWithLogo

    class_option :help, type: :boolean, aliases: '-h', desc: 'Show this help message and quit'

    no_tasks do
      def help
        say_version_with_logo
        super
      end

      def invoke_command(command, *args)
        if options[:help]
          say_version_with_logo
          CLI.task_help(shell, command.name)
        else
          super
        end
      end
    end
  end
end
