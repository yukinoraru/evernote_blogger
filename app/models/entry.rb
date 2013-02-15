class Entry < ActiveRecord::Base
  attr_accessible :title
  has_many :resources
end
