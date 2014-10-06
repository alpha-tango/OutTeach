class Course < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
end
