class Party < ApplicationRecord
    has_one :room, dependent: :destroy
    has_many :party_users, dependent: :destroy
    has_many :party_recipes, dependent: :destroy
    has_many :recipes, through: :party_recipes
    has_many :ingredients, through: :recipes

    validates :name, :presence => true
   

end
