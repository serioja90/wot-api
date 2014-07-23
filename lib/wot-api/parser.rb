#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:51:01
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:46:21

require 'wot-api/player'
require 'wot-api/vehicle'
require 'wot-api/player_achievement'
require 'wot-api/achievement'
require 'wot-api/player_info'

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

    def get_players_info(data)
      players_info = {}
      data.each do |id,item|
        players_info[id.to_s] = Wot::PlayerInfo.new(item)
      end
      return players_info
    end
  end
end