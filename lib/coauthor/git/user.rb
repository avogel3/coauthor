require 'coauthor/prompt'

module Coauthor
  module Git
    class User
      attr_reader :name, :email
      def initialize(name:, email:)
        @name = name
        @email = email
        set_git_config
      end

      def self.call
        user_info = Prompt.fetch_user_info.first
        new(name: user_info['name'], email: user_info['email'])
      rescue SystemExit, Interrupt
        puts "\n...User setup cancelled".colorize(:red)
      end

      private

      def set_git_config
        system("git config user.name '#{name}'")
        system("git config user.email '#{email}'")
        puts "...DONE! Git repository author has been set to #{name} <#{email}>".colorize(:green)
      end
    end
  end
end
