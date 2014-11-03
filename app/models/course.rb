class Course < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  has_many :enrollments
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :subject, presence: true
  validates :user, presence: true

  def self.authorized_find(user, id)
    where(user: user).find(id)
  end
end
