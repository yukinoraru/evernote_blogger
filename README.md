== Evernote Blogger

recommended: ruby 2.1.1 & rails 4.2.0

== Usage

```
cd evernote_blogger
vim config/application.yml
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake evernote:get_auth_token
bundle exec rake evernote:update
rails s
```

and access "localhost:3000"
