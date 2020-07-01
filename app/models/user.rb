class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :username, presence: true

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    # above allows following, below allows followers 
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

    has_secure_password
end
