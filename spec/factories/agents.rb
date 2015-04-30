# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent do

    trait :unregistered do
      registered false
    end
    
    trait :registered do
      registered true
    end
  end
end
