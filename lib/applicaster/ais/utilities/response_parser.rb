module Applicaster
  module Ais
    module Utilites
      module ResponseParser
        def self.build_result(response)
          {
            data: response.data,
            meta_data: {
              status: response.status,
            }
          }
        end

      end
    end
  end
end
