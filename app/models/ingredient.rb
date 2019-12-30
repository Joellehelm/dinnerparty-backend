class Ingredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :party
    has_many :user_ingredients, dependent: :destroy
end
