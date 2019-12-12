class Party < ApplicationRecord
    belongs_to :list 
    has_one :list 
    has_many :party_users
end
