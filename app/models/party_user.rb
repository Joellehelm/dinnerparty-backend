class PartyUser < ApplicationRecord
    
    belongs_to :party
    has_many :users
end
