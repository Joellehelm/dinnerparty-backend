class Party < ApplicationRecord
    has_one :room
    has_many :party_users, dependent: :destroy
    has_many :party_recipes, dependent: :destroy
    has_many :ingredients, :through => :party_recipes, :source => :recipes

    validates :name, :presence => true
   

end
