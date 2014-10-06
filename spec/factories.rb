FactoryGirl.define do
  factory :course do
    title "All About Interwebs"
    subject "Interwebs"
    description "So much interwebs info oh wow."
  end

  factory :assignment do
    sequence(:title) { |n| "Interwebs Part #{ n }" }
    association :course
  end
end
