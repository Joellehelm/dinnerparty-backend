class PartyUser < ApplicationRecord
    
    belongs_to :party
    belongs_to :user
    has_one :room, :through => :party
end
