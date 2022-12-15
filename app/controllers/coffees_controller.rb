class CoffeesController < ApplicationController
def index
    @coffees = Coffee.all
    render json: @coffees
end 
def create
    @coffee=Coffee.create(coffee_params)
    render json: @coffee
end

private 
def coffee_params
    params.require(:coffee).permit(:name, :size, :milk_type, :bio, :image)
end
end