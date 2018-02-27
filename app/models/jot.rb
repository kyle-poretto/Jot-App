class Jot < ApplicationRecord
  belongs_to :user, optional: true
	has_one :jewel
	
  validates :body, presence: true
  validates :title, presence: true


end