class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name:"User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true
    
    has_many :active_relationships, foreign_key: "follower_id",
                                    class_name: "Relationship",
                                    dependent: :destroy
    has_many :followed_users, through: :active_relationships, source: :followed

    has_many :passive_relationships, foreign_key: "followed_id",
                                     class_name: "Relationship",
                                     dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
end
