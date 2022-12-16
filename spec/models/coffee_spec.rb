require 'rails_helper'
RSpec.describe "Coffee", type: :model do
    it "should validate presence of name" do
        coffee = Coffee.create size: "5 ounces", milk_type: "oat milk", bio: "love coffee", image: "https://www.dailydiylife.com/wp-content/uploads/2022/08/Iced-Caramel-Macchiato.jpg"
        expect(coffee.errors[:name]).to_not be_empty
    end
    it "should validate presence of size" do
        coffee = Coffee.create 
        expect(coffee.errors[:size]).to_not be_empty
    end
    it "should validate presence of milk_type" do
        coffee = Coffee.create 
        expect(coffee.errors[:milk_type]).to_not be_empty
    end
    it "should validate presence of bio" do
        coffee = Coffee.create 
        expect(coffee.errors[:bio]).to_not be_empty
    end
    it "should validate presence of image" do
        coffee = Coffee.create 
        expect(coffee.errors[:image]).to_not be_empty
    end
    it "should validate bio length to be 10" do
        coffee = Coffee.create name:"dopio", size:"1.5 ounces", milk_type:"almond milk", bio: "I'm hot a" 
        # expect(coffee.errors[:bio].first).to eq("is too short(min 10 characters)")
        expect(coffee.errors[:bio]).to_not be_empty
        p coffee.errors[:bio]
    end
end



