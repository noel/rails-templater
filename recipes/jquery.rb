# gem "jquery-rails"

stategies << lambda do
  puts "Getting rails jquery-ujs file"
  # run "rails generate jquery:install --ui"
  
  run "curl https://github.com/rails/jquery-ujs/raw/master/src/rails.js >> public/javascripts/rails.js"
  
  gsub_file 'config/application.rb', 'config.action_view.javascript_expansions[:defaults] = %w()', 'config.action_view.javascript_expansions[:defaults] = %w(rails)'
  
  # gsub_file 'config/application.rb', 'require "rails/test_unit/railtie"', '# require "rails/test_unit/railtie"'
  
  
  puts "Done with jqury-ujs"
end