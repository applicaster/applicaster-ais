current_path = File.expand_path("../", __FILE__)
Dir["#{current_path}/**/*.rb"].each { |file| require file }

module Applicaster
  module Ais
    class << self

      def configure
        yield config
      end

      def config
        @config ||= Config.new
      end
    end
  end
end

if defined?(Rails)
  module Applicaster
    module Ais
      class Railtie < ::Rails::Railtie
        config.access_token = :access_token
        config.host = :host
        config.port = :port
      end
    end
  end
end
