require "evernote_spider.rb"

namespace :evernote do

  desc "retrieve entry/resource/tag from evernote and store to db"
  task :update => :environment do

    #related to unknown error: "OpenSSL::SSL::SSLError SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: "
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE    #TODO: remove unsecure code

    #TODO: host for production env
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

  desc "get auth token using consumer key/secret"
  task :get_auth_token => :environment do
    require 'rack'
    puts "retrieve access token from sandobox.evernote.com ..."

    key      = Settings.evernote.consumer_key
    secret   = Settings.evernote.consumer_secret
    sandbox  = Settings.evernote.sandbox

    client = EvernoteOAuth::Client.new(consumer_key: key, consumer_secret: secret, sandbox: sandbox)

    begin

      #
      request_token = client.request_token(:oauth_callback => "http://127.0.0.1:9999/")
      authorize_url = request_token.authorize_url

      #
      if Gem.win_platform?
        system('start', authorize_url)
      else
        # require OSX, not linux
        system('open', authorize_url)
      end

      # Create callback web app and get access token.
      app = Proc.new do |env|
              access_token = nil

              # when callback reqeust
              if env['PATH_INFO'] == '/'

                # fetch GET params to gen access token
                req = Rack::Request.new(env)
                oauth_verifier = req.params["oauth_verifier"]

                #
                access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)
                puts "access token: #{access_token.token}"

                Rack::Handler::WEBrick.shutdown
              end

              # Webrick response
              [
                '200',
                {'Content-Type' => 'text/html'},
                [(access_token.nil?) ? "this is callback app." : access_token.token]
              ]
            end

      # Enable 'Ctrl+C' on WEBrick
      Signal.trap('INT') {
        Rack::Handler::WEBrick.shutdown
      }

      handler = Rack::Handler::WEBrick

      # run WEBrick with silent mode
      # nil means $stderr
      handler.run(app, :Port => 9999, :Logger => WEBrick::Log.new(nil), AccessLog: [])

    rescue => e
      puts "Error obtaining temporary credentials: #{e.message}"
    end

  end

end
