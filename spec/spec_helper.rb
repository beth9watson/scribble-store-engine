ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb", __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'

# Path to where we store files used for testing
TMP_FILES_PATH = "#{Rails.root}/files"

# Include the Engine Gem
include ScribbleStore

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
 config.mock_with :rspec
 config.use_transactional_fixtures = true
 config.infer_base_class_for_anonymous_controllers = false
 config.order = "random"

   config.after(:each) do
    if Rails.env.test? || Rails.env.cucumber?
      FileUtils.rm_rf(Dir["#{Rails.root}/support/uploads"])
    end 
  end
end

def uploaded_image
  Rack::Test::UploadedFile.new(File.open("#{TMP_FILES_PATH}/ruby.png"))
end

