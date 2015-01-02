# encoding: utf-8
class Resource < ActiveRecord::Base
  attr_accessible :filename, :body,  :extension, :mime,
                  :height,   :width, :guid,      :body_hash,
                  :update_sequence_num

  belongs_to :entry

  def self.create_from_en_spider_resource(en_resource)

    raw      = en_resource[:raw]

    #
    resource = Resource.find_by_guid(raw.guid)

    if !resource.nil? && resource.update_sequence_num == raw.updateSequenceNum
      puts "\t[S][#{raw.updateSequenceNum}] #{raw.guid}: #{en_resource[:filename]}"
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
    puts "\t[U][#{raw.updateSequenceNum}] #{raw.guid}: #{en_resource[:filename]}"

    return resource
  end
end
