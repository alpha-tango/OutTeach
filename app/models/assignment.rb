class Assignment < ActiveRecord::Base
  belongs_to :course
  
  validates :title, :course, presence: true
end
