require 'thor'

module Coauthor
  class CLI < Thor
    PAIR_CONFIG_FILE = '~/.coauthors'.freeze
    PAIR_FILE_PATH = File.expand_path(PAIR_CONFIG_FILE)

    desc 'setup', 'Create a configuration file for Github Coauthoring'
    def setup
      puts Dir.pwd
      credentials = []
      2.times do |n|
        detail = {}
        puts "Enter commiter #{n + 1}'s name:"
        detail['name'] = STDIN.gets.chomp
        puts "Enter commiter #{n + 1}'s email:"
        detail['email'] = STDIN.gets.chomp
        credentials << detail
      end

      File.open(PAIR_FILE_PATH, 'w+') do |file|
        file.puts
        credentials.each do |detail|
          file.write("\nCo-authored-by: #{detail['name']} <#{detail['email']}>")
        end
      end
    end

    desc 'commit', 'Default command. Make a commit with the coauthor configuration'
    def commit
      return puts system("git commit --template #{PAIR_CONFIG_FILE}") if File.file?(PAIR_FILE_PATH)
      puts `echo "Run coauthor setup before committing with coauthor"`
    end
    default_task :commit
  end
end
