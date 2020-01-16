class User < ApplicationRecord
    has_secure_password
    has_many :party_users
    has_many :messages
    has_many :rooms, through: :messages

    validates :username, :email, uniqueness: { case_sensitive: false }

   
  end