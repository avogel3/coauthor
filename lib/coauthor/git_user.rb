module Coauthor
  class GitUser
    attr_reader :name, :email
    def new(name:, email:)
      @name = name
      @email = email
    end

    def self.call(name:, email:)
      new(name: name, email: email).set_git_config
    end

    private

    def set_git_config
      system("git config user.name #{name}")
      system("git config user.email #{email}")
      puts "...DONE! Git repository author has been set to #{name} <#{email}>".colorize(:green)
    end
  end
end
