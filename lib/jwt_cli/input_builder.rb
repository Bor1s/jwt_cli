require 'uri'

module JwtCli
  class InputBuilder
    InvalidEmailError = Class.new(StandardError)
    include Thor::Shell

    def initialize
      @storage = {}
    end

    def build
      @storage
    end

    def add_email!
      email = ask 'Enter EMAIL:'
      raise InvalidEmailError, 'Email format is invalid!' unless email_valid?(email)
      @storage[:email] = email
    end

    def add_user_id
      @storage[:user_id] = ask 'Enter USER_ID:'
    end

    def add_additional_information
      key = ask 'Enter key:'
      if @storage.key?(key)
        say "You have already enetered key #{key}. Please choose another one."
      else
        @storage[key] = ask "Enter value for #{key}:"
      end
    end

    private

    def email_valid?(email)
      email.match?(URI::MailTo::EMAIL_REGEXP)
    end
  end
end
