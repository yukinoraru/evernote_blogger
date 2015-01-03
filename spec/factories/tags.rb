# == Schema Information
#
# Table name: tags
#
#  id                  :integer          not null, primary key
#  guid                :string(255)
#  name                :string(255)
#  update_sequence_num :integer
#  entry_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    guid "MyString"
    name "MyString"
    update_sequence_num 1
    entry nil
  end
end
