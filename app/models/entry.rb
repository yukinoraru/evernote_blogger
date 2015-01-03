class Entry < ActiveRecord::Base
  attr_accessible :title

  has_many :resources
  has_many :tags

  def self.create_from_note(note, content)
    entry = Entry.find_by_guid(note.guid)
    entry = Entry.new if entry.nil?

    if entry.update_sequence_num == note.updateSequenceNum
      puts "[S][#{entry.update_sequence_num}]#{entry.guid}: '#{entry.title}'"
      return nil
    end

    entry.guid                = note.guid
    entry.title               = note.title
    entry.original_updated_at = Time.at(note.updated.to_i / 1000)
    entry.original_created_at = Time.at(note.created.to_i / 1000)
    entry.update_sequence_num = note.updateSequenceNum
    entry.content             = content

    entry.save

    puts "[U][#{entry.update_sequence_num}]#{entry.guid}: '#{entry.title}'"

    return entry
  end

end
