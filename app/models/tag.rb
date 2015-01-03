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

class Tag < ActiveRecord::Base
  belongs_to :entry

  def self.create_from_en_tag(en_tag)
    tag = Tag.find_by_guid(en_tag.guid)
    tag = Tag.new if tag.nil?

    if tag.update_sequence_num == en_tag.updateSequenceNum
      puts "[S][Tag][#{tag.update_sequence_num}]#{tag.guid}: '#{tag.name}'"
      return nil
    end

    tag.guid                = en_tag.guid
    tag.name                = en_tag.name
    tag.update_sequence_num = en_tag.updateSequenceNum

    tag.save

    puts "[U][Tag][#{tag.update_sequence_num}]#{tag.guid}: '#{tag.name}'"

  end

end
