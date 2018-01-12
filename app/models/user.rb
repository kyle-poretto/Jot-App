class User < ApplicationRecord
  has_many :jots
  has_many :jewels, through: :jots
  has_many :mutual_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :nonmutual_relationships, class_name:  "Relationship",
                                     foreign_key: "followed_id",
                                     dependent:   :destroy

  has_many :following, through: :mutual_relationships, source: :followed

  has_many :followers, through: :nonmutual_relationships, source: :follower
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Follows a user :)

  def follow(other_user)
    following << other_user
  end

  #Unfollows a user :(

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def self.most_popular
    @ordered_users = User.all.sort{|a,b| b.followers.count <=> a.followers.count}
  end


  def low_following_count?
    self.following.count < 10
  end

  private

end
