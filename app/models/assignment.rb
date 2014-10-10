class Assignment < ActiveRecord::Base
  belongs_to :course
  acts_as_list scope: :course
  has_many :elements, dependent: :destroy

  validates :title, :course, :importance, :goals, presence: true

  def user
    self.course.user
  end
end
