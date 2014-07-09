#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:51:01
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-09 02:18:28
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
  end
end

require 'wot-api/error'
require 'wot-api/player'
require 'wot-api/vehicle'