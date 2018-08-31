require 'coauthor/constants'

module Coauthor
  module Git
    class Commit
      include Constants
      def self.call
        return system("git commit --template #{PAIR_CONFIG_FILE}") if File.file?(PAIR_FILE_PATH)
        puts('Run `coauthor setup` before committing with Coauthor').colorize(:red)
      end
    end
  end
end
