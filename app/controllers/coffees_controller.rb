class CoffeesController < ApplicationController
def index
    coffees = Coffee.all
    render json: coffees
end 
def create
    coffee = Coffee.create(coffee_params)
    if coffee.valid?
    render json: coffee
    else 
    render json: coffee.errors, status: 422
    end
end
def update 
    coffee = Coffee.find(params[:id])
    coffee.update(coffee_params)
    if coffee.valid?
    render json: coffee
    else
    render json: coffee.errors, status:422
end
end
private 
def coffee_params
    params.require(:coffee).permit(:name, :size, :milk_type, :bio, :image)
end
end 

