class Course < ActiveRecord::Base
  has_many :assignments

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
end
