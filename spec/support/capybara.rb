require 'capybara/rspec'

JS_DRIVER = :selenium_chrome_headless

# Capybara.default_driver = :rack_test

Capybara.javascript_driver = JS_DRIVER

Capybara.default_max_wait_time = 2

RSpec.configure do |config|
  config.before(:each) do |example|
    Capybara.current_driver = JS_DRIVER if example.metadata[:js]
    Capybara.current_driver = :selenium if example.metadata[:selenium]
    Capybara.current_driver = :selenium_chrome if example.metadata[:selenium_chrome]
  end
  config.after(:each) do
    Capybara.use_default_driver
  end
    config.use_transactional_fixtures = false
  
    config.before(:suite) do
      if config.use_transactional_fixtures?
        raise(<<-MSG)
          Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
          (or set it to false) to prevent uncommitted transactions being used in
          JavaScript-dependent specs.
  
          During testing, the app-under-test that the browser driver connects to
          uses a different database connection to the database connection used by
          the spec. The app's database connection would not be able to access
          uncommitted transaction data setup over the spec's database connection.
        MSG
      end
      DatabaseCleaner.clean_with(:truncation)
    end
  
    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end
  
    # config.before(:each, type: :feature) do
    #   # :rack_test driver's Rack app under test shares database connection
    #   # with the specs, so continue to use transaction strategy for speed.
    #   driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
  
    #   unless driver_shares_db_connection_with_specs
    #     # Driver is probably for an external browser with an app
    #     # under test that does *not* share a database connection with the
    #     # specs, so use truncation strategy.
    #     DatabaseCleaner.strategy = :truncation
    #   end
    # end
  
    config.before(:each) do
      DatabaseCleaner.start
    end
  
    config.append_after(:each) do
      DatabaseCleaner.clean
    end
  
  end