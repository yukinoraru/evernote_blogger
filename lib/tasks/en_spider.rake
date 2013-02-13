require "pp"
require "evernote_spider.rb"

namespace :en_spider do
  desc "get blog from evernote"
  task :get => :environment do
    es     = EvernoteSpider.new(Settings.evernote.authToken)
    shareKey            = Settings.sharedNotebook.shareKey
    notebook, authToken = es.get_shared_notebook(shareKey)
    note_list = es.get_note_list(notebook, authToken)

    note_list.notes.each do |note|
      #resources    = es.get_note_resources(note, authToken)
      #tags         = es.get_note_tags(note, authToken)
      #xml_content  = es.get_note_xml(note, authToken)
      Entry.create(:title => note.title)
    end
  end
end
