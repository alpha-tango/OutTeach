class User < ActiveRecord::Base
  has_many :courses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true, length: { maximum: 16 }

  def admin?
    role == 'admin'
  end
end
