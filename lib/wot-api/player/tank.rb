#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-23 23:13:16
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-24 23:45:48

module Wot
  class Player
    class Tank

      attr_accessor :data, :id, :mark_of_mastery, :battles, :wins

      def self.get_tanks(player,api)
        tanks = []
        response = api.player_tanks(player.id)
        response[:data][player.id.to_s].each do |item|
          tanks << Wot::Player::Tank.new(item)
        end
        return tanks
      end

      def initialize(data)
        @data = data
        @id = @data[:tank_id]
        @mark_of_mastery = @data[:mark_of_mastery]
        @battles = @data[:statistics][:battles]
        @wins = @data[:statistics][:wins]
      end
    end
  end
end