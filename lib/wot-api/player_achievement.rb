#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-10 00:51:08
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-10 02:01:28
module Wot
  class PlayerAchievement
    attr_accessor :name, :count, :max_series
    def initialize(name,count,max_series,api)
      @name = name
      @count = count
      @max_series = max_series
      @api = api
    end

    def achievement
      unless @achievement
        @achievement = api.achievements_list[@name]
      end
      return @achievement
    end

    def responds_to?(method_name)
      achievement
      return @achievement && @achievement.responds_to?(method_name)
    end

    private

    def api
      return @api
    end

    def method_missing(method_name, *args, &block)
      achievement
      return @achievement.send method_name unless @achievement.nil?
    end
  end
end