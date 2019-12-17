class Party < ApplicationRecord
    has_one :list 
    has_many :party_users

   

end
