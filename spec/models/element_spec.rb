require 'rails_helper'

describe Element, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :citation }
  it { should validate_presence_of :assignment }
  it { should validate_presence_of :type_id}
  it { should ensure_length_of(:title).is_at_least(3) }
  it { should ensure_length_of(:citation).is_at_least(3) }
end
