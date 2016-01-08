module SpecHelpers
  RSpec.configure do |config|
    config.include self
  end

  def configure_access_token
    Applicaster::Ais.configure do |config|
      config.access_token = "test-token"
    end
  end
end
