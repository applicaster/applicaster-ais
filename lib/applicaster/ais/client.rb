module Applicaster
  module Ais
    class Client

      def buckets(params = {})
        get("backend/buckets.json", params)
      end

      def create_bucket(params = {})
        post("backend/buckets.json", params)
      end

      def apps(bucket_id, account_id, params = {})
        get("/backend/accounts/#{account_id}/buckets/#{bucket_id}/apps.json", params)
      end

      def create_app(bucket_id, account_id, params = {})
        post("/backend/accounts/#{account_id}/buckets/#{bucket_id}/apps.json", params)
      end

      def get_app(id, bucket_id, account_id, params = {})
        get("/backend/accounts/#{account_id}/buckets/#{bucket_id}/apps/#{id}.json", params)
      end

      def update_app(id, bucket_id, account_id, params = {})
        put("/backend/accounts/#{account_id}/buckets/#{bucket_id}/apps/#{id}.json", params)
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

      def put(path, params)
        api_response = request.put(path, params)
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
