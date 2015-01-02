require "evernote_spider.rb"

namespace :en_spider do
  desc "get blog from evernote"
  task :get => :environment do

    es                  = EvernoteSpider.new(Settings.evernote.access_token)
    shareKey            = Settings.evernote.shared_notebooks.first["share_key"]
    notebook, authToken = es.get_shared_notebook(shareKey)
    note_list           = es.get_note_list(notebook, authToken)

    note_list.notes.each do |note|

      entry                     = Entry.new
      entry.title               = note.title
      entry.original_created_at = Time.at(note.created.to_i / 1000)
      entry.content             = es.get_note_xml(note, authToken)
      entry.save

      es.get_note_resources(note, authToken).each do |r|
        entry.resources << Resource.create_from_en_spider_resource(r)
      end

      # TODO:
      # tags = es.get_note_tags(note, authToken)

    end
  end
end
