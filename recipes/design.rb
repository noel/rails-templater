if template_options[:design] == "compass"  
  gem 'compass'
  gem "fancy-buttons"

  # TODO: support more than one framework from compass
  compass_sass_dir = "app/stylesheets"
  compass_css_dir = "public/stylesheets/"

  compass_command = "compass init rails . --using blueprint/semantic --css-dir=#{compass_css_dir} --sass-dir=#{compass_sass_dir} "
  compass_command += " --syntax sass -r fancy-buttons"

  stategies << lambda do
    puts "Beginning Compass setup"
    run compass_command
    puts "Compass has been setup"
  end
  
end
