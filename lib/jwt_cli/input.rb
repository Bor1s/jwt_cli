module JwtCli
  class Input < Thor
    include Thor::Actions

    desc 'init [DEFAULT COMMAND]', 'Add required fields and start Json Web Token generation'
    def init
      say 'Starting with Json Web Tokens generation.'

      prepare_storage
      add_email
      add_user_id
      add_additional_information
      output_info
    end

    default_task :init

    private

    def prepare_storage
      @storage = {}
    end

    def add_email
      email = ask 'Enter EMAIL:'

      if valid_email?(email)
        @storage[:email] = email
      else
        say 'Email has not valid format!'
        add_email
      end
    end

    def add_user_id
      @storage[:user_id] = ask 'Enter USER_ID value:'
    end

    def add_additional_information
      add_info if yes?('Any additional inputs? (yes/no)')
    end

    def add_info
      key = ask 'Enter key:'
      if @storage.key?(key)
        say "You have already enetered key #{key}. Please choose another one."
        add_info
      else
        @storage[key] = ask "Enter value for #{key}:"
      end
      add_additional_information
    end

    def output_info
      say "#{@storage.inspect}"
    end

    def valid_email?(email)
      email.match?(URI::MailTo::EMAIL_REGEXP)
    end
  end
end
