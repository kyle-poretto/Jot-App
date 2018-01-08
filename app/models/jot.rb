class Jot < ApplicationRecord
    belongs_to :user
    has_one :jewel

end