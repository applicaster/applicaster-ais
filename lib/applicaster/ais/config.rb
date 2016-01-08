module Applicaster
  module Ais
    class Config
      DEFAULT_HOST = "https://ais.applicaster.com"
      DEFAULT_PORT = 443

      attr_accessor :access_token, :host, :port

      def initialize(host = nil, port = nil)
        @host = host || DEFAULT_HOST
        @port = port || DEFAULT_PORT
      end
    end
  end
end
