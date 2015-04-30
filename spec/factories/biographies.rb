FactoryGirl.define do
  factory :biography do
    
    trait :with_bios do
      short_bio "Hello"
      long_bio "Is it me you are looking for?"
    end

    trait :with_title do
      title "Lionel Riche"
    end
  end

end
