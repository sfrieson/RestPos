class UsersController < ApplicationController
    before_action :authenticate!
    # users       GET    /admin/users(.:format)          users#index
    def index
        @users = User.all
    end
    #             POST    /admin/users(.:format)          users#create
    def create
        user = User.create(user_params)
        redirect_to users_path
    end
    # new_user    GET    /admin/users/new(.:format)      users#new
    def new
        @user = User.new
    end
    # edit_user   GET    /admin/users/:id/edit(.:format) users#edit
    def edit
        @user = User.find(session[:user_id])
    end
    # user        GET    /admin/users/:id(.:format)      users#show
    #             PATCH  /admin/users/:id(.:format)      users#update
    def update
        current_user.update(user_params)
        redirect_to users_path
    end
    #             PUT    /admin/users/:id(.:format)      users#update
    #             DELETE /admin/users/:id(.:format)      users#destroy
    def destroy
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :position)
    end
end
