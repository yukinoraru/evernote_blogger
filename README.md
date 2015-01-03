== Evernote Blogger

recommended: ruby 2.1.1 & rails 4.2.0

== Usage

  git clone https://github.com/macchima23/evernote_blogger.git
  cd evernote_blogger
  vim config/application.yml
  bundle
  rake db:create
  rake db:migrate
  rake evernote:get_auth_token
  rake evernote:update
  rails s

and access "localhost:3000"
