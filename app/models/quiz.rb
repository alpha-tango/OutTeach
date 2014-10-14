class Quiz < ActiveRecord::Base
  belongs_to :course
  has_many :questions, dependent: :destroy

  validates :course, :title, presence: true

  def user
    self.course.user
  end

  def score_answers(quiz_params)
    score = 0
    quiz_params["questions"].each do |question_id, answer_id|
      quiz_question = self.questions.find(question_id)
      if quiz_question.right_answer?(answer_id)
        score += 1
      end
    end
    "You got #{score} out of #{self.questions.length} questions correct!"
  end
end
