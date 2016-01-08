module Applicaster
  module Ais
    module Bucket
      def self.buckets(account_id, params = {})
        response = client.buckets(account_id_param(account_id).merge(params))
        response_parser.build_result(response)
      end

      def self.create(account_id, params = {})
        response = client.create_bucket(account_id_param(account_id).merge(params))
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
