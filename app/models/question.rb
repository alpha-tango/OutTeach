class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  validates :quiz, :text, presence: true

  def correct_answer
    self.answers.where(correct: true).first || self.answers.build
  end

  def correct_answer=(value)
    new_answer = Answer.new(text: value, correct: true)
    self.answers << new_answer
  end

  def wrong_answers
    wrong = []
    if self.answers.where(correct: false).empty?
      3.times { wrong << self.answers.build }
      return wrong
    else
      return self.answers.where(correct: false)
    end
  end

  def wrong_answers=(answer_params)
    binding.pry
    answer_params.values.each do |param|

    answer_params.map { |id, value| Answer.find_by(id, text: param["text"]) }
  end

  def user
    self.quiz.course.user
  end
end
