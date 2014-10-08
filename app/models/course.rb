class Course < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :user, presence: true
end
