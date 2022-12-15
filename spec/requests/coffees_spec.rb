require 'rails_helper'

RSpec.describe "Coffees", type: :request do
  describe 'GET /index' do
    it 'can get a list of coffees' do  
    Coffee.create name: "Praline Latte", size: "6 ounces", milk_type: "Almond milk", bio: "I'm double nutty, but in a good way!", image: "https://media.istockphoto.com/id/505168330/photo/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks.jpg?s=612x612&w=0&k=20&c=h7v8kAfWOpRapv6hrDwmmB54DqrGQWxlhP_mTeqTQPA="
    
    get '/coffees'
    coffee = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(coffee.length).to eq(1)
    end
  end 
  describe 'POST /create' do
    it 'creates a coffee' do  
      coffee_params = {
        coffee: {
          name: 'Caramel Macchiato',
          size: '12 ounces',
          milk_type: 'Oat milk',
          bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
          image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    } 
      }
    post '/coffees', params: coffee_params
    expect(response).to have_http_status(200)
    coffee = Coffee.first
    expect(coffee.name).to eq "Caramel Macchiato"
    end
  end 
end