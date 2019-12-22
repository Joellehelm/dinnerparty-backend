class List < ApplicationRecord
    belongs_to :party, dependent: :destroy
    has_one :ingredient
end
