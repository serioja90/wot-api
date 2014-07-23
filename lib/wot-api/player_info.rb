#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-15 00:13:51
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:47:16

require 'wot-api/player_statistics'

module Wot
  class PlayerInfo
    def initialize(data)
      @data = data
    end

    def statistics
      unless @statistics
        @statistics = Wot::PlayerStatistics.new(@data[:statistics])
      end
      return @statistics
    end

    def clan
    end

    def created_at
      return Time.at @data[:created_at]
    end

    def last_battle_time
      return Time.at @data[:last_battle_time]
    end

    def logout_at
      return Time.at @data[:logout_at]
    end

    def updated_at
      return Time.at @data[:updated_at]
    end

    def respond_to?(method_name)
      return @data.keys.include? method_name
    end

    private

    def method_missing(method_name, *args, &block)
      return @data[method_name.to_s]
    end
  end
end