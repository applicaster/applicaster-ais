require "simplecov"
require "dotenv"
require "pry"

SimpleCov.start do
  add_filter "/spec/"
  add_filter ".bundle/"
end

ENV["RAILS_ENV"] ||= "test"

Dotenv.overload(
  File.join(Dir.pwd, ".env.local"),
  File.join(Dir.pwd, ".env.#{ENV['RAILS_ENV']}"),
  File.join(Dir.pwd, ".env"),
)

project_root = File.expand_path(File.dirname(__FILE__) + "/..")
$LOAD_PATH << "#{project_root}/lib"

Dir[("#{project_root}/spec/support/**/*.rb")].each {|f| require f}
require "applicaster/ais"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.before do
    Applicaster::Ais.configure do |c|
      c.access_token = ENV.fetch("ACCESS_TOKEN")
    end
  end

end
