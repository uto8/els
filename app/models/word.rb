class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  
  validates :content, presence: true
  validate :only_one_correct_answer
  private
  def only_one_correct_answer
    if choices.select {|choice| choice.correct == true}.count != 1
      errors.add(:choices, ":Please select one correct answer only")
    end
  end
end
