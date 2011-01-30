# Delete all unnecessary files
remove_file "README"
remove_file "public/index.html"
remove_file "public/robots.txt"
remove_file "public/images/rails.png"

create_file 'README'
create_file 'log/.gitkeep'
create_file 'tmp/.gitkeep'

gsub_file 'config/application.rb', 'require "rails/test_unit/railtie"', '# require "rails/test_unit/railtie"'

#  Info on shiv 
#  http://stackoverflow.com/questions/3855294/html5shiv-vs-dean-edwards-ie7-js-vs-modernizr-which-to-choose
# get "http://html5shiv.googlecode.com/svn/trunk/html5.js", "public/javascripts/html5.js"

git :init

append_file '.gitignore', load_template('gitignore','git')

gem 'rails3-generators'

#haml stuff has moved out of rails3-generators
gem 'haml-rails'