# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :body do |b|
    body = Faker::Lorem.characters(20)
  end

  factory :message do
    body
    to '6072620716'
    from '5038289722'
  end
end
