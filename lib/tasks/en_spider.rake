require "evernote_spider.rb"

namespace :en_spider do
  desc "get blog from evernote"
  task :get => :environment do

    es                  = EvernoteSpider.new(Settings.evernote.access_token)
    shareKey            = Settings.evernote.shared_notebooks.first["share_key"]
    notebook, authToken = es.get_shared_notebook(shareKey)
    note_list           = es.get_note_list(notebook, authToken)

    # タグの処理
    es.get_all_notebook_tags(notebook, authToken).each do |tag|
      Tag.create_from_en_tag(tag)
    end

    # ブログエントリ
    note_list.notes.each do |note|

      entry = Entry.create_from_note(note, es.get_note_xml(note, authToken))

      # エントリについているリソースの処理
      es.get_note_resources(note, authToken).each do |resource|
        tmp = Resource.create_from_en_spider_resource(resource)
        entry.resources << tmp unless tmp.nil?
      end

      tag_guids = note.tagGuids || []
      tag_guids.each do |guid|
        tag = Tag.find_by_guid(guid)
        entry.tags << tag unless entry.nil?
      end

    end
  end
end
