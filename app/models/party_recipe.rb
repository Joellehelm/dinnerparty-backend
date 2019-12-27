class PartyRecipe < ApplicationRecord
    belongs_to :party
    belongs_to :recipe
    has_many :ingredients, through: :recipe
end

