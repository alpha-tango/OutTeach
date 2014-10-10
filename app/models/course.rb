class Course < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :user, presence: true

  def self.authorized_find(user, id)
    where(user: user).find(id)
  end
end
