#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-24 00:25:52
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-25 00:18:40

module Wot
  class Player
    class Achievement

      attr_accessor :name, :current, :max

      def self.get_achievements(player,api)
        achievements = []
        response = api.player_achievements(player.id)
        data = response[:data][player.id.to_s]
        names = data[:achievements].keys + data[:max_series].keys
        names.each do |name|
          achievements << Wot::Player::Achievement.new(name,data[:achievements][name],data[:max_series][name])
        end
        return achievements
      end

      def initialize(name, current, max = nil)
        @name = name
        @current = current
        @max = max
      end
    end
  end
end