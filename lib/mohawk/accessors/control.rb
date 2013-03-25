module Mohawk
  module Accessors
    class Control
      def initialize(adapter, locator)
        @adapter = adapter
        @control = adapter.window.value_control(locator)
      end

      def value
        @control.value
      end
    end
  end
end