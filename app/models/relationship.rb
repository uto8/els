class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name:"User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true
    has_one :activity, as: :action, dependent: :destroy
    after_create :relationship_activity
    private
    def relationship_activity
        create_activity(user: follower)
    end
end
