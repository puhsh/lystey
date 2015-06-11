# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent do
    first_name 'Test'
    last_name 'Agent'
    trait :unregistered do
      registered false
    end

    trait :registered do
      registered true
    end
  end
end
