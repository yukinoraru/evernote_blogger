require "evernote_spider.rb"

namespace :en_spider do
  desc "get blog from evernote"
  task :get => :environment do

    es                  = EvernoteSpider.new(Settings.evernote.access_token)
    shareKey            = Settings.evernote.shared_notebooks.first["share_key"]
    notebook, authToken = es.get_shared_notebook(shareKey)
    note_list           = es.get_note_list(notebook, authToken)

    note_list.notes.each do |note|

      entry = Entry.find_by_guid(note.guid)
      entry = Entry.new if entry.nil?

      if entry.update_sequence_num == note.updateSequenceNum
        puts "[S][#{entry.update_sequence_num}]#{entry.guid}: '#{entry.title}'"
      else

        entry.guid                = note.guid
        entry.title               = note.title
        entry.original_updated_at = Time.at(note.updated.to_i / 1000)
        entry.original_created_at = Time.at(note.created.to_i / 1000)
        entry.update_sequence_num = note.updateSequenceNum
        entry.content             = es.get_note_xml(note, authToken)

        entry.save

        puts "[U][#{entry.update_sequence_num}]#{entry.guid}: '#{entry.title}'"
      end

      #
      es.get_note_resources(note, authToken).each do |resource|
        tmp = Resource.create_from_en_spider_resource(resource)
        entry.resources << tmp unless tmp.nil?
      end

      # TODO:
      # tags = es.get_note_tags(note, authToken)

    end
  end
end
