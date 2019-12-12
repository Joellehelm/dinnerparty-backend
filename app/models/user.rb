class User < ApplicationRecord
    has_secure_password
    has_many :party_users

    validates :username, :email, uniqueness: { case_sensitive: false }

   
  end