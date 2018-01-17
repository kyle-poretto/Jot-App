class Jewel < ApplicationRecord
    belongs_to :jot, optional: true
    has_one :user, through: :jot

    
    
end
