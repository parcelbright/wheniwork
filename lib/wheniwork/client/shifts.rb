module WhenIWork
  class Client
    module Shifts

      def shifts(params = {}, options = {})
        get 'shifts', params, options
      end

      def shift(shift_id, params = {}, options = {})
        get "shifts/#{shift_id}", params, options
      end

    end
  end
end
