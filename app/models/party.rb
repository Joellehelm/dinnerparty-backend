class Party < ApplicationRecord
    has_one :list 
    has_many :party_users, dependent: :destroy
    has_many :party_recipes, dependent: :destroy

   

end
