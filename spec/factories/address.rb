# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    line_1 '123 Main'
    city 'Dallas'
    state 'TX'
    zipcode '75067'
  end
end
