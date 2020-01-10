class PartyUser < ApplicationRecord
    
    belongs_to :party
    has_one :users
    has_one :room, :through => :party
end
