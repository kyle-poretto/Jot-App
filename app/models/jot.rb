class Jot < ApplicationRecord
    belongs_to :user, optional: true
    has_one :jewel

    validates :body, presence: true # length: { minimum: 10 }, message: "You need a longer jot than that!"
    validates :title, presence: true # length: { minimum: 3 }, message: "You need a title for your jot than that!"

    accepts_nested_attributes_for :jewel


end