class Quiz < ActiveRecord::Base
  belongs_to :course
  has_many :questions, dependent: :destroy

  validates :course, :title, presence: true

  def user
    self.course.user
  end
end
