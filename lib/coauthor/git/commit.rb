require 'coauthor/constants'

module Coauthor
  module Git
    module Commit
      include Constants

      def call
        return system("git commit --template #{PAIR_CONFIG_FILE}") if File.file?(PAIR_FILE_PATH)
        puts('Run coauthor setup before committing with Coauthor')
      end
    end
  end
end
