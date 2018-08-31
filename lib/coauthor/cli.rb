require 'thor'
require 'colorize'

Gem.find_files('coauthor/git/**/*.rb').each { |path| require path }

module Coauthor
  class CLI < Thor
    SETUP_DESCRIPTION = 'Create a template file for Github Coauthoring'.freeze
    desc 'setup', SETUP_DESCRIPTION
    def setup
      puts SETUP_DESCRIPTION.colorize(:blue)
      Coauthor::Git::Template.call
    end

    COMMIT_DESCRIPTION = 'Git commit with the coauthor template file'.freeze
    desc 'commit', COMMIT_DESCRIPTION
    def commit
      puts COMMIT_DESCRIPTION.colorize(:blue)
      Coauthor::Git::Commit.call
    end
    default_task :commit

    GIT_USER_DESCRIPTION = 'Set the default git user for the current repository'.freeze
    desc 'git_user', GIT_USER_DESCRIPTION
    def git_user
      puts GIT_USER_DESCRIPTION.colorize(:blue)
      Coauthor::Git::User.call
    end
  end
end
