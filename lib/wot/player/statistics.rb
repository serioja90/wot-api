
module Wot
  class Player
    class Statistics
      attr_accessor :data, :max_damage, :max_xp, :all, :clan, :company, :historical

      def initialize(data)
        @data = data
        @max_damage = data[:max_damage]
        @max_xp = data[:max_xp]
        @all = Wot::Player::ExtendedStatistics.new(@data[:all])
        @clan = Wot::Player::ExtendedStatistics.new(@data[:clan])
        @company = Wot::Player::ExtendedStatistics.new(@data[:company])
        @historical = Wot::Player::ExtendedStatistics.new(@data[:historical])
      end
    end
  end
end