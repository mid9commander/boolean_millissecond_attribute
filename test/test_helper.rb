begin
  require 'rubygems'
  require 'test/unit'
  require 'shoulda'
  require File.dirname(__FILE__) + '/../../../../config/environment'
rescue LoadError
  require 'rubygems'

  # !!TODO Need to automate testing Rails > 2.1 and Rails < 2.1
  # gem 'activerecord', '=2.0.2'
  # gem 'activesupport', '=2.0.2'
  # gem 'actionpack', '=2.0.2'
  # gem 'activeresource', '=2.0.2'

  gem 'activerecord'
  gem 'actionpack'

  require 'test/unit'
  require 'shoulda'
  require 'active_record'
  require 'active_record/version'
  require 'action_controller'

end
require File.dirname(__FILE__) + '/../lib/boolean_millisecond_attribute'
require File.dirname(__FILE__) + '/resource'
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
ActiveRecord::Base.configurations = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(ENV['DB'] || 'sqlite3')
load(File.dirname(__FILE__) + '/schema.rb')

# begin
#   require 'rubygems'
#   require 'test/unit'
#   require 'active_support'
#   require 'active_record'
#   require 'active_record/version'
#   require 'action_controller'
#   require 'shoulda'
#   require File.dirname(__FILE__) + '/../lib/boolean_millisecond_attribute'
# rescue LoadError
#   puts 'boolean_millisecond_attribute tests rely on shoulda, and active_support'
# end

#Object.send :include, BooleanMillisecondAttribute

