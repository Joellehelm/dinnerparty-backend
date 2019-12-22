class Ingredient < ApplicationRecord
    # belongs_to :recipe 
    has_many :user_ingredients
end
