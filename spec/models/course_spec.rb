require 'rails_helper'

describe Course, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :description }
  it { should validate_presence_of :user }
end
