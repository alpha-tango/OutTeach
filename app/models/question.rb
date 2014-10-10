class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  validates :quiz, :text, presence: true

  def correct_answer
    self.answers.where(correct?: true).pluck(:text).first || ""
  end

  def correct_answer=(value)
    new_answer = Answer.new(text: value, correct?: true)
    self.answers << new_answer
  end

  def self.build_new
    question = Question.new
    3.times { question.answers.build }
    question
  end

  def wrong_answers
    wrong = []
    if self.answers.where(correct?: false).empty?
      3.times { wrong << self.answers.build }
      return wrong
    else
      return self.answers.where(correct?: false)
    end
  end

  def wrong_answers=(values)
    values.each_value do |value|
      self.answers << Answer.new(text: value["text"])
    end
  end
end
