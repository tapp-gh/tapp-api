task :test do
    exec "rails db:migrate RAILS_ENV=test 
    && rails db:seed RAILS_ENV=test 
    && bundle exec rspec"
  end