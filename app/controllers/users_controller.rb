class UsersController < ApplicationController
    before_action :authenticate!
    # users       GET    /admin/users(.:format)          users#index
    def index
        @users = User.all
    end
    #             POST    /admin/users(.:format)          users#create
    def create
        if params[:user][:username]== ""
            user = params[:user]
            user[:username] = "#{user[:first_name].camelize(:lower)}.#{user[:last_name].camelize(:lower)}"
            user[:password] = "#{user[:first_name].camelize(:lower)}1"
        end
        binding.pry
        user = User.create(user_params)
        if user.save
            redirect_to users_path
        else

            flash[:error] = user.errors.full_messages
            redirect_to new_user_path
        end
    end
    # new_user    GET    /admin/users/new(.:format)      users#new
    def new
        if current_user.position == "Manager"
            @user = User.new
        else
            redirect_to users_path
        end
    end
    # edit_user   GET    /admin/users/:id/edit(.:format) users#edit
    def edit
        if current_user.position == "Manager"
            @user = User.find(params[:id])
        else
            redirect_to users_path
        end
    end
    # user        GET    /admin/users/:id(.:format)      users#show
    #             PATCH  /admin/users/:id(.:format)      users#update
    #             PUT    /admin/users/:id(.:format)      users#update
    def update
        User.find(params[:id]).update(user_params)
        redirect_to users_path
    end

    #             DELETE /admin/users/:id(.:format)      users#destroy
    def destroy
        User.destroy(params[:id])
        redirect_to users_path
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :position, :pin, :first_name, :last_name, :cellphone)
    end
end
