# 
class JsonWebToken
    class << self

        # this will create authentication token by using userId, the expiration time, 
        # unique base key of Rails application
        def encode(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end

        # this will decode the token by Rails application secret key
        def decode(token)
            body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
            HashWithIndifferentAccess.new body
        rescue
            nil
        end
    end
end