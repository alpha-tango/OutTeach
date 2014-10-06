require 'rails_helper'

describe Assignment, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :course }
end
