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
      it "doesn't create a coffee without a name" do  
        coffee_params = {
          coffee: {
            name: nil,
            size: '12 ounces',
            milk_type: 'Oat milk',
            bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
            image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
      } 
        }
      post '/coffees', params: coffee_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
      end
    it "doesn't create a coffee without a size" do  
      coffee_params = {
        coffee: {
          name: 'Dopio',
          milk_type: 'Oat milk',
          bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
          image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    } 
      }
    post '/coffees', params: coffee_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['size']).to include "can't be blank"
    end
    it "doesn't create a coffee without a milk_type" do  
      coffee_params = {
        coffee: {
          name: 'Dopio',
          size: '1.5 ounces',
          bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
          image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    } 
      }
    post '/coffees', params: coffee_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['milk_type']).to include "can't be blank"
    end
    it "doesn't create a coffee without a bio" do  
      coffee_params = {
        coffee: {
          name: 'Dopio',
          size: '1.5 ounces',
          milk_type: "almond milk",
          image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    } 
      }
    post '/coffees', params: coffee_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['bio']).to include "can't be blank"
    end
    it "doesn't create a coffee without an image" do  
      coffee_params = {
        coffee: {
          name: 'Dopio',
          size: '1.5 ounces',
          milk_type: "almond milk",
          bio: "hiiiiiiiiiiiii i ihnsgsnb"
    } 
      }
    post '/coffees', params: coffee_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
    end
    describe 'PATCH /update' do
      it 'can update a coffee at a particular ID' do  
        Coffee.create name:'Caramel Macchiato', size:'12 ounces',milk_type: 'Oat milk', bio: "I'm sweet, creamy, and to the point, ohweeeeee!", image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
        
        coffee_params = {
          coffee: {
            name: 'Caramel Macchiato', 
            size: '15 ounces',
            milk_type: 'Oat milk',
            bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
            image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
        }}
      coffee = Coffee.last
      patch "/coffees/#{coffee.id}", params: coffee_params
      # updated_coffee = Coffee.find(coffee.id)
      expect(response).to have_http_status(200)
      coffee = Coffee.last 
      expect(coffee.size).to eq('15 ounces')
      end
    end
    it 'cannot update a coffee at a particular ID without a name' do  
      Coffee.create name:'Caramel Macchiato', size:'12 ounces',milk_type: 'Oat milk', bio: "I'm sweet, creamy, and to the point, ohweeeeee!", image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  
    coffee_params = {
      coffee: {
        name: nil, 
        size: '15 ounces',
        milk_type: 'Oat milk',
        bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
        image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    }
      }
    coffee = Coffee.last
    patch "/coffees/#{coffee.id}", params: coffee_params
    updated_coffee = Coffee.find(coffee.id)
    expect(response).to have_http_status(422)
    json_response = JSON.parse(response.body)
    expect(json_response['name']).to include("can't be blank")
    end
    it 'cannot update a coffee at a particular ID without a size' do  
      Coffee.create name:'Caramel Macchiato', size:'12 ounces',milk_type: 'Oat milk', bio: "I'm sweet, creamy, and to the point, ohweeeeee!", image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    
    coffee_params = {
      coffee: {
        name: 'Caramel Macchiato',  
        size: nil,
        milk_type: 'Oat milk',
        bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
        image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    }
      }
    coffee = Coffee.last
    patch "/coffees/#{coffee.id}", params: coffee_params
    updated_coffee = Coffee.find(coffee.id)
    expect(response).to have_http_status(422)
    json_response = JSON.parse(response.body)
    expect(json_response['size']).to include("can't be blank")
    end
    it 'cannot update a coffee at a particular ID without a milk_type' do  
      Coffee.create name:'Caramel Macchiato', size:'12 ounces',milk_type: 'Oat milk', bio: "I'm sweet, creamy, and to the point, ohweeeeee!", image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'

    coffee_params = {
      coffee: {
        name: 'Caramel Macchiato',  
        size: '12 ounces',
        milk_type: nil,
        bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
        image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    }
      }
    coffee = Coffee.last
    patch "/coffees/#{coffee.id}", params: coffee_params
    updated_coffee = Coffee.find(coffee.id)
    expect(response).to have_http_status(422)
    json_response = JSON.parse(response.body)
    expect(json_response['milk_type']).to include("can't be blank")
    end
    it 'cannot update a coffee at a particular ID without a bio' do  
      Coffee.create name:'Caramel Macchiato', size:'12 ounces',milk_type: 'Oat milk', bio: "I'm sweet, creamy, and to the point, ohweeeeee!", image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'

    coffee_params = {
      coffee: {
        name: 'Caramel Macchiato',  
        size: '12 ounces',
        milk_type: 'Oat milk',
        bio: nil,
        image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    }
      }
    coffee = Coffee.last
    patch "/coffees/#{coffee.id}", params: coffee_params
    updated_coffee = Coffee.find(coffee.id)
    expect(response).to have_http_status(422)
    json_response = JSON.parse(response.body)
    expect(json_response['bio']).to include("can't be blank")
    end
    it 'cannot update a coffee at a particular ID without an image' do  
      Coffee.create name:'Caramel Macchiato', size:'12 ounces',milk_type: 'Oat milk', bio: "I'm sweet, creamy, and to the point, ohweeeeee!", image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    coffee_params = {
      coffee: {
        name: 'Caramel Macchiato',  
        size: '12 ounces',
        milk_type: 'Oat milk',
        bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
        image: nil
    }
      }
    coffee = Coffee.last
    patch "/coffees/#{coffee.id}", params: coffee_params
    updated_coffee = Coffee.find(coffee.id)
    expect(response).to have_http_status(422)
    json_response = JSON.parse(response.body)
    expect(json_response["image"]).to include("can't be blank")
    end
  end
