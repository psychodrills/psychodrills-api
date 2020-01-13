class Api::V1::UsersController < ApplicationController
    # this will skip the "authenticate request" before specified actions
    skip_before_action :authenticate_request, :only => [:login]

    # new user page
    def new

    end

    # create new user
    def create
        user = User.new(params[:user].permit(:first_name, :middle_name, :last_name, :email, :password))
        if user.save
            render json: { status: 200 }
        else
            render json: { error: user.errors, status: false }
        end
    end


    def login
        command = AuthenticateUser.call(params[:user_name], params[:password])

        if command.success?
            render json: { auth_token: command.result, request_status: true, request_message: "Login successfully", status: 200 }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end

    def show_user
        @current_user.user_account_confirmation
        if @current_user.errors.present?
            render json: { error: @current_user.errors }
        else
            render json: { status: 200}
        end
    end
end