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

require 'spec_helper'

describe Tag do
  pending "add some examples to (or delete) #{__FILE__}"
end
