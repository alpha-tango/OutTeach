require 'rails_helper'

describe Element, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :citation }
  it { should validate_presence_of :assignment }
end
