#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:51:01
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-25 00:22:37

require 'wot-api/player'
require 'wot-api/achievement'

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

    def get_achievements_list(data)
      achievements = {}
      data.each do |name,item|
        achievements[name] = Wot::Achievement.new(item)
      end
      return achievements
    end
  end
end