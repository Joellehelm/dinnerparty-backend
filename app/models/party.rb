class Party < ApplicationRecord
    has_one :list
    has_many :party_users
    has_many :party_recipes
    has_many :ingredients, :through => :party_recipes, :source => :recipes


   

end
