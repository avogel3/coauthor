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

    desc 'commit', 'Default command. Make a commit with the coauthor configuration'
    def commit
      return system("git commit --template #{PAIR_CONFIG_FILE}") if File.file?(PAIR_FILE_PATH)
      puts `echo "Run coauthor setup before committing with Coauthor"`
    end
    default_task :commit
  end
end
