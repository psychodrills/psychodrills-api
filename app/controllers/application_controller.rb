class ApplicationController < ActionController::API

    # set the domain before every actions
    before_action :set_the_domain

    # calling authenticate method before every action
    before_action :authenticate_request, :except => [:set_the_domain]
    
    attr_reader :current_user

    # 
    def set_the_domain
        @domain_name = request.headers["hostname"]
    end

    private

    # this method will authenticate the request with authentication token (before every actions in controller)
    # except the actions specified in controllers
    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
