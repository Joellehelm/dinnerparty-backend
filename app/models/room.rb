class Room < ApplicationRecord
    belongs_to :party
    has_many :messages
    has_many :users, through: :messages
end
