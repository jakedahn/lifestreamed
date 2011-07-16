# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Lifestreamed::Application.initialize!

# load api keys from config file
API_KEYS = YAML.load_file("#{RAILS_ROOT}/config/api_keys.yml")
