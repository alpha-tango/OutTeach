require 'rails_helper'

describe Course, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :description }
  it { should validate_presence_of :user }
  it { should ensure_length_of(:title).is_at_least(3) }
  it { should ensure_length_of(:description).is_at_least(10) }
end
