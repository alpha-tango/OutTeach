class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :elements, dependent: :destroy

  validates :title, :course, :importance, :goals, presence: true
end
