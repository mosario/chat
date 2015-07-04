FactoryGirl.define do
  factory :message do
    content
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end
