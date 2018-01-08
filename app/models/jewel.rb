class Jewel < ApplicationRecord
    belongs_to :jot
    has_one :user, through: :jot
    
end
