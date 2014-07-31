
module Wot
  class Player
    class Info
      attr_accessor :player, :data, :api

      def initialize(player, api)
        @player = player
        @api = api
        response = api.players_info(player.id)
        @data = response[:data][player.id.to_s]
        @data.each do |key,_|
          self.send key
        end
      end

      def statistics
        @statistics ||= Wot::Player::Statistics.new(@data[:statistics])
        return @statistics
      end

      protected

      def method_missing(method_name, *args, &block)
        self.class.instance_eval do
          define_method method_name do 
            return @data[method_name]
          end
        end
      end
    end
  end
end