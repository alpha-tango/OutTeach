class Element < ActiveRecord::Base
  belongs_to :assignment

  validates :title, :citation, :assignment, presence: true
end
