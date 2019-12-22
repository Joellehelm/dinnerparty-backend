class PartyUser < ApplicationRecord
    
    belongs_to :party, dependent: :destroy
    has_many :users, dependent: :destroy
end
