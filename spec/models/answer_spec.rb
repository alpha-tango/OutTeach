require 'rails_helper'

describe Answer, type: :model do

  it { should validate_presence_of :text }
end
