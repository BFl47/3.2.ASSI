class SessionController < ApplicationController
    def create
        raise StandardError.new(ENV["omniauth.auth"])
    end

    def destroy
    end

    def fail
        raise StandardError.new(ENV["omniauth.auth"])
    end
end
