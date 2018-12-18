module Applicaster
  module Ais
    module UsageReports
      def self.get(bucket_id, date = Time.now)
        response = client.usage_reports(bucket_id, date.strftime("%Y-%m-%d"))
        response_parser.build_result(response)
      end

      def self.client
        Client.new
      end

      def self.response_parser
        Utilites::ResponseParser
      end
    end
  end
end
