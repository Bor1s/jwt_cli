require 'jwt'

module JwtCli
  class Token
    def self.generate(payload)
      # No password protection
      JWT.encode(payload, nil, 'none')
    end
  end
end
