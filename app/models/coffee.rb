class Coffee < ApplicationRecord
    validates :name, :size, :milk_type, :bio, :image, presence:true
    validates :bio, length: {minimum: 10}
end
