class Element < ActiveRecord::Base
  belongs_to :assignment

  validates :title, :citation, :assignment, :type_id, presence: true

  def user
    self.assignment.course.user
  end
end
