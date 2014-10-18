require 'rails_helper'

describe Enrollment, type: :model do

  it { should validate_presence_of :course }
  it { should validate_presence_of :user }
end
