# == Schema Information
#
# Table name: entries
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  original_created_at :datetime
#  content             :text(65535)
#  guid                :string(255)
#  update_sequence_num :integer
#  original_updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    title "MyString"
  end
end
