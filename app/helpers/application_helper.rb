module ApplicationHelper
    def current_user
        @current_user = @current_user || User.find(session[:user_id])
    end

    def authenticate!
        redirect_to users_path unless current_user
    end


end
