class DishesController < ApplicationController
    before_action :authenticate!
    #    dishes GET    /admin/dishes(.:format)          dishes#index
    def index
        @dishes = Dish.all
        @dish = Dish.new
    end
    #           POST   /admin/dishes(.:format)          dishes#create
    def create
        dish = Dish.create(dish_params)
        redirect_to dishes_path
    end
    #  new_dish GET    /admin/dishes/new(.:format)      dishes#new
    # def new
    #     @dish = Dish.new
    # end
    # edit_dish GET    /admin/dishes/:id/edit(.:format) dishes#edit
    def edit
        @dish = Dish.find(params[:id])
    end
    #      dish GET    /admin/dishes/:id(.:format)      dishes#show
    #           PATCH  /admin/dishes/:id(.:format)      dishes#update
    def update
        dish = Dish.find(params[:id])
        dish.update(dish_params)
        redirect_to dishes_path
    end
    #           PUT    /admin/dishes/:id(.:format)      dishes#update
    #           DELETE /admin/dishes/:id(.:format)      dishes#destroy
    def destroy
        Dish.destroy(params[:id])
        redirect_to dishes_path
    end

    private

    def dish_params
        params.require(:dish).permit(:name, :course, :price, :nuts, :shellfish, :dairy, :vegetarian)
    end

end
