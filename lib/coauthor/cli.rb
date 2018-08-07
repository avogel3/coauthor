require 'thor'
require 'colorize'
require 'coauthor/setup'
require 'coauthor/constants'

module Coauthor
  class CLI < Thor
    template_description = 'Create a template file for Github Coauthoring'
    desc 'template', template_description
    def template
      puts template_description.colorize(:blue)
      ::Git::Template.call
    end

    git_user_description = 'Set the default git user for the current repository'
    desc 'git_user', git_user_description
    def git_user
      puts git_user_description.colorize(:blue)
      ::Git::User.call
    end

    commit_description = 'Git commit with the coauthor template file'
    desc 'commit', commit_description
    def commit
      puts commit_description.colorize(:blue)
      ::Git::Commit.call
    end
    default_task :commit
  end
end
