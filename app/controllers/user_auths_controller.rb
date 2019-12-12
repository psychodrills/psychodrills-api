class UserAuthsController < ApplicationController
    skip_before_action :authenticate_request, :only => [:authenticate]

    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
            render json: { auth_token: command.result }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end

    def show_user
        puts "\n\n\n\n #{@current_user.inspect}"
    end
end
