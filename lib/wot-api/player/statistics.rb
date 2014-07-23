#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-24 01:15:50
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-24 01:36:56

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