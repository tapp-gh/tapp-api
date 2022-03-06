require 'simplecov'
require 'simplecov-console'
SimpleCov.start 'rails'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
])

SimpleCov.minimum_coverage 100
SimpleCov.start do
  add_filter "/config/"
  add_filter "/vendor/"
  add_filter "/lib/mq/"
  add_filter "/app/channels/"
  add_filter "/app/mailers/"
  add_filter "/app/jobs/"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  

  # if config.files_to_run.one?
  #   config.default_formatter = "doc"
  # end

  # config.profile_examples = 10

  # config.order = "random"

  # Kernel.srand config.seed
end
