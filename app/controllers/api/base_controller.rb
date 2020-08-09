class Api::BaseController < ActionController::API
    def encode_tokken(payload={})
        exp=24.hours.from_now
        payload[:exp] = exp.to_i
        JWT.encode(payload,Rails.application.secrets.secret_key_base)

    end
    helper_method :encode_tokken
end