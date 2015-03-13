
module Wot
  class Player
    class Tank

      attr_accessor :player, :data, :id, :mark_of_mastery, :battles, :win

      def initialize(player, data)
        @player          = player
        @data            = data
        @id              = data[:tank_id]
        @mark_of_mastery = data[:mark_of_mastery]
        @battles         = data[:statistics][:battles]
        @wins            = data[:statistics][:wins]
      end

      def api
        @player.api
      end
    end
  end
end