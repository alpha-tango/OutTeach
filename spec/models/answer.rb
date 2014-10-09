require 'rails_helper'

describe Answer, type: :model do

  it { should validate_presence_of :text }
  it { should validate_presence_of :correct? }
  it { should validate_presence_of :question }
end
