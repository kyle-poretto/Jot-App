class User < ApplicationRecord
  has_many :jots
  has_many :jewels, through: :jots
  has_many :mutual_relationships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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

  private

end
