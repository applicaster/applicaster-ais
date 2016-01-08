module Applicaster
  module Ais
    class Response
      def initialize(response)
        @response = response
      end

      def data
        raise Errors::NetworkError unless response.body
        response.body
      end

      def status
        status_code
      end

      def error
        status_code if status_code > 400
      end

      private

      attr_reader :response

      def status_code
        @status_code ||= response.status
      end
    end
  end
end
