class Recipe < ApplicationRecord
    has_many :party_recipes
    has_many :ingredients, dependent: :destroy
    
end
