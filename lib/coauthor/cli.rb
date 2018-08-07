require 'thor'
require 'colorize'
require 'coauthor/setup'
require 'coauthor/constants'

module Coauthor
  class CLI < Thor
    include Constants

    desc 'setup', 'Create a configuration file for Github Coauthoring'
    def setup
      Coauthor::Setup.new.call
    end

    desc 'git_user', 'Set the default git user for the current repository'
    def git_user
      puts "Set this repository's git user".colorize(:blue)
      name = prompt_user_name
      email = prompt_user_email
      Coauthor::GitUser.call(email: email, name: name)
    end

    desc 'commit', 'Default command. Make a commit with the coauthor configuration'
    def commit
      return system("git commit --template #{PAIR_CONFIG_FILE}") if File.file?(PAIR_FILE_PATH)
      puts `echo "Run coauthor setup before committing with Coauthor"`
    end
    default_task :commit

    private

    def prompt_user_name
      puts "Enter the user's name:".colorize(:yellow)
      STDIN.gets.chomp
    end

    def prompt_user_email
      puts "Enter the author's email:".colorize(:yellow)
      STDIN.gets.chomp
    end
  end
end
