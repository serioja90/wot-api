
module Wot
  class Player
    class Statistics
      attr_accessor :player, :data, :max_frags_tank_id, :max_xp_tank_id, :max_xp, :trees_cut, :max_frags,
                    :max_damage_tank_id, :max_damage, :all, :clan, :company, :historical

      def initialize(player, data)
        @player     = player
        @data       = data

        @max_frags_tank_id  = data[:max_frags_tank_id]
        @max_xp_tank_id     = data[:max_xp_tank_id]
        @max_xp             = data[:max_xp]
        @trees_cut          = data[:trees_cut]
        @max_frags          = data[:trees_cut]
        @max_damage_tank_id = data[:max_damage_tank_id]
        @max_damage         = data[:max_damage]

        @all        = Wot::Player::ExtendedStatistics.new(@data[:all])
        @clan       = Wot::Player::ExtendedStatistics.new(@data[:clan])
        @company    = Wot::Player::ExtendedStatistics.new(@data[:company])
        @historical = Wot::Player::ExtendedStatistics.new(@data[:historical])
      end

      def api
        @player.api
      end
    end
  end
end