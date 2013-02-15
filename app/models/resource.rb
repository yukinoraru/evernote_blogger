class Resource < ActiveRecord::Base
  attr_accessible :filename, :body, :extension, :mime, :body_hash
  belongs_to :entry

  def self.create_from_en_spider_resource en_resource
    self.create(
      :filename  => en_resource['filename'],
      :body      => en_resource['body'],
      :extension => en_resource['extension'],
      :mime      => en_resource['mime'],
      :body_hash => en_resource['hash']
    )
  end
end
