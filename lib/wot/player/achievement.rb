
module Wot
  class Player
    class Achievement

      attr_accessor :name, :current, :max

      def initialize(name, current, max = nil)
        @name = name
        @current = current
        @max = max
      end
    end
  end
end