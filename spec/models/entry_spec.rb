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

require 'spec_helper'

describe Entry do
  pending "add some examples to (or delete) #{__FILE__}"
end
