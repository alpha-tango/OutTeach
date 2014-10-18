class User < ActiveRecord::Base
  has_many :courses
  has_many :enrollments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true, length: { maximum: 16 }

  def admin?
    role == 'admin'
  end

  def may_destroy?(resource)
    resource.user == self || self.admin?
  end
end
