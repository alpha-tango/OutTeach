class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  validates :quiz, :text, presence: true

  def correct_answer
    answers.each do |answer|
      return answer if answer.correct? == true
    end
  end
end
