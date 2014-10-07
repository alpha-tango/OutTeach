class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :elements

  validates :title, :course, presence: true
end
