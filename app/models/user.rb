class User < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :answers, through: :lessons
    validates :name, presence: true, length: { maximum: 50 }
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                        format: { with: EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }, presence: true
    has_many :active_relationships, foreign_key: "follower_id",
                                    class_name: "Relationship",
                                    dependent: :destroy

    has_many :following, through: :active_relationships, source: :followed
    has_many :passive_relationships, foreign_key: "followed_id",
                                    class_name: "Relationship",
                                    dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    def lesson_taken(category)
        lessons.find_by(category_id: category.id)
    end
    def following?(other_user)
        active_relationships.find_by(followed_id:other_user.id)
    end
    def follow(other_user)
        active_relationships.create!(followed_id: other_user.id)
    end
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end
end
