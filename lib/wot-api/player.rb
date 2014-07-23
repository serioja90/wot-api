#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-01 01:20:11
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:46:55

require 'wot-api/error'

module Wot
  class Player
    attr_accessor :id, :nickname
    def initialize(options,api)
      @api = api
      @id = options[:account_id]
      @nickname = options[:nickname]
    end

    def vehicles
      unless @vehicles
        @vehicles = api.player_vehicles(@id)
      end
      return @vehicles
    end

    def achievements
      unless @achievements
        @achievements = api.player_achievements(@id)
      end
      return @achievements
    end

    def info
      unless @info
        response = api.players_info([@id.to_s])
        unless response.instance_of?(Wot::Error)
          @info = response[@id.to_s]
        end
      end
      return @info
    end

    private

    def api
      return @api
    end

    def method_missing(method_name, *args, &block)
      info
      return @info.send method_name
    end
  end
end