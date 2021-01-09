FactoryBot.define do
  factory :recipe do
    association :user

    name              { Faker::Name.name }
    person_id         { 1 }
    material          { Faker::Lorem.sentence }
    step1             { Faker::Lorem.sentence }
    step2             { '' }
    step3             { '' }
    step4             { '' }
    
  end
end