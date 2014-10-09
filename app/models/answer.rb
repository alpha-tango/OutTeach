class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question, :text, :correct?, presence: true
end
