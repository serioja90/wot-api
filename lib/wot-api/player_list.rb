#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:59:00
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-08 01:31:26
module Wot
  class PlayerList
    def initialize(api)
      @api = api
      @players = []
    end

    def each
      @players.each do |player|
        yield(player)
      end
    end

    def [](index)
      return @players[index]
    end

    def <<(player)
      raise "Invalid player #{player.inspect}!" unless player.instance_of?(Wot::Player)
      # TODO: check for players uniqueness
      @players << player
    end

    def first
      return @players.first
    end

    def last
      return @players.last
    end

    def count
      @players.count
    end

    def to_a
      return @players
    end

    def empty?
      return @players.empty?
    end
  end
end

require 'wot-api/player'