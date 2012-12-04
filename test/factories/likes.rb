# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
    user_id 1
    entity_id 1
    entity_type "MyString"
  end
end
