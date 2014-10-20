class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :elements, dependent: :destroy
  default_scope { order('created_at ASC') }

  validates :title, :course, :importance, :goals, presence: true
  validates :title, length: { minimum: 3 }

  def user
    self.course.user
  end
end
