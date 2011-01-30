gem "nifty-generators", :group => :development




stategies << lambda do
  puts "Beginning creating the new layout"
  run "rails g nifty:layout --haml"
  remove_file 'app/views/layouts/application.html.haml'
  create_file 'app/views/layouts/application.html.haml', load_template('app/views/layouts/application.html.haml','haml')
  
  puts "layout has been created"
end