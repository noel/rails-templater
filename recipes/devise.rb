gem "devise"


stategies << lambda do
  puts "Beginning Devise setup"
  run "rails generate devise:install"

  puts "Modifying development configuration files for Devise..."
  gsub_file 'config/environments/development.rb', /# Don't care if the mailer can't send/, '### ActionMailer Config'
  gsub_file 'config/environments/development.rb', /config.action_mailer.raise_delivery_errors = false/ do
  <<-RUBY
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
    # A dummy setup for development - no deliveries, but logged
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = false
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default :charset => "utf-8"
  RUBY
  end



  puts "Creating Devise user model"
  run "rails generate devise User"
  puts "Migrating database to add User Model"
  run "rake db:migrate"
  
  puts "Devise has been setup"
end