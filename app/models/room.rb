class Room < ApplicationRecord
    belongs_to :party
    has_many :messages, dependent: :destroy
    has_many :party_users, through: :party
    has_many :users, through: :party_users
    

end
