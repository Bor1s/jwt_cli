module JwtCli
  class Runner < Thor
    desc 'start [DEFAULT COMMAND]', 'Add required fields and start Json Web Token generation'
    def start
      say 'Starting with Json Web Tokens generation.'

      builder = JwtCli::InputBuilder.new
      builder.add_user_id
      ask_for_email(builder)
      ask_for_additional_info(builder)
      builder.build
    end

    default_task :start

    private

    def ask_for_email(builder, keep_asking=true)
      while keep_asking
        begin
          builder.add_email!
          keep_asking = false
        rescue JwtCli::InputBuilder::InvalidEmailError => e
          say e
        end
      end
    end

    def ask_for_additional_info(builder)
      while yes?('Any additional inputs? (yes/no)')
        builder.add_additional_information
      end
    end
  end
end
