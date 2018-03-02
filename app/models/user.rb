class User < ApplicationRecord
  has_many :jots
  has_many :jewels, through: :jots
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :nonmutual_relationships, class_name:  "Relationship",
                                     foreign_key: "followed_id",
                                     dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :nonmutual_relationships, source: :follower
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  devise :omniauthable, omniauth_providers: [:facebook]

  #Follows a user :)

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end


  def follow(other_user)
    if following?(other_user)
      raise "whattup man"
    else 
      following << other_user
    end
    
  end


  #Unfollows a user :(

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def most_popular
    @ordered_users = User.all.sort{|a,b| b.followers.count <=> a.followers.count}
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end


  def low_following_count?
    self.following.count < 10
  end


end

