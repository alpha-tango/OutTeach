require 'rails_helper'

describe Course, type: :model do

  it { should_validate_presence_of :title }
  it { should_validate_presence_of :subject }
  it { should_validate_presence_of :description }
end
