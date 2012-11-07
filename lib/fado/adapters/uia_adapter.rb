module Fado
  module Adapters
    class UiaAdapter
      attr_reader :window

      def initialize(locator)
        @window = RAutomation::Window.new(locator.merge(:adapter => :ms_uia))
      end

      def combo(locator)
        Fado::Accessors::Combo.new(self, locator)
      end

      def checkbox(locator)
        Fado::Accessors::CheckBox.new(self, locator)
      end

      def set_text(text, locator)
        window.text_field(locator).set text
      end

      def get_text(locator)
        window.text_field(locator).value
      end

      def clear_text(locator)
        window.text_field(locator).clear
      end

      def click_button(locator, &block)
        window.button(locator).click &block if block
        window.button(locator).click {true } unless block
      end

      def get_button_value(locator)
        window.button(locator).value
      end

      def set_radio(locator)
        window.radio(locator).set
      end

      def radio_is_set?(locator)
        window.radio(locator).set?
      end
    end
  end
end
