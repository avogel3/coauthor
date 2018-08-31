require 'coauthor/constants'
require 'coauthor/prompt'

module Coauthor
  module Git
    class Template
      include Constants
      attr_reader :credentials
      def initialize(credentials:)
        @credentials = credentials
        write_file
      end

      def self.call
        credentials = Prompt.fetch_user_info(user_count: 2)
        return unless credentials
        new(credentials: credentials)
      rescue SystemExit, Interrupt
        puts "\n...Template setup cancelled".colorize(:red)
      end

      private

      def write_file
        File.open(PAIR_FILE_PATH, 'w+') do |file|
          credentials.each do |detail|
            file.write("\nCo-authored-by: #{detail['name']} <#{detail['email']}>")
          end
        end
        puts "...DONE! Coauthor file written to #{PAIR_CONFIG_FILE}\n".colorize(:green)
      end
    end
  end
end
