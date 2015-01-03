# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    guid "MyString"
    name "MyString"
    update_sequence_num 1
    entry nil
  end
end
