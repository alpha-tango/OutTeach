class Quiz < ActiveRecord::Base
  belongs_to :course

  validates :course, :title, presence: true
end
