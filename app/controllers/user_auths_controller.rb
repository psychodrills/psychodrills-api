class UserAuthsController < ApplicationController
    skip_before_action :authenticate_request, :only => [:authenticate]

    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])
        puts current_user.inspect
        if command.success?
            render json: { auth_token: command.result, status: 200 }
        else
            render json: { error: command.errors, status: 400 }
        end
    end

    # def show_user
    #     render json: { msg: "authorized_user", status: 200}
    # end
end
