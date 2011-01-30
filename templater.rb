require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater

#Create Gemspec 
create_file ".rvmrc", "rvm gemset use #{app_name}"

required_recipes = %w(default jquery haml rspec devise simple_form nifty-generator factory_girl remarkable)
required_recipes.each {|required_recipe| apply recipe(required_recipe)}

load_options

# apply(recipe('cucumber')) if yes?("Do you want to some cukes?")  
apply recipe('cucumber')
apply recipe('design')
apply recipe('mongoid')


inside app_name do
  run 'bundle install'
end

execute_stategies

generators_configuration = <<-END
config.generators do |g|
  g.template_engine :haml
  g.test_framework :rspec, :fixture => true, :views => false
  g.fixture_replacement :factory_girl, :dir => "spec/factories"
  g.stylesheets false
end
END

environment generators_configuration

git :add => "."
git :commit => "-m 'Initial commit'"  
