#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-08 00:34:29
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:47:27

require 'wot-api/statistics'

module Wot
  class PlayerStatistics
    attr_accessor :max_damage, :max_xp, :all, :clan, :company, :historical
    def initialize(data)
      @max_damage = data[:max_damage]
      @max_xp = data[:max_xp]
      @all = Wot::Statistics.new(data[:all])
      @clan = Wot::Statistics.new(data[:clan])
      @company = Wot::Statistics.new(data[:company])
      @historical = Wot::Statistics.new(data[:historical])
    end

    def max_damage_vehicle
      # TODO: return player's vehicle with maximum damage
    end
  end
end