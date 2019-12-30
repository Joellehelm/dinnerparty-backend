class PartyRecipe < ApplicationRecord
    belongs_to :party
    belongs_to :recipe, dependent: :destroy
    has_many :ingredients, through: :recipe
end

