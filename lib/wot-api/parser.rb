#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:51:01
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-10 01:32:06
module Wot
  module Parser
    module_function

    def get_players_list(data,api)
      list = []
      data.each do |item|
        list << Wot::Player.new(item,api)
      end
      return list
    end

    def get_player_vehicles(data,api)
      vehicles = []
      data.each do |item|
        vehicles << Wot::Vehicle.new(item,api)
      end
      return vehicles
    end

    def get_player_achievements(data,api)
      achievements = []
      max_series = data[:max_series]
      data[:achievements].each do |name,count|
        achievements << Wot::PlayerAchievement.new(name,count,max_series[name],api)
      end
      return achievements
    end

    def get_achievements_list(data)
      achievements = {}
      data.each do |name,item|
        achievements[name] = Wot::Achievement.new(item)
      end
      return achievements
    end
  end
end

require 'wot-api/error'
require 'wot-api/player'
require 'wot-api/vehicle'
require 'wot-api/achievement'
require 'wot-api/player_achievement'