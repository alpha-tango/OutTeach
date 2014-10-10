class Answer < ActiveRecord::Base
  belongs_to :question
  validates :text, :correct?, presence: true
end
