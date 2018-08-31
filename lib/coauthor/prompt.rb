module Coauthor
  module Prompt
    def user_name
      puts "Enter the user's name:".colorize(:yellow)
      STDIN.gets.chomp
    end
    module_function :user_name

    def user_email
      puts "Enter the author's email:".colorize(:yellow)
      STDIN.gets.chomp
    end
    module_function :user_email

    def fetch_user_info(user_count: 1)
      [].tap do |credentials|
        user_count.times do
          detail = {}
          detail['name'] = user_name
          detail['email'] = user_email
          credentials << detail if detail.keys.any?
        end
      end
    end
    module_function :fetch_user_info
  end
end
