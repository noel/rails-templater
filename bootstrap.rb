rvm_lib_path = "#{`echo $rvm_path`.strip}/lib"
$LOAD_PATH.unshift(rvm_lib_path) unless $LOAD_PATH.include?(rvm_lib_path)
require 'rvm'

rvm_ruby = ARGV[0]
app_name = ARGV[1]

unless rvm_ruby
  puts "\n You need to specify a which rvm rubie to use."
end

unless app_name
  puts "\n You need to name your app."
end
  
@env = RVM::Environment.new(rvm_ruby)

puts "Creating gemset #{app_name} in #{rvm_ruby}"
@env.gemset_create(app_name)
puts "Now using gemset #{app_name}"
@env.gemset_use!(app_name)

puts "Installing bundler gem."
system("gem install bundler")
puts "Successfully installed bundler" #if @env.system("gem", "install", "bundler")

puts "Installing rails gem."
system("gem install rails")
puts "Successfully installed rails" #if @env.system("gem", "install", "rails")


template_file = File.join(File.expand_path(File.dirname(__FILE__)), 'templater.rb')

## changes db to use MySql
#system("rails new #{app_name} -JT -d mysql -m #{template_file}")

system("rails new #{app_name} -JT -m #{template_file}")
