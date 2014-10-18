class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :elements, dependent: :destroy

  validates :title, :course, :importance, :goals, presence: true
  validates :title, length: { minimum: 3 }

  def user
    self.course.user
  end
end
