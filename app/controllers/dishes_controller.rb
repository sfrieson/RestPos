class DishesController < ApplicationController
    #    dishes GET    /admin/dishes(.:format)          dishes#index
    def index
        @users = Dish.all
    end
    #           POST   /admin/dishes(.:format)          dishes#create
    def create
        dish = Dish.create(user_params)
        session[:user_id] = dish.id
        redirect_to login_path
    end
    #  new_dish GET    /admin/dishes/new(.:format)      dishes#new
    def new
        @dish = Dish.new
    end
    # edit_dish GET    /admin/dishes/:id/edit(.:format) dishes#edit
    def edit
        @dish = Dish.find(session[:user_id])
    end
    #      dish GET    /admin/dishes/:id(.:format)      dishes#show
    #           PATCH  /admin/dishes/:id(.:format)      dishes#update
    def update
        current_user.update(user_params)
        redirect_to login_path
    end
    #           PUT    /admin/dishes/:id(.:format)      dishes#update
    #           DELETE /admin/dishes/:id(.:format)      dishes#destroy
    def destroy
    end

    private

    def dish_params
        params.require(:dish).permit(:name, :type, :price, :price, :nuts, :shellfish, :dairy, :vegetarian)
    end

end
