module Coauthor
  class Setup
    PAIR_CONFIG_FILE = '~/.coauthors'.freeze
    PAIR_FILE_PATH = File.expand_path(PAIR_CONFIG_FILE)

    attr_accessor :credentials

    def initialize
      @credentials = []
    end

    def call
      gather_coauthor_info
      write_coauthor_file
    rescue SystemExit, Interrupt
      puts "\n...Setup cancelled".colorize(:red)
    end

    private

    def gather_coauthor_info
      puts 'Welcome to Coauthor Setup'.colorize(:blue)
      2.times do |n|
        detail = {}
        color = info_color(n + 1)
        print "Enter commiter #{n + 1}'s name: ".colorize(color)
        detail['name'] = STDIN.gets.chomp
        print "Enter commiter #{n + 1}'s email: ".colorize(color)
        detail['email'] = STDIN.gets.chomp
        credentials << detail
      end
    end

    def info_color(iter)
      iter.even? ? :magenta : :yellow
    end

    def write_coauthor_file
      File.open(PAIR_FILE_PATH, 'w+') do |file|
        file.puts
        credentials.each do |detail|
          file.write("\nCo-authored-by: #{detail['name']} <#{detail['email']}>")
        end
      end
    end
  end
end
