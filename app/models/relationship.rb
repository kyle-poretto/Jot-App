class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
   
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def get_followers
    current_user.followers
	end
	
  def get_follower_jots
    get_followers.each do |follower|
			follower.jots
    end
	end
	
	def doesnt_follow_self
    errors.add(:base, 'You can\'t follow yourself') if current_user == follower
  end


end
