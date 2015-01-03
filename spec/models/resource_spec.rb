# == Schema Information
#
# Table name: resources
#
#  id                  :integer          not null, primary key
#  filename            :string(255)
#  body                :binary(16777215)
#  extension           :string(255)
#  mime                :string(255)
#  body_hash           :string(255)
#  entry_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  guid                :string(255)
#  update_sequence_num :integer
#  width               :integer
#  height              :integer
#

require 'spec_helper'

describe Resource do
  pending "add some examples to (or delete) #{__FILE__}"
end
