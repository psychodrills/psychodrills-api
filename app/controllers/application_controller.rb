class ApplicationController < ActionController::API
    # calling authenticate method before every action
    before_action :authenticate_request
    
    attr_reader :current_user

    private

    # this method will authenticate the request with authentication token (before every actions in controller)
    # except the actions specified in controllers
    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
