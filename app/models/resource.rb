# encoding: utf-8
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

class Resource < ActiveRecord::Base
  belongs_to :entry

  def self.create_from_en_spider_resource(en_resource)

    raw      = en_resource[:raw]

    #
    resource = Resource.find_by_guid(raw.guid)

    if !resource.nil? && resource.update_sequence_num == raw.updateSequenceNum
      puts "\t[S][Res][#{raw.updateSequenceNum}] #{raw.guid}: #{en_resource[:filename]}"
      return nil
    end

    resource = Resource.new if resource.nil?

    resource.filename  = en_resource[:filename]
    resource.body      = en_resource[:body]
    resource.body_hash = en_resource[:bodyHash]
    resource.extension = (File.extname(resource.filename))
    resource.mime      = raw.mime
    resource.width     = raw.width
    resource.height    = raw.height
    resource.guid      = raw.guid
    resource.update_sequence_num = raw.updateSequenceNum

    resource.save
    puts "\t[U][Res][#{raw.updateSequenceNum}] #{raw.guid}: #{en_resource[:filename]}"

    return resource
  end
end
