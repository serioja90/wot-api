#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-08 00:38:07
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-08 01:30:22
module Wot
  class Statistics
    attr_accessor :battles, :capture_points, :damage_dealt, :damage_received, :draws, :dropped_capture_points,
                  :frags, :hits, :losses, :shots, :spotted, :survived_battles, :wins, :xp
    def initialize(data)
      @battles = data[:battles]
      @capture_points = data[:capture_points]
      @damage_dealt = data[:damage_dealt]
      @damage_received = data[:damage_received]
      @draws = data[:draws]
      @dropped_capture_points = data[:dropped_capture_points]
      @frags = data[:frags]
      @hits = data[:hits]
      @losses = data[:losses]
      @shots = data[:shots]
      @spotted = data[:spotted]
      @survived_battles = data[:survived_battles]
      @wins = data[:wins]
      @xp = data[:xp]
    end

    def battle_avg_exp
      return  @xp.to_f / @battles.to_f
    end

    def hits_percent
      return @shots.to_f / @hits.to_f
    end
  end
end