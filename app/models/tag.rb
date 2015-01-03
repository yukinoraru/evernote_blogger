class Tag < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :guid, :name, :update_sequence_num

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
