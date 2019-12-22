class PartyRecipe < ApplicationRecord
    belongs_to :party
    belongs_to :recipe
end

