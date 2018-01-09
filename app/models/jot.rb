class Jot < ApplicationRecord
    belongs_to :user
    has_one :jewel

    accepts_nested_attributes_for :jewel

    private

    def jot_params
        require(:jot).permit(:title, :body, :user_id, :jewel_attributes)
    end

end