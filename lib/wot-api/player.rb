#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-01 01:20:11
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-09 23:19:09
module Wot
  class Player
    attr_accessor :id, :nickname
    def initialize(options,api)
      @api = api
      @id = options[:account_id]
      @nickname = options[:nickname]
    end

    def statistics
      unless @statistics
        @statistics = Wot::PlayerStatistics.new(info[:statistics])
      end
      return @statistics
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
          self.info = response[:data]
        end
      end
      return @info
    end

    def info=(data)
      @info = data[@id.to_s]
    end

    def clan_id
      return info[:clan_id]
    end

    def client_language
      return info[:client_language]
    end

    def created_at
      return Time.at(info[:created_at])
    end

    def global_rating
      return info[:global_rating]
    end

    def last_battle_time
      return Time.at(info[:last_battle_time])
    end

    def logout_at
      return Time.at(info[:logout_at])
    end

    private

    def api
      return @api
    end
  end
end

require 'wot-api/player_statistics'
require 'wot-api/error'