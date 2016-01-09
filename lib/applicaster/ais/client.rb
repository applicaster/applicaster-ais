module Applicaster
  module Ais
    class Client

      def buckets(params = {})
        get("backend/buckets.json", params)
      end

      def create_bucket(params = {})
        post("backend/buckets.json", params)
      end

      private

      def get(path, params = {})
        api_response = request.get(path, params)
        response(api_response)
      end

      def post(path, params = {})
        api_response = request.post(path, params)
        response(api_response)
      end

      def request
        Request
      end

      def response(api_response)
        Response.new(api_response)
      end

    end
  end
end
