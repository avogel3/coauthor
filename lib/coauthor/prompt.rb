module Coauthor
  module Prompt
    def user_name
      puts "Enter the user's name:".colorize(:yellow)
      STDIN.gets.chomp
    end

    def user_email
      puts "Enter the author's email:".colorize(:yellow)
      STDIN.gets.chomp
    end

    def fetch_user_info(user_count: 1)
      [].tap do |credentials|
        user_count.times do
          detail = {}
          detail['name'] = user_name if detail['name']
          detail['email'] = user_email if detail['email']
          credentials << detail
        end
      end
    end
  end
end
