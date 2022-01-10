class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  belongs_to :user
  belongs_to :category

  def next_word
    (category.words - words).first
  end
  def lesson_result
    choices.where(correct: true).count
  end
end
