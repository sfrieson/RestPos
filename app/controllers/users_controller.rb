class UsersController < ApplicationController
    before_action :authenticate!
    # users       GET    /users(.:format)          users#index
    def index
        @users = User.all
    end
    #             POST    /users(.:format)          users#create
    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to login_path
    end
    # new_user    GET    /users/new(.:format)      users#new
    def new
        @user = User.new
    end
    # edit_user   GET    /users/:id/edit(.:format) users#edit
    def edit
        @user = User.find(session[:user_id])
    end
    # user        GET    /users/:id(.:format)      users#show
    #             PATCH  /users/:id(.:format)      users#update
    def update
        current_user.update(user_params)
        redirect_to login_path
    end
    #             PUT    /users/:id(.:format)      users#update
    #             DELETE /users/:id(.:format)      users#destroy
    def destroy
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :type)
    end
end
