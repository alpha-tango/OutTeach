require 'rails_helper'

describe Quiz, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :course }
end
