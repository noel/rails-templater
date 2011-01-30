gem "simple_form"



stategies << lambda do
  puts "Beginning simple_form setup"
  run "rails generate simple_form:install"
  puts "simple_form has been setup"
end