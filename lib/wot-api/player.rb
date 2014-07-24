#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-01 01:20:11
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-24 23:34:13

module Wot
  class Player
    autoload :Info,                   'wot-api/player/info'
    autoload :Tank,                   'wot-api/player/tank'
    autoload :Achievement,            'wot-api/player/achievement'
    autoload :Statistics,             'wot-api/player/statistics'
    autoload :ExtendedStatistics,     'wot-api/player/extended_statistics'

    attr_accessor :id, :account_id, :nickname, :api
    def initialize(options,api)
      @api = api
      @id = options[:account_id]
      @account_id = @id
      @nickname = options[:nickname]
    end

    def tanks
      @tanks ||= Wot::Player::Tank.get_tanks(self,@api)
      return @tanks
    end

    def achievements
      unless @achievements
        @achievements = api.player_achievements(@id)
      end
      return @achievements
    end

    def info
      @info ||= Wot::Player::Info.new(self, @api)
      return @info
    end

    private

    def method_missing(method_name, *args, &block)
      info
      return @info.send method_name
    end
  end
end