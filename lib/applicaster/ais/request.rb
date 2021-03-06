require "faraday"
module Applicaster
  module Ais
    class Request
      attr_accessor :config

      def self.get(path, params = {})
        new.get(path, params)
      end

      def self.post(path, params = {})
        new.post(path, params)
      end

      def self.put(path, params)
        new.put(path,params)
      end

      def get(path, params = {})
        connection.get path, complete_params(params)
      end

      def post(path, params = {})
        connection.post path, complete_params(params)
      end

      def put(path, params = {})
        connection.put path, complete_params(params)
      end

      private

      def connection
        @connection ||= Faraday.new(url: config.host) do |connection|
          connection.request :json
          connection.adapter Faraday.default_adapter
        end
      end

      def complete_params(params = {})
        return params if params.has_key?(:access_token)
        params.merge(access_token: access_token)
      end

      def access_token
        config.access_token
      end

      def config
        Ais.config
      end
    end
  end
end
