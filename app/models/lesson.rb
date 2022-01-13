class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  belongs_to :user
  belongs_to :category
  has_one :activity, as: :action, dependent: :destroy
  after_create :lesson_activity

  def next_word
    (category.words - words).first
  end
  def lesson_result
    choices.where(correct: true).count
  end
  private
  def lesson_activity
    create_activity(user: user)
  end
end
