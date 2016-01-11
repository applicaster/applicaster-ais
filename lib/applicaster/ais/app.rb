module Applicaster
  module Ais
    module App
      def self.list(bucket_id, account_id, params = {})
        response = client.apps(bucket_id, account_id, params)
        response_parser.build_result(response)
      end

      def self.post(bucket_id, account_id, params = {})
        response = client.create_app(bucket_id, account_id, params)
        response_parser.build_result(response)
      end

      def self.get(app_id, bucket_id, account_id, params = {})
        response = client.get_app(app_id, bucket_id, account_id, params)
        response_parser.build_result(response)
      end

      def self.update(app_id, bucket_id, account_id, params = {})
        response = client.update_app(app_id, bucket_id, account_id, params)
        response_parser.build_result(response)
      end

      def self.client
        Client.new
      end

      def self.account_id_param(account_id)
        { account_id: account_id }
      end

      def self.response_parser
        Utilites::ResponseParser
      end
    end
  end
end

