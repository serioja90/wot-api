#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:51:01
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-08 01:31:22
module Wot
  module Parser
    module_function

    def get_players_list(data,api)
      list = Wot::PlayerList.new(api)
      data.each do |item|
        list << Wot::Player.new(item,api)
      end
      return list
    end
  end
end

require 'wot-api/error'
require 'wot-api/player'
require 'wot-api/player_list'