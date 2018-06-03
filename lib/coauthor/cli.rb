require 'thor'
require 'colorize'
require 'coauthor/setup'

module Coauthor
  class CLI < Thor
    PAIR_CONFIG_FILE = '~/.coauthors'.freeze
    PAIR_FILE_PATH = File.expand_path(PAIR_CONFIG_FILE)

    desc 'setup', 'Create a configuration file for Github Coauthoring'
    def setup
      Coauthor::Setup.new.call
    end

    desc 'commit', 'Default command. Make a commit with the coauthor configuration'
    def commit
      return puts system("git commit --template #{PAIR_CONFIG_FILE}") if File.file?(PAIR_FILE_PATH)
      puts `echo "Run coauthor setup before committing with coauthor"`
    end
    default_task :commit
  end
end
